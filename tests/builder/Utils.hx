
class Utils {

    public static function read_file( _path:String ) : String {
        var f = sys.io.File.read( _path, false );
        var d = f.readAll().toString();
        f.close();
        return d;
    }
    
    public static function save_file( _path:String, _content:String ) {
        var file : sys.io.FileOutput = sys.io.File.write( _path, false);
            file.writeString(_content);
            file.close();
    }    
}