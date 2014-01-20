
import sys.io.Process;

typedef Result = {
    stdout:String,
    stderr:String,
    returncode:Int,
    processID:Int
}

class Builder {

    var failures:Array<String>;
    var successes:Array<String>;
    var total:Int = 0;
    var wd : String = './';

    var succeeded = 0;
    var failed = 0;
    var current = 0;

    function run_build(path:String, target:String='cpp') {

            failures = [];
            successes = [];

            trace("\t      setting path " + path);
            
                Sys.setCwd(path);

            trace("\t      start build on " + path);

                var p = new Process("lime", [ "build", target ]);

                var running = true;
                while(running) {
                    try {
                        neko.Lib.print(String.fromCharCode(p.stdout.readByte()));
                    } catch(e:Dynamic) {
                        running = false;
                    }
                }

                var returncode  = p.exitCode();
                var processID   = p.getPid();
                var stderr      = p.stderr.readAll().toString();
                var stdout      = p.stdout.readAll().toString();
                                  p.close();

            trace("\t      done:"+returncode);

            if(returncode == 0) { 
                succeeded++;
                successes.push(path);
            } else {
                failed++;
                failures.push(path);
            }

            Sys.setCwd(wd);

    }

    function run_build_item( _build:Dynamic, _target:String='cpp' ) {

        trace("\t  running build item : " + _build.name );
        
        var build_paths : Array<String> = cast _build.paths;

        for(build in build_paths) {
        
            trace("\t    build " + current + ' / ' + total);
            
                run_build( build, _target );
                current ++;
        
        } //build_paths

    } //run_build_item

    public function new() {

        wd = Sys.getCwd();

        trace('working dir ' + wd);

        var config : Dynamic = haxe.Json.parse( Utils.read_file( 'builds.json' ) );
        var build_list : Array<Dynamic> = cast config.builds;
        var build_targets : Array<String> = cast config.targets;

        for(build in build_list) {

            var paths:Array<String> = cast build.paths;
                total += paths.length;

        } //build in build_list

        total *=  build_targets.length;
        current = 1;

        //for each target, run a build
        for(target in build_targets) {

            trace("running builds for target : " + target);
            
            for(build in build_list) {
                run_build_item( build, target );
            }

        } //target in build_targets

        trace("completed " + succeeded + ' / ' + total);

        if(succeeded != total) {
            trace("failures:");
            for(failure in failures) {
                trace("\t" + failure);
            }
        }

        trace("successes: ");
        for(success in successes) {
            trace("\t" + success);
        }
    }   

    static function main() {
        new Builder();
    }
}