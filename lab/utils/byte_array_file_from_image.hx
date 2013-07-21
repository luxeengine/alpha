        var image_bytes : haxe.io.Bytes = cast lime.utils.Assets.getBytes('assets/def_0.png');
        var bytes_string = image_bytes.toHex();
        var final_string = '[';

        var count = 0;
        for(i in 0...Std.int(bytes_string.length/2) ) {
            var p = i * 2;
            var b = bytes_string.substr(p, 2);
            final_string += '0x'+b+', ';
            count += 1;
            if(count >= 7) {
                count = 0;
                final_string+='\n';
            }
        }

        final_string +=' ];';
        sys.io.File.saveContent('test.font', final_string);
