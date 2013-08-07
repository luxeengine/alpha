
import lab.Color;
import lab.Entity;
import phoenix.Matrix4;
import phoenix.Texture;
import phoenix.Batcher;
import phoenix.Camera;
import phoenix.geometry.QuadGeometry;
import phoenix.geometry.Geometry;
import phoenix.geometry.Vertex;
import phoenix.geometry.TextureCoord;
import phoenix.Quaternion;

import lab.Input;
import lab.Vector;
import lab.Text;

import lime.gl.GL;

import format.obj.Reader;
import phoenix.utils.Maths;

class FlyCamera extends lab.Camera {

    public var move_forward : Bool;
    public var move_back : Bool;
    public var move_left : Bool;
    public var move_right : Bool;
    public var move_speed : Float = 1;

    public var sensitivity_x : Float = 0.0025;
    public var sensitivity_y : Float = 0.0025;

    var newpos : Vector;
    var mouse_delta : Vector;

    var forward  : Vector;
    var right : Vector;
    var up : Vector;

    var yaw : Float = 0;
    var pitch : Float = 0;

    var pitch_rotation_matrix : Matrix4;
    var yaw_rotation_matrix : Matrix4;

        //to ignore the next mouse movement 
        //because forcefully setting the position
        //will cause a mouse event
    var ignore_next_mouse_move : Bool = false;

    var ready  = false;    

    public function new(_options:Dynamic = null) {

        super(_options);
        
        mouse_delta = new Vector(0,0);

        newpos = new Vector();
        forward = new Vector(0,0,-1);
        right = new Vector(-1,0,0);
        up = new Vector(0,1,0);

        pitch_rotation_matrix = new Matrix4();
        yaw_rotation_matrix = new Matrix4();
    }


    public function start() {
        pos = new Vector(0, 0.5, 0);
    }
    
    public override function update(dt:Float) {

            //Update the parent in case it's doing stuff
        super.update(dt);

            //Don't want to process until ready
        if(!ready) {
            return;
        }

            //start from our existing position
        newpos.set(pos.x, pos.y, pos.z);        

        var move_diff = move_speed * dt;

        if(mouse_delta.x != 0 || mouse_delta.y != 0) {

                //Update movement facing from mouse difference
            move_look(mouse_delta.x, mouse_delta.y);

                //Make sure we clear values
            pitch_rotation_matrix.identity();
            yaw_rotation_matrix.identity();

                //rotating the yaw around the local Y (up) axis
            // yaw_rotation_matrix.makeRotationAxis( up, yaw );
            yaw_rotation_matrix.makeRotationY( yaw );

                //update the right vector of our orientation
            right.set(1,0,0);
            right.applyMatrix4( yaw_rotation_matrix );
            right.normalize();

                //Rotate the pitch around the right hand (local x) axis
            pitch_rotation_matrix.makeRotationAxis( right, pitch );

                //the combination of the yaw and pitch applied to a single rotation matrix
            var final_rotation : Matrix4 = pitch_rotation_matrix.multiply(yaw_rotation_matrix);

                //find the forward vector of our orientation
            forward.set(0,0,-1);
            forward.applyMatrix4( final_rotation );
            forward.normalize();

                //find the up vector of our orientation
            up.set(0,1,0);
            up.applyMatrix4( final_rotation );
            up.normalize();

                //Apply it to the camera rotation
            view.rotation.setFromRotationMatrix(final_rotation);
                //Make sure this stays set
            mouse_delta.set(0,0);
                //Lock the cursor center screen so we can go in circles
            Lab.setCursorPosition( Std.int(Lab.screen.w/2), Std.int(Lab.screen.h/2) );
                //Set a flag to ignore the next immediate mouse event as the above line triggered it
            ignore_next_mouse_move = true;
        }


            if(move_forward) {  
                newpos.add( Vector.Multiply(forward, move_diff) );
            }
            if(move_back) {  
                newpos.subtract( Vector.Multiply(forward, move_diff) );
            }

            if(move_left) {  
                newpos.subtract( Vector.Multiply(right, move_diff) );
            }
            if(move_right) {  
                newpos.add( Vector.Multiply(right, move_diff) );
            }

            //update the position for the camera
        pos = newpos;

    } //update

    function move_look(xDelta:Float,yDelta:Float) {
            yaw -= xDelta*sensitivity_x;
        while (yaw < 0)
            yaw += Math.PI*2;
        while (yaw >= Math.PI*2)
            yaw -= Math.PI*2;
                
            pitch -= yDelta*sensitivity_y;
        while (pitch < -Math.PI*0.5)
            pitch = -Math.PI*0.5;
        while (pitch > Math.PI*0.5)
            pitch = Math.PI*0.5;
    }

    public function onmousedown(e:MouseEvent) {
    }

