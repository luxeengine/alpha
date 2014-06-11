package luxe.utils;

import haxe.crypto.BaseCode;
import haxe.io.Bytes;
import haxe.io.BytesData;

//Repurposed from :
//  http://haxe.1354130.n2.nabble.com/base64-and-hex-and-binary-decoder-encoder-tp6608415p6608451.html

class Base64 {


    static inline var BASE_64_ENCODINGS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    static inline var BASE_64_PADDING = "=";


    public static function decode( _string:String ) : String {

        #if !neko
            var result = decodeBytesData( _string );
            return result.toString();
        #end

        return '';

    } //decode

    public static function encode( _string:String ) : String {

        return encodeBytesData( Bytes.ofString(_string).getData() );

    } //encode

    public static function encodeBytesData( bytesData : BytesData ) : String {

        var bytes = Bytes.ofData(bytesData);
        var encodings = Bytes.ofString(BASE_64_ENCODINGS);
        var base64 = new BaseCode(encodings).encodeBytes(bytes).toString();

        var remainder = base64.length % 4;

        if (remainder > 1) {
            base64 += BASE_64_PADDING;
        }

        if (remainder == 2) {
            base64 += BASE_64_PADDING;
        }

        return base64;

    } //encodeBytesData

    public static function decodeBytesData( base64 : String ) : BytesData {

        var paddingSize = -1;
        if (base64.charAt(base64.length - 2) == BASE_64_PADDING) {
            paddingSize = 2;
        }
        else if (base64.charAt(base64.length - 1) == BASE_64_PADDING) {
            paddingSize = 1;
        }

        if (paddingSize != -1) {
            base64 = base64.substr(0, base64.length - paddingSize);
        }

        var encodings = Bytes.ofString(BASE_64_ENCODINGS);
        var bytes = new BaseCode(encodings).decodeBytes(Bytes.ofString(base64));

        return bytes.getData();

    } //decodeBytesData


} //Base64
