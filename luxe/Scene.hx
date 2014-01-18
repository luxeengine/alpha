
package luxe;

import luxe.Input.MouseEvent;
import luxe.Input.KeyEvent;
import luxe.Input.TouchEvent;

class Scene extends Objects {

    public var entities : Map<String,Entity>;    
    public var inited : Bool = false;
    public var started : Bool = false;

    var _delayed_init_entities : Array<Entity>;
    var _delayed_start_entities : Array<Entity>;

    public function new() {
        super();
        name = 'Untitled Scene';
        entities = new Map<String,Entity>();        
        _delayed_init_entities = [];
        _delayed_start_entities = [];
    }

    public function create<T>(type:Class<T>, ?_name:String='') : T {

        var _temp_name = _name;

        if(_temp_name.length == 0) {
            _temp_name = Luxe.utils.uniqueid();
        } else {
            _temp_name = _name;
        }

            //create an instance
        var _entity = Type.createInstance( type, [] );
            //cast to entity so we can set its name
        var _e_entity : Entity = cast _entity;
            //apply it!
        _e_entity.name = _temp_name;

            //add it to this scene
        add(_e_entity);        

            //entity
        return _entity;
    }

    public function add( entity:Entity ) {

        entities.set( entity.id, entity );

        entity.scene = this;

        if(inited) {
            _delayed_init_entities.push(entity);            
        } //inited

        if(started) {            
            _delayed_start_entities.push(entity);
        } //started

    } //add

    public function remove( entity:Entity ) {        
        entities.remove( entity.id );
        entity.scene = null;
    }

    public function empty() {
        trace("cleaning up entities in scene");
        for(entity in entities) {
            remove(entity);
            entity._destroy();
            entity = null;
        }
        trace("entities left " + Lambda.count(entities));
    }

//Keys
    public function onkeydown(e:KeyEvent) {
        for(entity in entities) {
            entity._onkeydown(e);
        }
    } //onkeydown
    public function onkeyup(e:KeyEvent) {
        for(entity in entities) {
            entity._onkeyup(e);
        }
    } //onkeyup
//Mouse
    public function onmousedown(e:MouseEvent) {
        for(entity in entities) {
            entity._onmousedown(e);
        }
    } //onmousedown
    public function onmouseup(e:MouseEvent) {
        for(entity in entities) {
            entity._onmouseup(e);
        }
    } //onmouseup
    public function onmousemove(e:MouseEvent) {
        for(entity in entities) {
            entity._onmousemove(e);
        }
    } //onmousemove
//Touch
    public function ontouchbegin(e : TouchEvent) {
        for(entity in entities) {
            entity._ontouchbegin(e);
        }
    } //ontouchbegin
    public function ontouchend(e : TouchEvent) {
        for(entity in entities) {
            entity._ontouchend(e);
        }
    } //ontouchend
    public function ontouchmove(e : TouchEvent) {
        for(entity in entities) {
            entity._ontouchmove(e);
        }
    } //ontouchmove
//Gamepad
    public function ongamepadaxis(e) {
        for(entity in entities) {
            entity._ongamepadaxis(e);
        }
    }
    public function ongamepadball(e) {
        for(entity in entities) {
            entity._ongamepadball(e);
        }
    }
    public function ongamepadhat(e) {
        for(entity in entities) {
            entity._ongamepadhat(e);
        }
    }
    public function ongamepadbuttonup(e) {
        for(entity in entities) {
            entity._ongamepadbuttonup(e);
        }
    }
    public function ongamepadbuttondown(e) {
        for(entity in entities) {
            entity._ongamepadbuttondown(e);
        }
    }
//Input    
    public function oninputdown(_name:String, e:Dynamic) {
        for(entity in entities) {
            entity._oninputdown(_name, e);
        }
    } //oninputdown
    public function oninputup(_name:String, e:Dynamic) {
        for(entity in entities) {
            entity._oninputup(_name, e);
        }
    } //oninputup

    public function destroy() {
         for(entity in entities) {
            entity._destroy();
        }
    } //destroy

    function _do_init() : Bool {

        var _before_count = Lambda.count(entities);

        for(entity in entities) {
            if(!entity.inited) {
                _debug('calling init on ' + entity.name);
                entity._init();
            }
        }

        var _after_count = Lambda.count(entities);
            
        return _before_count != _after_count;

    } // _do_init

    public function init() {        

            //Entities themselves can create entities so we have to check that        
        var keep = true;
        while(keep) {
            keep = _do_init();
        }

        inited = true;

    } //init

    public function start() {        

        for(entity in entities) {
            entity._start();
        }

        started = true;
        
    } //start
    public function update(dt:Float) {

            //first init these delayed ones
        if(_delayed_init_entities.length > 0) {
            for(entity in _delayed_init_entities) {
                entity._init();
            }
            _delayed_init_entities.splice(0, _delayed_init_entities.length);
        }

            //and then start any delayed ones
        if(_delayed_start_entities.length > 0) {
            for(entity in _delayed_start_entities) {
                entity._start();
            }
            _delayed_start_entities.splice(0, _delayed_start_entities.length);
        }

            //finally update them
        for(entity in entities) {
            entity._update(dt);
        }

    } //update
    public function fixed_update() {
        for(entity in entities) {
            entity._fixed_update();
        }
    } //fixed_update

#if luxe_native

    public function serialize_to_disk( _destination_path:String ) {

            trace('Saving scene to ' + _destination_path);

                //write the scene metadata
            var _metafile = _destination_path + 'scene.meta.luxe.json';

                var meta = {
                    id : id,
                    name : name,
                    count_entities : Lambda.count(entities)
                }

            var _file : sys.io.FileOutput = sys.io.File.write( _metafile, false);
                _file.writeString( luxe.utils.JSON.encode(meta) );
                _file.close();

            var _entity_path = _destination_path + 'entities/';

            sys.FileSystem.createDirectory(_entity_path);

                //write out all the entities in the scene
            for(entity in entities) {
                entity.serialize_to_disk( _entity_path );
            }

            trace('Done saving scene.');

        
    }
#end //luxe_native

}