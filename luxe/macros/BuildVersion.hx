package luxe.macros;

import haxe.macro.Expr;
import haxe.macro.Context;

import haxe.io.Bytes;
import haxe.io.Path;


#if macro
import sys.io.File;
import sys.FileSystem;
#end

class BuildVersion {

    public static var _save : Bool = false;

    macro public static function save() : haxe.macro.Expr {

        _save = true;

        return macro null;

    } //save

        //This is always called from Luxe.hx in the root folder,
        //which contains the .git repo, and build file directly
    macro public static function latest() {

        var location : String = Context.getPosInfos(Context.currentPos()).file;
        var root : String = Path.addTrailingSlash(Path.directory(location));
        var out : String = Path.join([root,'build']);

        var build : String = try_git( root );

        if(build != '') {

                //the + is for semantic versioning
            build = '+' + build.substr(0,10);

            if(_save) {
                File.saveContent(out, build);
            }

            Context.addResource('build', Bytes.ofString(build));
        }

        return Context.makeExpr(build, Context.currentPos());

    } //latest

    static function try_git(root:String) {


		#if macro
			var git_path : String = Path.join([root,'.git/']);
				git_path = Path.normalize(git_path);

			if(FileSystem.exists(git_path) && FileSystem.isDirectory(git_path)) {
				var ref_file = Path.normalize(Path.join([git_path,'refs/heads/master']));
				if(FileSystem.exists(ref_file)) {
                    return File.getContent(ref_file);
                } else {
                    return '';
                }
			}
		#end

        return '';

    } //try_git

} //BuildVersion