
package luxe;

import luxe.Input.MouseEvent;


class Scene {

    public var name : String = 'Untitled Scene';
    public var id : String = '';
    
    public var entities : Map<String,Entity>;
    public var inited : Bool = false;
    public var started : Bool = false;

    public function new() {
        entities = new Map<String,Entity>();
        id = Luxe.utils.uuid();
    }

    public function create<T>(type:Class<T>, ?_name:String='') : T {

        var _temp_name = _name;

        if(_temp_name.length == 0) {
            _temp_name = Luxe.utils.uuid();
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

        entities.set( entity.name, entity );
        
        if(inited) {
            entity._init();
        } //inited

        if(started) {
            entity._start();
        } //started

    } //add

    public function remove(entity:Entity) {
        entity._destroy();
        entities.remove( entity.id );
    }

    public function empty() {

        for(entity in entities) {
                //destroy
            entity._destroy();
            entity = null;
                //remove
            entities.remove(entity.id);
        }
        
    }
    
    public function shutdown() {
        destroy();
    }

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

    public function destroy() {
         for(entity in entities) {
            entity._destroy();
        }
    } //destroy
    public function init() {
        
        inited = true;

        for(entity in entities) {
            entity._init();
        }        
        
    } //init
    public function start() {
        
        started = true;

        for(entity in entities) {
            entity._start();
        }
        
    } //start
    public function update(dt:Float) {
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