package luxe.debug;

import luxe.Input.KeyEvent;
import luxe.Input.MouseEvent;
import luxe.Screen.WindowEvent;


class DebugView extends luxe.Objects {
    public function new() {
        super();
    }

    public var visible : Bool = false;

    public function refresh() {}
    public function process() {}
    public function onmousedown(e:MouseEvent) {}
    public function onmousewheel(e:MouseEvent) {}
    public function onmouseup(e:MouseEvent) {}
    public function onmousemove(e:MouseEvent) {}
    public function onkeydown(e:KeyEvent) {}
    public function onkeyup(e:KeyEvent) {}
    public function onwindowsized(e:WindowEvent) {}
    public function create() {}
    public function show() {
        visible = true;
    }
    public function hide() {
        visible = false;
    }
}
