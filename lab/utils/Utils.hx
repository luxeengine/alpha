
package lab.utils;


class Utils {
    public var geometry : lab.utils.GeometryUtils;

    public var lab:lab.Core;
    public function new(_lab:lab.Core) {
        lab = _lab;

            //initialise our helpers
        geometry = new lab.utils.GeometryUtils(lab);
    }  

}
