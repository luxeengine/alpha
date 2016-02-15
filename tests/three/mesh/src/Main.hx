
import luxe.Input;
import luxe.Mesh;
import luxe.Vector;
import phoenix.geometry.Geometry;
import phoenix.Batcher;

class Main extends luxe.Game {


    var mesh : Mesh;
	var mesh2 : Mesh;


     override function config(config:luxe.AppConfig) {

        config.preload.textures.push({ id:'assets/tower.jpg' });
        config.preload.texts.push({ id:'assets/tower.obj' });

        config.render.depth = 24;

        return config;

    } //config


    override function ready() {

    	Luxe.camera.view.set_perspective({
    		far:1000,
            near:0.1,
            fov: 90,
            aspect : Luxe.screen.w/Luxe.screen.h
    	});

    		//move up and back a bit
    	Luxe.camera.pos.set_xyz(0,1,2);
            //load a texture
        var tex = Luxe.resources.texture('assets/tower.jpg');
    		//create the mesh
    	mesh = new Mesh({ file:'assets/tower.obj', texture:tex });

            //create a second mesh based on the first one
        mesh2 = new Mesh({
            geometry : new Geometry({ primitive_type: PrimitiveType.triangles, batcher:Luxe.renderer.batcher }),
            texture : mesh.geometry.texture,
        });

        mesh2.geometry.vertices = [].concat(mesh.geometry.vertices);
        mesh2.transform.pos.set_xy(1,0);

    } //ready

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

    var y = 0.0;

    override function update(dt:Float) {

            //90 degrees a second
        y += 90 * dt;

        mesh.rotation.setFromEuler(new Vector(0,y,0).radians());

    } //update


} //Main
