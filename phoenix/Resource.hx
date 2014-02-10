package phoenix;

import lime.utils.ByteArray;
import phoenix.Droppable;
import phoenix.ResourceManager;
    

enum ResourceType {
    unknown;
    text;
    data;
    texture;
    sound;
    render_texture;
    font;
    shader;
}

class Resource extends Droppable {
    
    public var manager : ResourceManager;
    public var type : ResourceType;
    public var id : String;
    public var persistent : Bool = false;
    public var time_to_load : Float = 0;
    public var time_created : Float = 0;

    public function new( _manager : ResourceManager, _type:ResourceType, ?_load_time:Float ) {

        manager = _manager == null ? Luxe.resources : _manager;
        type = _type;
        
        time_to_load = _load_time;
        time_created = haxe.Timer.stamp();

        manager.add( this );

    } //new

    public override function drop() {
        if(!dropped) {
            super.drop();
            manager.remove( this );
        }
    } //drop

} //Resource


class TextResource extends Resource {
    
    public var text : String;

    public function new( _id:String, _text:String, _manager:ResourceManager ) {
    
        id = _id;
                
        super( _manager, ResourceType.text );
        
        text = _text;

    } //new

} //TextResource

class DataResource extends Resource {

    public var data : ByteArray;

    public function new( _id:String, _data:ByteArray, _manager:ResourceManager ) {
        
        id = _id;

        super( _manager, ResourceType.data );

        data = _data;

    } //new
    
} //DataResource


class SoundResource extends Resource {

    public var name : String;

    public function new( _name:String, _id:String, _manager:ResourceManager ) {
            
        id = _id;

        super( _manager, ResourceType.sound );

        name = _name;        

    } //new
    
} //DataResource

