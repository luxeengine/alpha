
import luxe.components.Components.Component;
import luxe.Input.MouseEvent;
import luxe.Vector;
import luxe.Entity;
import luxe.Text;
import luxe.Color;

import luxe.components.render.MeshComponent;
import phoenix.Ray;

class Level extends Component {

    var floor : Entity;
    var tower : Entity;
    var mouse_ray : Ray;

    var text : Text;

    public var game : Main;

    //internals
        var _floor_normal : Vector;
        var _floor_center : Vector;

    public function init() {

        var floor_texture = Luxe.loadTexture('assets/floor.png');
        var tower_texture = Luxe.loadTexture('assets/tower.png');
        
        tower = Luxe.scene.create(Entity, 'tower');

            var tower_mesh = tower.add(MeshComponent, 'mesh');
                tower_mesh.file = 'assets/tower2.obj';
                tower_mesh.texture = tower_texture;

        floor = Luxe.scene.create(Entity, 'floor');

            var floor_mesh = floor.add(MeshComponent, 'mesh');
                floor_mesh.file = 'assets/tower1.obj';
                floor_mesh.texture = floor_texture;

        text = new Text({
            pos : new Vector(0,0),
            text : 'HP 100/100',
            color : new Color(0.6,0,0),
            batcher : game.hud_view
        });

    }

    public function get_point_on_ground_plane(_ray_origin:Vector, _ray_dir:Vector) {
        
        if(_floor_normal == null) _floor_normal = new Vector(0,-1,0);
        if(_floor_center == null) _floor_center = new Vector(0,0,0);
        
        return Luxe.utils.geometry.intersect_ray_plane( _ray_origin, _ray_dir, _floor_normal, _floor_center);

    } //get_point_on_ground_plane

    public function onmousemove(e:MouseEvent) {

            //get the screen ray from the mouse
        if(mouse_ray == null) {
            mouse_ray = game.game_camera.view.screen_point_to_ray(e.pos);
        } else {
            mouse_ray.refresh(e.pos);
        }
        
            //get the tower world pos on the ground plane
        var tp = get_point_on_ground_plane( mouse_ray.origin, mouse_ray.dir );

                //then move it to grid space
            tp.x = 0.5+Math.floor(tp.x);
            tp.z = 0.5+Math.floor(tp.z);

            //set the tower position
        tower.pos = tp;
            //set the hp position
        text.pos = game.game_camera.view.world_point_to_screen(tower.pos);

    } //onmousemove

    public function update(dt:Float) {



    } //update

} //Level