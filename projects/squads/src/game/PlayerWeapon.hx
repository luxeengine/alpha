
package game;

import luxe.Vector;
import luxe.Sprite;

import luxe.components.Components.Component;
import phoenix.Texture;

typedef WeaponDesc = { 
    var name        : String;
    var desc        : String;
    var rate        : Float;
    var velocity    : Float;
    var damage      : Float;
    var ammo        : Int;
    var clipammo    : Int;
    var reloadtime  : Float;
    var image       : Texture;
    var spawn_offset: Float;
}

class PlayerWeapon extends Component {

        //offset rotation in degrees
    public var image : Sprite;
    public var speed : Float = 1;
    public var rate : Float = 1;
    public var spawn_offset : Float;
    
    public var current : Int = 1;

    public var weapon_list : Map<String, WeaponDesc>;
    public var weapon_names : Array<String>;

    public function init() {

        weapon_list = new Map();
        spawn_offset = 25;

        weapon_list.set('pistol',
            {
                name : '\npistol',
                desc : 'A good basic pistol for sticky situations',
                velocity : 5,
                rate : 0.5,
                damage : 55,
                ammo : 9,
                reloadtime : 1,
                clipammo : 9,
                image : Luxe.loadTexture('assets/game/weapons/pistol.png'),
                spawn_offset : 23
            }
        ); //set 

        weapon_list.set('submachinegun',
            {
                name : 'sub\nmachine gun',
                desc : 'A compact and efficient weapon',
                velocity : 4.5,
                rate : 0.1,
                damage : 15,
                reloadtime : 1,
                ammo : 10,
                clipammo : 10,
                image : Luxe.loadTexture('assets/game/weapons/smg.png'),
                spawn_offset : 25
            }
        ); //set

        weapon_list.set('assaultrifle',
            {
                name : 'assault\nrifle',
                desc : 'A fast firing high impact assault rifle',
                velocity : 3.5,
                rate : 0.1,
                damage : 20,
                ammo : 16,
                clipammo : 16,
                reloadtime : 1.4,
                image : Luxe.loadTexture('assets/game/weapons/m4.png'),
                spawn_offset : 26
            }
        ); //set

        weapon_list.set('grenadelauncher',
            {
                name : 'grenade\nlauncher',
                desc : 'A slow firing AOE grenade launcher',
                velocity : 2,
                reloadtime : 0.8,
                rate : 0.8,
                ammo : 5,
                clipammo : 5,
                damage : 100,
                image : Luxe.loadTexture('assets/game/weapons/GL.png'),
                spawn_offset : 32
            }
        ); //set

        weapon_names = [];
        for(w in weapon_list.keys()) {
            weapon_names.push(w);
        }

        image = new Sprite({ name:'weapon', serialize:false, size:new Vector(64,64), depth : 6 });

        set_weapon('pistol');

        image.parent = entity;

        entity.events.listen('player.flip', onflip);

    }

    public function set_weapon( _name:String ) {

        if(weapon_list.exists(_name)) {
            
            var wd = weapon_list.get(_name);
            
                image.texture = wd.image;

                rate = wd.rate;
                speed = wd.velocity;
                spawn_offset = wd.spawn_offset;

                //emit an event so the ui can update
            entity.events.fire('player.ui.weaponswitch', { type:'weapon', player:entity.name, value : wd.name });

        } else {
            trace("set weapon to " + _name + ' but that weapon is not stored in the weapon_list!');
        }
    }

    public function cycle( _dir:Int = 1) {

        current += _dir;

        if(current > weapon_names.length-1) {
            current = 0;
        }
        if(current < 0) {
            current = weapon_names.length-1;
        }

        set_weapon(weapon_names[current]);

    } //cycle

    function onflip(_event:Dynamic) {

        image.flipx = _event.flipx;

    }

    public function update() {

    }

} //PlayerAim