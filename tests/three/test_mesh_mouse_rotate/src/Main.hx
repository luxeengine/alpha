
import luxe.Input;
import luxe.Entity;
import luxe.Vector;

import luxe.Component;
import luxe.components.render.MeshComponent;

class MouseRotate extends Component {

    var dragging : Bool = false;
    var mx : Float = 0;
    var my : Float = 0;
    var smooth : Float = 130;
    var mouse : Vector;
    var reference_rotation : Vector;

    public function init() {

        mouse = new Vector();
        reference_rotation = new Vector();

    } //init

    public function onmousedown(e:MouseEvent) {
        mouse = e.pos;
        dragging = true;
        reference_rotation.x = rotation.x;
        reference_rotation.y = rotation.y;
    }

    public function onmouseup(e:MouseEvent) {

        mouse = e.pos;
        dragging = false;

    } //onmouseup

    public function onmousemove(e:MouseEvent) {

        mouse = e.pos;

    } //onmousemove

    public function update(dt:Float) {

        if(dragging) {
            mx = (Luxe.screen.h / 2 - mouse.y) / smooth;
            my = (Luxe.screen.w / 2 - mouse.x) / smooth;

            rotation.setFromEuler(new Vector(-mx, -my));
        }

    } //update


} //MouseRotate


class Main extends luxe.Game {


    var tower:Entity;


    public function ready() {

        Luxe.camera.view.set_perspective({
            far:1000, near:0.1, aspect:Luxe.screen.w/Luxe.screen.h
        });

            //move up and back a bit
        Luxe.camera.pos.set(0,0.5,2);

            //create an empty entity
        tower = Luxe.scene.create(Entity, 'tower');

            //attach a mesh component
        var mesh = tower.add(MeshComponent, 'mesh');
            mesh.file = 'assets/tower.obj';
            mesh.texture = Luxe.loadTexture('assets/tower.png');

            //attach a mouse rotate component
        var mouserotate = tower.add(MouseRotate, 'rotate');

    } //ready

    public function onkeyup( e:KeyEvent ) {

        if(e.key == KeyValue.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

    public function update(dt:Float) {

    } //update

} //Main
