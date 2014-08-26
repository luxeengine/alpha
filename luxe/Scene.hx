package luxe;

import luxe.Input;
import luxe.options.EntityOptions;

import luxe.Log._verbose;
import luxe.Log._debug;
import luxe.Log.log;

class Scene extends Objects {

    public var entities : Map<String,Entity>;
    public var inited : Bool = false;
    public var started : Bool = false;

    var _delayed_init_entities : Array<Entity>;
    var _delayed_reset_entities : Array<Entity>;

    public var entitycount (get, null) : Int = 0;

    public function new() {
        super();
        name = 'Untitled Scene';
        entities = new Map<String,Entity>();
        _delayed_init_entities = [];
        _delayed_reset_entities = [];
    }

    public function toString() {
        return "Luxe Scene: " + name + " entities:" + Lambda.count(entities) + " (" + id + ")";
    }

    function get_entitycount() : Int {

        return Lambda.count(entities);

    } //entitycount

    public function add( entity:Entity ) {

        if(entity == null) {
            throw "can't put entity in a scene if the entity is null.";
        }

        _debug('${name} / adding ${entity.name} with id : ${entity.id}');

        entities.set( entity.name, entity );

        entity.scene = this;

        if(inited) {
            _debug('adding a delayed entity to init list ' + entity.name);
            _delayed_init_entities.push(entity);
        } //inited

        if(started) {
            _debug('adding a delayed entity to reset list ' + entity.name);
            _delayed_reset_entities.push(entity);
        } //started

    } //add

    function list_entities() {
        trace("entity list");
        for(entity in entities) {
            trace("\tentity : " + entity.name + " / " + entity.id);
        }
    }

    public function remove( entity:Entity ) : Bool {

        if(entity == null) {
            throw "can't remove entity from a scene if the entity is null.";
        }

        if(entity.scene == this) {

            entity.scene = null;
            return entities.remove( entity.name );

        } else {
            _debug("can't remove the entity from this scene, it is not mine (entity.scene != this)");
            return false;
        }

        return false;

    } //remove

    public function empty() {
        trace("cleaning up entities in scene");
        for(entity in entities) {
            if(entity != null) {
                remove(entity);
                entity.destroy();
                entity = null;
            }
        }
        trace("\tentities left " + Lambda.count(entities));
    }

//Keys
    public function onkeydown(e:KeyEvent) {
        for(entity in entities) {
            if(entity != null) {
                entity._onkeydown(e);
            }
        }
    } //onkeydown
    public function onkeyup(e:KeyEvent) {
        for(entity in entities) {
            if(entity != null) {
                entity._onkeyup(e);
            }
        }
    } //onkeyup
//Mouse
    public function onmousedown(e:MouseEvent) {
        for(entity in entities) {
            if(entity != null) {
                entity._onmousedown(e);
            }
        }
    } //onmousedown
    public function onmousewheel(e:MouseEvent) {
        for(entity in entities) {
            if(entity != null) {
                entity._onmousewheel(e);
            }
        }
    } //onmousewheel
    public function onmouseup(e:MouseEvent) {
        for(entity in entities) {
            if(entity != null) {
                entity._onmouseup(e);
            }
        }
    } //onmouseup
    public function onmousemove(e:MouseEvent) {
        for(entity in entities) {
            if(entity != null) {
                entity._onmousemove(e);
            }
        }
    } //onmousemove
//Touch
    public function ontouchdown(e : TouchEvent) {
        for(entity in entities) {
            if(entity != null) {
                entity._ontouchdown(e);
            }
        }
    } //ontouchdown
    public function ontouchup(e : TouchEvent) {
        for(entity in entities) {
            if(entity != null) {
                entity._ontouchup(e);
            }
        }
    } //ontouchup
    public function ontouchmove(e : TouchEvent) {
        for(entity in entities) {
            if(entity != null) {
                entity._ontouchmove(e);
            }
        }
    } //ontouchmove
//Gamepad
    public function ongamepadaxis(e:GamepadEvent) {
        for(entity in entities) {
            if(entity != null) {
                entity._ongamepadaxis(e);
            }
        }
    }
    public function ongamepadup(e:GamepadEvent) {
        for(entity in entities) {
            if(entity != null) {
                entity._ongamepadup(e);
            }
        }
    }
    public function ongamepaddown(e:GamepadEvent) {
        for(entity in entities) {
            if(entity != null) {
                entity._ongamepaddown(e);
            }
        }
    }
//Input
    public function oninputdown(_name:String, e:InputEvent) {
        for(entity in entities) {
            if(entity != null) {
                entity._oninputdown(_name, e);
            }
        }
    } //oninputdown
    public function oninputup(_name:String, e:InputEvent) {
        for(entity in entities) {
            if(entity != null) {
                entity._oninputup(_name, e);
            }
        }
    } //oninputup

    public function destroy() {

        for(entity in entities) {
            if(entity != null) {
                entity.destroy();
            }
        }

    } //destroy

    function _do_init() : Bool {

        var _before_count = Lambda.count(entities);

        for(entity in entities) {
            if(entity != null) {
                if(!entity.inited) {
                    _verbose('calling init on an entity : ' + entity.name);
                    entity._init();
                }
            }
        }

        var _after_count = Lambda.count(entities);

        return _before_count != _after_count;

    } // _do_init

        //Entities themselves can create entities
        //inside of their init so we have to keep checking
    public function init() {

        var keep_going : Bool = true;
        while(keep_going) {
            keep_going = _do_init();
        }

        inited = true;

    } //init

        //If entities are created during start they will
        // be inited and started in the next available frame
    public function reset() {

        for(entity in entities) {
            if(entity != null) {
                entity._reset();
            }
        } //for each entity

        started = true;

    } //reset

    public function update(dt:Float) {

            //late scene additions get init'ed and start'ed
        handle_delayed_additions();

            //finally update them
        for(entity in entities) {
            if(entity != null) {
                entity._update(dt);
            }
        } //for each entity

    } //update

    public function fixed_update() {

        for(entity in entities) {
            if(entity != null) {
                entity._fixed_update();
            }
        } //for each entity

    } //fixed_update

    function handle_delayed_additions() {

        if(_delayed_init_entities.length != 0 || _delayed_reset_entities.length != 0) {
            _debug("delayed entities in scene will init/reset now! " + _delayed_init_entities.length + ' / ' + _delayed_reset_entities.length);
        }

        if(_delayed_init_entities.length > 0) {
            for(entity in _delayed_init_entities) {
                _debug('\t handling late entity init ' + entity.name);
                entity._init();
            }
            _delayed_init_entities.splice(0, _delayed_init_entities.length);
        }

        if(_delayed_reset_entities.length > 0) {
            for(entity in _delayed_reset_entities) {
                _debug('\t handling late entity reset ' + entity.name);
                entity._reset();
            }
            _delayed_reset_entities.splice(0, _delayed_reset_entities.length);
        }

    } //handle_delayed_additions

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


        } //serialize_to_disk
    #end //luxe_native

} //Scene
