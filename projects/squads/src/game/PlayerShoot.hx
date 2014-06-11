
package game;

import game.Bullet;
import game.PlayerWeapon;
import luxe.Vector;
import luxe.Sprite;

import luxe.Component;
import phoenix.Texture;

import game.PlayerAim;

class PlayerShoot extends Component {

    var bullet_pool : Array<Sprite>;

    public var poolsize : Int = 20;    
    public var precache : Bool = true;
    public var bullet_texture : Texture;

    public var firing : Bool = false;

    var current : Int = 0;
    var next_fire : Float = 0;

    var aim : PlayerAim;
    var weapon : PlayerWeapon;
    var sprite : Sprite;

    public function init() {

        bullet_pool = [];
        bullet_texture = Luxe.loadTexture('assets/game/bullet.png');

        if(precache) {
            for(i in 0 ... poolsize) {
                    //create the sprite
                var bullet = new Sprite({
                    name : 'bullet' + i,
                    serialize : false,
                    texture : bullet_texture,
                    visible : false,
                    depth : 4
                }); 

                    //set the bullet fixed rate
                bullet.fixed_rate = 0.02;
                    //now attach the bullet component
                var bcomp = bullet.add(Bullet, 'bullet');
                    //store it in the pool
                bullet_pool.push(bullet);

            } //for
        } //precache

        sprite = cast entity;
        aim = get('aim');
        weapon = get('weapon');

    } //init

    public function onstopfiring() {
        firing = false;
    }

    public function onfiring() {
        firing = true;
            //force immediate fire
        // next_fire = -1;
    }

    public function fire() {
        spawn();
    } //fire

    public function update() {
        if(firing) {
            if(Luxe.time > next_fire) {
                fire();
                next_fire = Luxe.time + weapon.rate;
            } //if we passed the fire rate
        } //firing still true?
    } //update

    public function spawn() {

        current++;
        if(current > poolsize - 1) {
            current = 0;
        } //current

        var bullet = bullet_pool[current];

            var spawnx = weapon.spawn_offset * aim.direction.x;
            var spawny = weapon.spawn_offset * aim.direction.y; 

                //32 is offset for the sprite origin
            bullet.pos.x = entity.transform.world.pos.x + spawnx + 32;
            bullet.pos.y = entity.transform.world.pos.y + spawny + 32;

            bullet.visible = true;
            bullet.rotation_z = aim.rot+90;
            bullet.fixed_rate = 0.02;            

        var comp : Bullet = bullet.get('bullet');

            comp.alive = true;

            comp.dir.set(aim.direction.x, aim.direction.y);
            comp.speed = weapon.speed;
            comp.onspawn(bullet.pos);

    } //spawn


} //PlayerAim