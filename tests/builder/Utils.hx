import haxe.io.Path;
import sys.FileSystem;
import sys.io.File;

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

    public static function recursiveCopy(source:String, destination:String ) {
        
        mkdir (destination);
        
        var files:Array <String> = null;
        
        try {
            files = FileSystem.readDirectory (source);
        } catch (e:Dynamic) {
            trace("error ; Could not find source directory \"" + source + "\"");
        }
        
        for (file in files) {
            
            if (file.substr (0, 1) != ".") {
                
                var itemDestination:String = destination + "/" + file;
                var itemSource:String = source + "/" + file;
                
                if (FileSystem.isDirectory (itemSource)) {
                    recursiveCopy (itemSource, itemDestination);
                } else {
                    copyFile (itemSource, itemDestination);
                }
                
            }
            
        }
        
    } //recursive copy

    private static var binaryExtensions = [ "jpg", "jpeg", "png", "exe", "gif", "ini", "zip", "tar", "gz", "fla", "swf" ];
    private static var textExtensions = [ "xml", "java", "hx", "hxml", "html", "ini", "gpe", "pch", "pbxproj", "plist", "json", "cpp", "mm", "properties", "hxproj", "nmml", "lime" ];

    public static function copyFile( source:String, destination:String) {
        
        copyIfNewer (source, destination);
        
    }

    public static function copyIfNewer (source:String, destination:String) {
      
        //allFiles.push (destination);
        
        if (!isNewer (source, destination)) {
            
            return;
            
        }
        
        mkdir (Path.directory (destination));
        
        // trace("Copying file: " + source + " -> " + destination);

        File.copy (source, destination);
        
    }

    public static function mkdir (directory:String):Void {
        
        directory = StringTools.replace (directory, "\\", "/");
        var total = "";
        
        if (directory.substr (0, 1) == "/") {
            total = "/";
        }
        
        var parts = directory.split("/");
        var oldPath = "";
        
        if (parts.length > 0 && parts[0].indexOf (":") > -1) {
            
            oldPath = Sys.getCwd ();
            Sys.setCwd (parts[0] + "\\");
            parts.shift ();
            
        }
        
        for (part in parts) {
            if (part != "." && part != "") {
                if (total != "") {
                    total += "/";
                }
                
                total += part;
                
                if (!FileSystem.exists (total)) {
                    // trace("Creating directory: " + total);
                    FileSystem.createDirectory (total);
                }
            }
        }
        
        if (oldPath != "") {
            Sys.setCwd (oldPath);
        }
        
    }    

    public static function isNewer (source:String, destination:String):Bool {
        
        if (source == null || !FileSystem.exists (source)) {
            trace("Source path \"" + source + "\" does not exist");
            return false;
        }
        
        if (FileSystem.exists (destination)) {
            if (FileSystem.stat (source).mtime.getTime () < FileSystem.stat (destination).mtime.getTime ()) {
                return false;
            }
        }
        
        return true;
        
    } //isNewer

}