
import haxe.io.Path;
import project.HXProject;
import project.ProjectXMLParser;

class Run {

    static function main() {

        var args = Sys.args();
        var run_path = args.pop();

        if(args.length == 0) {
            Sys.println("usage is `haxelib run luxe <project.luxe.xml>`");
            return;
        }

        Sys.setCwd(run_path);
        var project_file = args[0];
        var fullpath = Path.join([run_path,project_file]);

        if(!sys.FileSystem.exists(fullpath)) {
            Sys.println("project not found at " + fullpath);
            return;
        }

        Sys.println('converting $fullpath ...');

        var project = new HXProject();
            project = new ProjectXMLParser( project_file, null, []);

        trace(project);

    }

} //Run
