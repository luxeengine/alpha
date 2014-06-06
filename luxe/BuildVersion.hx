package luxe;

import haxe.macro.Expr;
import haxe.macro.Context;

import haxe.io.Bytes;
import haxe.io.Path;

#if luxe_native
import sys.io.File;
import sys.FileSystem;
#end

class BuildVersion {

		//This is always called from Luxe.hx in the root folder,
		//which contains the .git repo, and build file directly
	macro public static function latest() {

		#if luxe_native

			var location : String = Context.getPosInfos(Context.currentPos()).file;
			var root : String = Path.addTrailingSlash(Path.directory(location));
			var out : String = Path.join([root,'build']);

			var build : String = try_git( root );

			if(build != '') {
					//the + is for semantic versioning
				build = '+' + build.substr(0,10);
				File.saveContent(out, build);
				Context.addResource('build', Bytes.ofString(build));
			}

			return Context.makeExpr(build, Context.currentPos());

		#else 

			return macro null;

		#end

	} //latest

	static function try_git(root:String) {

		#if luxe_native

			var git_path : String = Path.join([root,'.git/']);
				git_path = Path.normalize(git_path);
		
			if(FileSystem.exists(git_path) && FileSystem.isDirectory(git_path)) {
				var ref_file = Path.normalize(Path.join([git_path,'refs/heads/master']));
				return File.getContent(ref_file);
			}
			
		#end

		return '';

	} //try_git
	
} //BuildVersion