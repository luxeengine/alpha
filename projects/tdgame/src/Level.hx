
import luxe.components.Components.Component;
import luxe.Input.MouseEvent;
import luxe.Vector;
import luxe.Entity;
import luxe.Text;
import luxe.Color;

import luxe.components.render.MeshComponent;
import phoenix.Ray;
import phoenix.Shader;
import phoenix.Texture;

class Level extends Component {

    var floor : Entity;
    var tower : Entity;
    var tower2 : Entity;
    var mouse_ray : Ray;

    var text : Text;

    var grid : Grid;

    public var game : Main;

    var start_one:Vector;
    var start_two:Vector;
    var end_one:Vector;
    var end_two:Vector;

    //internals
        var _floor_normal : Vector;
        var _floor_center : Vector;

        var lighting : Shader;

        var tower_texture : Texture;

    public function init() {

        mousegrid = new Vector();
        mousepos = new Vector();

        start_one = new Vector(4,0);
        start_two = new Vector(5,0);
        end_one = new Vector(4,9);
        end_two = new Vector(5,9);

        var floor_texture = Luxe.loadTexture('assets/floor2.png');
        tower_texture = Luxe.loadTexture('assets/tower.png');
        var tower2_texture = Luxe.loadTexture('assets/tower2.png');
        
        tower = Luxe.scene.create(Entity, 'tower');

            var tower_mesh = tower.add(MeshComponent, 'mesh');
                tower_mesh.file = 'assets/tower2.obj';
                tower_mesh.texture = tower_texture;

        tower2 = Luxe.scene.create(Entity, 'tower2');

            var tower_mesh2 = tower2.add(MeshComponent, 'mesh');
                tower_mesh2.file = 'assets/rangetower.obj';
                tower_mesh2.texture = tower2_texture;        

        floor = Luxe.scene.create(Entity, 'floor');

            var floor_mesh = floor.add(MeshComponent, 'mesh');
                floor_mesh.file = 'assets/floor2.obj';
                floor_mesh.texture = floor_texture;


        var _grid = Luxe.scene.create(Entity, 'grid');
            grid = _grid.add(Grid, 'grid');


        text = new Text({
            pos : new Vector(0,0),
            text : 'HP 100/100',
            size : 12,
            color : new Color(0.98,0.98,1),
            batcher : game.hud_view
        });       

        lighting = Luxe.loadShader('assets/simple_lighting_f.glsl','assets/simple_lighting_v.glsl');


    }

    public function get_point_on_ground_plane(_ray_origin:Vector, _ray_dir:Vector) {
        
        if(_floor_normal == null) _floor_normal = new Vector(0,-1,0);
        if(_floor_center == null) _floor_center = new Vector(0,0,0);
        
        return Luxe.utils.geometry.intersect_ray_plane( _ray_origin, _ray_dir, _floor_normal, _floor_center);

    } //get_point_on_ground_plane

    public function onmouseup(e:MouseEvent) {
            
        update_mouse_pos(e);

        floor.get('mesh').mesh.geometry.shader = lighting;
        tower.get('mesh').mesh.geometry.shader = lighting;
        tower2.get('mesh').mesh.geometry.shader = lighting;

        //first of all, when we click down,
        //we have to check that the tower placement point is not taken already.
        
        if(grid.isWalkable(mousegrid.x, mousegrid.y)) {

            // trace('attempting to place a tower at ' + mousegrid.x + ',' + mousegrid.y);

                //first check it isn't on the starts or end blocks
            if(mousegrid.equals(start_one) || mousegrid.equals(start_two) || mousegrid.equals(end_one) || mousegrid.equals(end_two)) {
                trace("Cannot place a tower in the entrance or exits of the level!");
                return;
            }


                //block the grid position, so we can test against it
            grid.set_blocked(mousegrid.x, mousegrid.y);

                //also, if it is available, check that it won't prohibit the enemy path from closing entirely
            var _path_one : Array<Vector> = grid.path(start_one, end_one);
            var _path_two : Array<Vector> = grid.path(start_two, end_two);
            var _path_three : Array<Vector> = grid.path(start_one, end_two);
            var _path_four : Array<Vector> = grid.path(start_two, end_one);

            if( (_path_one != null) || (_path_two != null) || (_path_three != null) || (_path_four != null) ) {

                //now that we know there is definitely a way out for the creeps, we can place a tower here.
                var newtower = Luxe.scene.create(Entity, 'tower' + Math.random());

                var tower_mesh = newtower.add(MeshComponent, 'mesh');
                    tower_mesh.file = 'assets/tower2.obj';
                    tower_mesh.texture = tower_texture;

                tower_mesh.init();

                newtower.pos = mousepos;


            } else {
                trace("Cannot place tower that would block the enemy from the exits.");
                grid.set_unblocked(mousegrid.x, mousegrid.y);
            }

        } //is even available

    }

    function update_mouse_pos(e:MouseEvent) {
            //get the screen ray from the mouse
        if(mouse_ray == null) {
            mouse_ray = game.game_camera.view.screen_point_to_ray(e.pos);
        } else {
            mouse_ray.refresh(e.pos);
        }
        
            //get the tower world pos on the ground plane
        var tp = get_point_on_ground_plane( mouse_ray.origin, mouse_ray.dir );

                //then move it to grid space
            tp.x = Math.floor(tp.x);
            tp.z = Math.floor(tp.z);

        if(tp.x < -5) tp.x = -5;
        if(tp.z < -5) tp.z = -5;
        if(tp.x > 4) tp.x = 4;
        if(tp.z > 4) tp.z = 4;

            //use this for path finding tests
        mousegrid.set(tp.x+5,tp.z+5);

        tp.x += 0.5;
        tp.z += 0.5;

        mousepos = tp;

    }

    var mousegrid : Vector;
    var mousepos : Vector;

    public function onmousemove(e:MouseEvent) {

        update_mouse_pos(e);
            //set the tower position
        tower.pos = mousepos;        
        tower2.pos = new Vector(0.5+3,0, 0.5);

    } //onmousemove

    public function update(dt:Float) {

         //set the hp position
        text.pos = game.game_camera.view.world_point_to_screen(tower.pos);

    } //update

} //Level