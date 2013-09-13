
package luxe;


class Scene {

    public var name : String = 'Untitled Scene';
    
    public var entities : Array<Entity>;
    public var inited : Bool = false;
    public var started : Bool = false;

    public function new() {
        entities = new Array<Entity>();
    }

    public function create<T>(type:Class<T>, ?_name:String='') : T {

        var _temp_name = _name;

        if(_temp_name.length == 0) {
            _temp_name = Luxe.utils.uuid();
        } else {
            _temp_name = _name;
        }

            //create an instance
        var _component = Type.createInstance( type, [] );
            //cast to entity so we can set its name
        var _e_component : Entity = cast _component;
            //apply it!
        _e_component.name = _temp_name;

            //add it to this scene
        add(_e_component);

            //component
        return _component;
    }

    public function add( entity:Entity ) {
        entities.push( entity );
        
        if(inited) {
            entity._init();
        } //inited

        if(started) {
            entity._start();
        } //started

    } //add

    public function remove(entity:Entity) {
        entity._destroy();
        entities.remove( entity );
    }

    public function empty() {

        for(entity in entities) {
            entity._destroy();
            entity = null;
        }

        entities.splice( 0, entities.length );
    }
    
    public function shutdown() {
        destroy();
    }

    public function destroy() {
         for(entity in entities) {
            entity._destroy();
        }
    } //destroy
    public function init() {
        for(entity in entities) {
            entity._init();
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
        for(entity in entities) {
            entity._update(dt);
        }
    } //update
    public function fixed_update() {
        for(entity in entities) {
            entity._fixed_update();
        }
    } //fixed_update

}