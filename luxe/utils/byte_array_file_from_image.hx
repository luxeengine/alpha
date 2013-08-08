        var image_bytes : haxe.io.Bytes = cast lime.utils.Assets.getBytes('assets/def_0.png');
        var bytes_string = image_bytes.toHex();
        var final_string = '"';
        var current_string = '';

        for(i in 0...Std.int(bytes_string.length/2) ) {
            var p = i * 2;
            var b = bytes_string.substr(p, 2);
            final_string += '0x'+b + ' ';
            if(final_string.length % 4096 == 0) {
                 final_string+='"+\n"';
            } 
        }
        trace(final_string.length);

        final_string +='";';
        sys.io.File.saveContent('test.font', final_string);
        trace("SAVING");