    public function onmouseup(e:MouseEvent) {
        if(e.button == MouseButton.left && !ready) {
            ready = true;
            Lab.setCursorPosition( Std.int(Lab.screen.w/2), Std.int(Lab.screen.h/2) );
            mouse_delta.set( 0,0 );
            
            ignore_next_mouse_move = true;
            Lab.lockCursor(true);
            Lab.showCursor(false);
        }
    }

    public function onmousemove(e:MouseEvent) {
        
        if(!ready) return;

        mouse_delta.set(e.deltaX,e.deltaY);

        if(ignore_next_mouse_move) {            
            ignore_next_mouse_move = false;
            return;
        }

        

    }

    public function onkeydown(e) {

        if(e.value == Input.Keys.up || e.value == Input.Keys.key_W) {
            move_forward = true;
        }
        if(e.value == Input.Keys.down || e.value == Input.Keys.key_S) {
            move_back = true;
        }
        if(e.value == Input.Keys.left || e.value == Input.Keys.key_A) {
            move_left = true;
        }
        if(e.value == Input.Keys.right || e.value == Input.Keys.key_D) {
            move_right = true;
        }

    }

    public function onkeyup(e) {
        if(e.value == Input.Keys.up || e.value == Input.Keys.key_W) {
            move_forward = false;
        }
        if(e.value == Input.Keys.down || e.value == Input.Keys.key_S) {
            move_back = false;
        }
        if(e.value == Input.Keys.left || e.value == Input.Keys.key_A) {
            move_left = false;
        }
        if(e.value == Input.Keys.right || e.value == Input.Keys.key_D) {
            move_right = false;
        }
    }

} //FlyCamera

class Main extends lab.Game {

    var batch3d : Batcher;
    var cam3d : FlyCamera;

    var tex : Texture;
    var tex2 : Texture;

    var rotation : Vector;

    public function ready() {

        trace("game ready"); 

        Lab.lockCursor(false);
        Lab.showCursor(true);

        rotation = new Vector(-20, 0, 0);

        tex = Lab.loadTexture('assets/diff.png');
        tex2 = Lab.loadTexture('assets/transform.png');

        batch3d = new Batcher(lab.renderer);

        lab.renderer.add_batch(batch3d);

            //The camera for the scene
        cam3d = new FlyCamera();
            //Apply it to our mesh renderer
        batch3d.view = cam3d.view;
            //Load the mesh files
        load_level_obj_into( batch3d );
            //Add camera to scene
        Lab.scene.add( cam3d );

    }

    public function add_mesh(id:String, t:Texture, _batch:Batcher) {

        var obj_file = lime.utils.Assets.getText(id);       
        var file_input = new haxe.io.StringInput( obj_file );
        var obj_mesh_data = new format.obj.Reader(file_input).read();

        var _geom = new Geometry({
            texture : t,
            type: PrimitiveType.triangles,
            immediate : false,
            depth : 2
        });

        var scale = 0.1;
        var p = new Vector(0,0,0);

        for(v in obj_mesh_data.vertices) {
           
           var normal : Vector = new Vector();
           if(v.normal != null) {
                normal = new Vector(v.normal.x, v.normal.y, v.normal.z);
           }
           var _v = new Vertex( new Vector( (v.pos.x * scale)+p.x , (v.pos.y * scale)+p.y, (v.pos.z * scale)+p.z), normal );
           if(v.uv != null) {
               _v.uv[0] = new TextureCoord( v.uv.u, 1.0 - v.uv.v );
           } else {
               _v.uv[0] = new TextureCoord( 0, 0 );
           }
           _geom.add( _v );
        }

       _batch.add(_geom);

    }

    public function load_level_obj_into(_batch:Batcher) {
      
        _batch.view.pos.x = 0;
        _batch.view.pos.y = 0;
        _batch.view.pos.z = 0;

        _batch.view.set_perspective({fov:90, aspect:lab.config.width/lab.config.height });

        add_mesh('assets/test_scene_0.obj', tex, _batch);
        add_mesh('assets/transform.obj', tex2, _batch);

    }

    public function onkeydown(e) {
        if(e.value == Input.Keys.key_Q) {
            cam3d.shake(0.1);
        }

        if(e.value == Input.Keys.escape) {
            Lab.shutdown();
        }        

        cam3d.onkeydown(e);
    }

    var hidden = false;
    var locked = false;
    public function onkeyup(e:Dynamic) {

        if(e.value == Input.Keys.key_4) {
            hidden = !hidden;
            Lab.showCursor(hidden);
        }

        if(e.value == Input.Keys.key_5) {
            locked = !locked;
            Lab.lockCursor(locked);
        }

        cam3d.onkeyup(e);
    }

    public function onmousemove(e:MouseEvent) {
        cam3d.onmousemove(e);
    }

    public function onmousedown(e) {
        cam3d.onmousedown(e);
    }   

    public function onmouseup(e) {
        cam3d.onmouseup(e);
    }

    public function update(dt:Float) {


    }

    public function shutdown() {

    }
}


