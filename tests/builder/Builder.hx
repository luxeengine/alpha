
import sys.io.Process;

class Builder {

    var failures:Array<String>;
    var successes:Array<String>;
    var total:Int = 0;
    var wd : String = './';

    var succeeded = 0;
    var failed = 0;
    var current = 0;
    var config : Dynamic;

    function run_build(path:String, target:String='cpp') {            

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

            var cwd = Sys.getCwd();
            var last = cwd.charAt(cwd.length-1);
            if(last == '/') { cwd = cwd.substring(0, cwd.length - 1); }
            var endpos = cwd.lastIndexOf('/');
            
            var short_name = cwd.substr( endpos+1, cwd.length - endpos );

            trace("\t    done : " + short_name);

            if(returncode == 0) { 
                succeeded++;
                successes.push(target + " | " + short_name);
            } else {
                failed++;
                failures.push(target + " | " + short_name);
            }

            
            var target_path = '';
            var source_path = '';

                //now do a copy, if requested
            if(config.copyoutput != null && config.copyoutput == true) {
                // recursiveCopy
                if(config.outputpath != null && config.outputpath != '') {
                    var bits = 64;
                    var out = (target == 'html5') ? target : target + bits;
                    var bin_dir = (target == 'html5') ? 'bin/' + out + '/bin' : 'bin/' + out + '/cpp/bin/';
                    var out_path = config.outputpath + out + '/' + short_name;

                    source_path = bin_dir;
                    target_path = out_path;
                }
            }

            if(target_path != '' && source_path != '') {
                Utils.recursiveCopy( source_path, target_path );
                trace("\t   copied " + source_path + " to " + target_path );
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


        failures = [];
        successes = [];

        trace('working dir ' + wd);

        config = haxe.Json.parse( Utils.read_file( 'builds.json' ) );

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
            trace(" failures:");
            for(failure in failures) {
                trace("   " + failure);
            }
        }

        trace(" successes: ");
        for(success in successes) {
            trace("   " + success);
        }
    }   

    static function main() {
        new Builder();
    }
}