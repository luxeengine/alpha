package luxe.importers.tiff;

import haxe.io.Bytes;
import snow.utils.UInt8Array;

// http://partners.adobe.com/public/developer/en/tiff/TIFF6.pdf

class TiffDecoder {
    private var data:Bytes;
    private var is_big_endian:Bool;
    private var ifd_offset:Int;

    public function new(data:Bytes):Void {
        if (data.length < 8) {
            throw "invalid header: size";
        }

        this.data = data;

        if (data.get(0) == 0x4d && data.get(1) == 0x4d) {
            is_big_endian = true;
        } else if (data.get(0) == 0x49 && data.get(1) == 0x49) {
            is_big_endian = false;
        } else {
            throw "invalid header: Identifier";
        }

        if (get_ushort(2) != 0x2a) {
            throw "invalid header: Version";
        }

        ifd_offset = get_ulong(4);

        if (ifd_offset >= data.length) {
            throw "invalid header: IFDOffset";
        }
    }

    public function run():TiffImage {
        return parse_ifd(ifd_offset);
    }

    private function parse_ifd(pos:Int):TiffImage {
        var num_dir_entries = get_ushort(pos);
        pos += 2;

        var tag_map = new Map<Int, Array<Int>>();

        for (i in 0 ... num_dir_entries) {
            parse_tag(pos, tag_map);
            pos += 12;
        }

        // get_ulong(pos) - next IFD offset, but:
        // "A Baseline TIFF reader is not required to read any IFDs beyond the first one"

        return parse_image(tag_map);
    }

    private function parse_image(tag_map:Map<Int, Array<Int>>):TiffImage {
        if (!tag_map.exists(cast TagId.ImageWidth)
            || !tag_map.exists(cast TagId.ImageLength)
            || !tag_map.exists(cast TagId.PhotometricInterpretation)
            || !tag_map.exists(cast TagId.StripOffsets)
            || !tag_map.exists(cast TagId.StripByteCounts)
        ) {
            throw "required tags are missing: ImageWidth | ImageLength | PhotometricInterpretation | StripOffsets | StripByteCounts";
        }

        if (tag_map[cast TagId.PhotometricInterpretation][0] != cast PhotometricInterpretation.RGB) {
            throw "PhotometricInterpretation must be = RGB";
        }

        if (get_or_default(tag_map, TagId.Compression, [cast Compression.Uncompressed])[0] != cast Compression.Uncompressed) {
            throw "Compression must be = Uncompressed";
        }

        if (get_or_default(tag_map, TagId.Orientation, [1])[0] != 1) {
            throw "Orientation must be = 1";
        }

        if (get_or_default(tag_map, TagId.PlanarConfiguration, [cast PlanarConfiguration.Chunky])[0] != cast PlanarConfiguration.Chunky) {
            throw "PlanarConfiguration must be = Chunky";
        }

        var image_length = tag_map[cast TagId.ImageLength][0];
        var rows_per_strip = get_or_default(tag_map, TagId.RowsPerStrip, [0xffffffff])[0];
        var strips_per_image = Std.int((image_length + rows_per_strip - 1) / rows_per_strip);

        if (get_or_default(tag_map, TagId.SamplesPerPixel, [1])[0] != 4) {
            throw "SamplesPerPixel must be = 4";
        }

        if (!compare_array(get_or_default(tag_map, TagId.BitsPerSample, [1, 1, 1, 1]), [8, 8, 8, 8])) {
            throw "BitsPerSample must be = [8, 8, 8, 8]";
        }

        var sample_format = get_or_default(
            tag_map,
            TagId.SampleFormat,
            [cast SampleFormat.Unsigned, cast SampleFormat.Unsigned, cast SampleFormat.Unsigned, cast SampleFormat.Unsigned]
        );

        for (i in 0 ... sample_format.length) {
            if (sample_format[i] == cast SampleFormat.Undefined) {
                sample_format[i] = cast SampleFormat.Unsigned;
            }
        }

        if (!compare_array(
            sample_format,
            [cast SampleFormat.Unsigned, cast SampleFormat.Unsigned, cast SampleFormat.Unsigned, cast SampleFormat.Unsigned]
        )) {
            throw "unsupported SampleFormat value";
        }

        var extra_samples = get_or_default(tag_map, TagId.ExtraSamples, []);

        if (extra_samples.length != 1) {
            throw "ExtraSamples.length must be = 1";
        }

        var extra_sample_value:Int = extra_samples[0];

        if ((extra_sample_value != cast ExtraSamples.AssociatedAlpha) && (extra_sample_value != cast ExtraSamples.UnassociatedAlpha)) {
            throw "unsupported ExtraSamples value";
        }

        var strip_offsets = tag_map[cast TagId.StripOffsets];

        if (strip_offsets.length != strips_per_image) {
            throw "invalid StripOffsets length";
        }

        var strip_byte_counts = tag_map[cast TagId.StripByteCounts];

        if (strip_offsets.length != strips_per_image) {
            throw "invalid StripByteCounts length";
        }

        var image_width = tag_map[cast TagId.ImageWidth][0];
        var computed_size = Lambda.fold(strip_byte_counts, function(a:Int, b:Int):Int { return a + b; }, 0);

        if (image_width * image_length * 4 != computed_size) {
            throw "invalid StripByteCounts value";
        }

        for (bc in strip_byte_counts) {
            if (bc % 4 != 0) {
                throw "each StripByteCounts element must be dividable by 4";
            }
        }

        var pixels = new UInt8Array(computed_size);
        var position = 0;

        for (i in 0 ... strips_per_image) {
            var offset = strip_offsets[i];

            for (j in 0 ... strip_byte_counts[i]) {
                pixels[position++] = data.get(offset++);
            }
        }

        return {
            width: image_width,
            height: image_length,
            pixels: pixels,
        };
    }

