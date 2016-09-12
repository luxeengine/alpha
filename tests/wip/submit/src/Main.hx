
import luxe.Color;
import luxe.components.cameras.FlyCamera;
import luxe.Input;
import luxe.Vector;
import phoenix.Matrix;
import phoenix.Camera;



class Main extends luxe.Game {

    override function config(config:luxe.GameConfig) {

        config.preload.shaders.push({ id:'object_shader', vert_id:'assets/vert.glsl', frag_id:'textured' });
        config.preload.textures.push({ id:'assets/tower.jpg' });
        config.preload.texts.push({ id:'assets/tower.obj' });
        config.render.depth = 24;

        return config;

    } //config

    var mesh : luxe.Mesh;
    var nodes : Array<Matrix>;
    var count = 1000;
    var cam : FlyCamera;
    var text: luxe.Text;

    override function ready() {

        text = new luxe.Text({
            text:'info',
            pos: new Vector(-range, range, -range),
            point_size:10
        });

        cam = new FlyCamera({
            name:'flycam',
            projection: ProjectionType.perspective,
            fov:90,
            near:0.01,
            far:1000,
            aspect:Luxe.screen.w/Luxe.screen.h
        });

        Luxe.renderer.batcher.view = cam.view;

        mesh = new luxe.Mesh({
            file:'assets/tower.obj',
            texture:Luxe.resources.texture('assets/tower.jpg'),
            no_batcher_add:true,
            buffer_based:true,
            object_space:true
        });

        mesh.geometry.locked = true;

        nodes = [];
        for(i in 0 ... count) {
            var m = new Matrix();
                m.setPosition(new Vector(
                    Luxe.utils.random.int(-(range/2),range),
                    Luxe.utils.random.int(-(range/2),range),
                    Luxe.utils.random.int(-(range/2),range)
                ));
                nodes.push(m);
        }

        mesh.geometry.shader = Luxe.resources.shader('object_shader');

    } //ready

    override function onpostrender() {

        mesh.geometry.texture.bind();

        for(node in nodes) {
            mesh.geometry.shader.set_matrix4('model', node);
            Luxe.renderer.batcher.submit_geometry(mesh.geometry);
        }

    } //onrender

    var change = 100;
    var range = 60;
    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.key_0) {
            for(i in 0 ... change) {
                var m = new Matrix();
                m.setPosition(new Vector(
                    Luxe.utils.random.int(-(range/2),range),
                    Luxe.utils.random.int(-(range/2),range),
                    Luxe.utils.random.int(-(range/2),range)
                ));
                nodes.push(m);
            }
            trace(nodes.length);
        }

        if(e.keycode == Key.key_p) {
            trace(cam.view.pos);
            trace(cam.view.rotation);
        }

        if(e.keycode == Key.key_9) {
            if(nodes.length > change) {
                var end = nodes.length - change - 1;
                nodes.splice(end,change);
                trace(nodes.length);
            }
        }

        if(e.keycode == Key.key_q) {
            Luxe.shutdown();
        }

    } //onkeyup

    override function update(dt:Float) {

        text.text = '${nodes.length} / $dt';

    } //update


} //Main


@:publicFields
class Node {
    var x:Float;
    var y:Float;
    var z:Float;
    var m:Matrix;
    inline function new(_x,_y,_z,_r,_g,_b,_dx,_dy,_s) {
        x = _x;
        y = _y;
        z = _z;
        m = new Matrix();
    }
}