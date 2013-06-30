
import phoenix.Texture;
import phoenix.Batcher;
import phoenix.Camera;
import phoenix.geometry.QuadGeometry;
import phoenix.geometry.Geometry;
import phoenix.geometry.Vertex;
import phoenix.geometry.TextureCoord;
import phoenix.Quaternion;

import lab.Vector;

import lime.gl.GL;

import format.obj.Reader;

class Main extends lab.Game {
    var dt : Float = 0;
    var edt : Float = 0;

    var geom : QuadGeometry;
    var geom2 : QuadGeometry;

    var batch2d : Batcher;
    var cam2d : Camera;

    var batch3d : Batcher;
    var cam3d : Camera;

    var tex : Texture;
    var tex2 : Texture;

    var _left : Bool = false;
    var _right : Bool = false;
    var _up : Bool = false;
    var _down : Bool = false;
    var _strafeleft : Bool = false;
    var _straferight : Bool = false;

    var tmpQuaternion : Quaternion;
    var thequaternion : Quaternion;

    var moveVector : Vector;
    var rotationVector : Vector;
    var movementSpeedMultiplier = 1.0;  
    var moveState : Dynamic;

    var movementSpeed = 1.0;
    var rollSpeed = 0.5;

    public function ready() {

       trace("game ready"); 

       moveVector = new Vector();
       rotationVector = new Vector();
       tmpQuaternion = new Quaternion();
       thequaternion = new Quaternion();
       moveState = { up: 0.0, down: 0.0, left: 0.0, right: 0.0, forward: 0.0, back: 0.0, pitchUp: 0.0, pitchDown: 0.0, yawLeft: 0.0, yawRight: 0.0, rollLeft: 0.0, rollRight: 0.0 };


       tex = Lab.loadTexture('assets/usable_orange.png');
       tex2 = Lab.loadTexture('assets/diffuse_512.png');     

        //2d layer
       batch2d = new Batcher(lab.renderer);
       batch2d.layer = 1;
       
       batch3d = new Batcher(lab.renderer);
       batch3d.layer = 1;

       lab.renderer.add_batch(batch2d);
       lab.renderer.add_batch(batch3d);

       cam2d = new Camera(ProjectionType.ortho, { x2:960, y2:640 });
       batch2d.view = cam2d;
       batch2d.view.rotation.z = 6;

       cam3d = new Camera(ProjectionType.ortho, { x2:960, y2:640 });
       batch3d.view = cam3d;
       batch3d.view.rotation.y = 45;
       batch3d.view.rotation.x = 45;

       draw_2d_quad(batch2d);
       draw_cube_obj(batch3d);
       
    }

    public function draw_2d_quad(_batch:Batcher) {

        geom = new QuadGeometry({
            x:32, y:8, width:128, height:128,
            texture : tex2,
            depth : 4
        });  
        
        geom2 = new QuadGeometry( {
            x:72, y:32, width:256, height:256,
            texture : tex,
            depth : 6
        });  

        _batch.add(geom);
        _batch.add(geom2);

    }

