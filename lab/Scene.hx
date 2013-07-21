
package lab;


class Scene {

    public var name : String = 'Untitled Scene';
    
    public var entities : Array<Entity>;
    public function new() {
        entities = new Array<Entity>();
    }

    public function add(entity:Entity) {
        entities.push( entity );
    }

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
    }

    public function init() {
        for(entity in entities) {
            entity._init();
        }        
    }
    public function start() {
        for(entity in entities) {
            entity._start();
        }
    }
    public function update(dt:Float) {
        for(entity in entities) {
            entity._update(dt);
        }
    }

}