    private function get_or_default(tag_map:Map<Int, Array<Int>>, tag_id:TagId, def:Array<Int>):Array<Int> {
        return (tag_map.exists(cast tag_id) ? tag_map[cast tag_id] : def);
    }

    private function compare_array(a:Array<Int>, b:Array<Int>):Bool {
        if (a.length != b.length) {
            return false;
        }

        for (i in 0 ... a.length) {
            if (a[i] != b[i]) {
                return false;
            }
        }

        return true;
    }

    private function parse_tag(pos:Int, tag_map:Map<Int, Array<Int>>):Void {
        var tag_id:TagId = cast get_ushort(pos);

        switch (tag_id) {
            case ImageWidth
                    | ImageLength
                    | BitsPerSample
                    | Compression
                    | PhotometricInterpretation
                    | StripOffsets
                    | Orientation
                    | SamplesPerPixel
                    | RowsPerStrip
                    | StripByteCounts
                    | PlanarConfiguration
                    | ExtraSamples
                    | SampleFormat:
                tag_map[cast tag_id] = parse_tag_data(pos);

            default:
        }
    }

    private function parse_tag_data(pos:Int):Array<Int> {
        var data_type:DataType = cast get_ushort(pos + 2);
        var data_count = get_ulong(pos + 4);

        if (data_count == 0) {
            throw "data count is zero";
        }

        var size_in_bytes = data_count * switch (data_type) {
            case BYTE | ASCII | SBYTE | UNDEFINED: 1;
            case SHORT | SSHORT: 2;
            case LONG | SLONG: 4;
            case FLOAT: throw "unsupported data type: FLOAT"; // 4
            case RATIONAL | SRATIONAL | DOUBLE: throw "unsupported data type: RATIONAL | SRATIONAL | DOUBLE"; // 8
        };

        var data_pos = (size_in_bytes <= 4 ? pos + 8 : get_ulong(pos + 8));
        var result = new Array<Int>();

        for (i in 0 ... data_count) {
            switch (data_type) {
                case BYTE | ASCII | UNDEFINED:
                    result.push(data.get(data_pos));
                    data_pos++;

                case SBYTE:
                    result.push(get_sbyte(data_pos));
                    data_pos++;

                case SHORT:
                    result.push(get_ushort(data_pos));
                    data_pos += 2;

                case SSHORT:
                    result.push(get_sshort(data_pos));
                    data_pos += 2;

                case LONG:
                    result.push(get_ulong(data_pos));
                    data_pos += 4;

                case SLONG:
                    result.push(get_slong(data_pos));
                    data_pos += 4;

                default:
            }
        }

        return result;
    }

    private function get_sbyte(pos:Int):Int {
        var value = data.get(pos);
        return (value <= 0x7f ? value : value - 0x100);
    }

    private function get_ushort(pos:Int):Int {
        if (is_big_endian) {
            return (data.get(pos) << 8) | data.get(pos + 1);
        } else {
            return data.get(pos) | (data.get(pos + 1) << 8);
        }
    }

    private function get_sshort(pos:Int):Int {
        var value = get_ushort(pos);
        return (value <= 0x7fff ? value : value - 0x10000);
    }

    private function get_ulong(pos:Int):Int {
        if (is_big_endian) {
            return (data.get(pos) << 24) | (data.get(pos + 1) << 16) | (data.get(pos + 2) << 8) | data.get(pos + 3);
        } else {
            return data.get(pos) | (data.get(pos + 1) << 8) | (data.get(pos + 2) << 16) | (data.get(pos + 3) << 24);
        }
    }

    private function get_slong(pos:Int):Int {
        var value = get_ulong(pos);
        return (value <= 0x7fffffff ? value : ((value - 0x7fffffff) - 0x7fffffff) - 2);
    }

    public static function decode(data:Bytes):TiffImage {
        var decoder = new TiffDecoder(data);
        return decoder.run();
    }
}