    public function add_mesh(id:String, t:Texture, _batch:Batcher) {

        var obj_file = lime.utils.Assets.getText(id);       
        var file_input = new haxe.io.StringInput( obj_file );
        var obj_mesh_data = new format.obj.Reader(file_input).read();

        var _geom = new Geometry({
            texture : t,
            primitive_type: PrimitiveType.triangles,
            immediate : false,
            depth : 2
        });

        var scale = 1;
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

    public function draw_cube_obj(_batch:Batcher) {
      
        _batch.view.pos.x = -0.3;
        _batch.view.pos.y = 0.3;
        _batch.view.pos.z = -0.90;    

        _batch.view.set_perspective({fov:95, aspect:lab.lime.config.width/lab.lime.config.height });

        add_mesh('assets/ship.obj', tex2, _batch);
        add_mesh('assets/cube.obj', tex, _batch);
       _batch.view.target = new Vector(0,0,0);

        moveState.yawLeft = 0.5;
        updateMovementVector();
        updateRotationVector();

    }

    public function onkeydown(e) {
        // if(e.value == 37) { _left = true; }
        // if(e.value == 38) { _up = true; }
        // if(e.value == 39) { _right = true; }
        // if(e.value == 40) { _down = true; }
        // if(e.value == 97) { _strafeleft = true; }
        // if(e.value == 100) { _straferight = true; }
        switch ( e.value ) {

          case 16: /* shift */ 
            movementSpeedMultiplier = 0.1; 

          case 119: /*W*/ 
            moveState.forward = 1; 
          case 115: /*S*/ 
            moveState.back = 1; 

          case 97: /*A*/ 
            moveState.left = 1; 
          case 100: /*D*/ 
            moveState.right = 1; 

          case 114: /*R*/ 
            moveState.up = 1; 
          case 102: /*F*/ 
            moveState.down = 1; 

          case 38: /*up*/ 
            moveState.pitchUp = 1; 
          case 40: /*down*/ 
            moveState.pitchDown = 1; 

          case 37: /*left*/ 
            moveState.yawLeft = 1; 
          case 39: /*right*/ 
            moveState.yawRight = 1; 

          case 113: /*Q*/ 
            moveState.rollLeft = 1; 
          case 101: /*E*/ 
            moveState.rollRight = 1; 

        }

        updateMovementVector();
        updateRotationVector();
    }
    public function onkeyup(e) {
        // if(e.value == 37) { _left = false; }
        // if(e.value == 38) { _up = false; }
        // if(e.value == 39) { _right = false; }
        // if(e.value == 40) { _down = false; }
        // if(e.value == 97) { _strafeleft = false; }
        // if(e.value == 100) { _straferight = false; }
        switch( e.value ) {

          case 16: /* shift */
              movementSpeedMultiplier = 1;

          case 119: /*W*/
              moveState.forward = 0;
          case 115: /*S*/
              moveState.back = 0;

          case 97: /*A*/
              moveState.left = 0;
          case 100: /*D*/
              moveState.right = 0;

          case 114: /*R*/
              moveState.up = 0;
          case 102: /*F*/
              moveState.down = 0;

          case 38: /*up*/ 
              moveState.pitchUp = 0;
          case 40: /*down*/ 
              moveState.pitchDown = 0;

          case 37: /*left*/ 
              moveState.yawLeft = 0;
          case 39: /*right*/ 
              moveState.yawRight = 0;

          case 113: /*Q*/ 
              moveState.rollLeft = 0;
          case 101: /*E*/ 
              moveState.rollRight = 0;

        }       

        updateMovementVector();
        updateRotationVector();

    }

    public function updateMovementVector() {

        var forward = moveState.forward;//( moveState.forward || ( autoForward && !moveState.back ) ) ? 1 : 0;

        moveVector.x = ( -moveState.left + moveState.right );
        moveVector.y = ( -moveState.down + moveState.up );
        moveVector.z = ( -forward + moveState.back );

    } 

    public function updateRotationVector() {

        rotationVector.x = ( -moveState.pitchDown + moveState.pitchUp );
        rotationVector.y = ( -moveState.yawRight  + moveState.yawLeft );
        rotationVector.z = ( -moveState.rollRight + moveState.rollLeft );

    } 

    public function onmousedown(e) {
    }

    public function onmouseup(e) {
    }

    public function update() {

      // if(_left == true) {
      //   batch3d.view.pos.x -= 1 * dt;
      //   trace("x: " + batch3d.view.pos.x);
      // }
      // if(_up == true) {
      //   batch3d.view.pos.y -= 1 * dt;
      //   trace("y: " + batch3d.view.pos.y);
      // }
      // if(_down == true) {
      //   batch3d.view.pos.y += 1 * dt;
      //   trace("y: " + batch3d.view.pos.y);
      // }
      // if(_right == true) {
      //   batch3d.view.pos.x += 1 * dt;
      //   trace("x: " + batch3d.view.pos.x);
      // }
      // if(_strafeleft == true) {
      //   batch3d.view.pos.z += 1 * dt;
      //   trace("z: " + batch3d.view.pos.z);
      // }      
      // if(_straferight == true) {
      //   batch3d.view.pos.z -= 1 * dt;
      //   trace("z: " + batch3d.view.pos.z);
      // }

        var moveMult = dt * movementSpeed;
        var rotMult = dt * rollSpeed;

        // object.translateX( moveVector.x * moveMult );
        // object.translateY( moveVector.y * moveMult );
        // object.translateZ( moveVector.z * moveMult );

        cam3d.pos.x += moveVector.x * moveMult;
        cam3d.pos.y += moveVector.y * moveMult;
        cam3d.pos.z += moveVector.z * moveMult;

        tmpQuaternion.set( rotationVector.x * rotMult, rotationVector.y * rotMult, rotationVector.z * rotMult, 1 ).normalize();
        thequaternion.multiply( tmpQuaternion );

        // expose the rotation vector for convenience
        cam3d.rotation.setEulerFromQuaternion( thequaternion );
        // object.rotation.setEulerFromQuaternion( object.quaternion, object.eulerOrder );


      dt = edt - haxe.Timer.stamp();
      edt = haxe.Timer.stamp();
    }

    public function shutdown() {

    }
}


