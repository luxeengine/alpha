
import phoenix.Resource;

class Parcel extends phoenix.ResourceManager {

    public var oncomplete : Parcel->Void;
    public var onprogress : Resource->Void;

    public var time_to_load : Float = 0;
    var time_start_load : Float = 0;

    var texture_list : Array<String>;
    var shader_list : Array<String>;
    var font_list : Array<String>;

    public var total_items : Int = 0;
    public var current_count : Int = 0;

    public function new( ?on_complete:Parcel->Void, ?on_progress:Resource->Void ) {

        super();
        oncomplete = on_complete;
        onprogress = on_progress;

        texture_list = [];
        font_list = [];
        shader_list = [];

    }

//Load the parcel up

    public function load() {

        // #if (luxe_native && !luxe_no_parcel_threads)

        // #end 

        do_load();
    }   

    function do_load() {

        time_start_load = haxe.Timer.stamp();

        total_items = texture_list.length + shader_list.length + font_list.length;

        for(tex in texture_list) {
            load_texture( tex );
        }
             
    }

//Public api for preparing a parcel

    public function add_texture( _id:String ) {
        texture_list.push(_id);
    }

    public function add_textures( list:Array<String> ) {
        for(texture in list) {
            texture_list.push(texture);
        }
    }
    public function add_shader( _id:String ) {
        shader_list.push(_id);
    }

    public function add_shaders( list:Array<String> ) {
        for(shader in list) {
            shader_list.push(shader);
        }

    }
    public function add_font( _id:String ) {
        font_list.push(_id);
    }

    public function add_fonts( list:Array<String> ) {
        for(font in list) {
            font_list.push(font);
        }
    }


//Per item handlers

    function load_texture( _tex:String ) {
        Luxe.loadTexture( _tex, single_item_complete, true );
    }

    function load_shader( _shader:String ) {

    }
    function load_font( _font:String ) {

    }
    function load_datafile( _datafile:String ) {

    }    
    function load_sound( _sound:String ) {

    }

//Complete internal handler

    function do_complete() {

            //figure out how long
        time_to_load = haxe.Timer.stamp() - time_start_load;

            //tell the creator
        if(oncomplete != null) {
            oncomplete( this );
        }

    } //do_complete

//Per item complete handler

    function single_item_complete( item:Resource ) {

        item.time_to_load = haxe.Timer.stamp() - item.time_created;

        if(onprogress != null) {
            onprogress( item );
        }

        current_count++;
        if(current_count >= total_items) {
            do_complete();
        }

    } //single_item_complete

}