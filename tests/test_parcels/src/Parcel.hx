
import phoenix.Resource;


#if (!parcel_thread_disabled)
    #if neko
        import neko.vm.Thread;
        import neko.vm.Mutex;
    #else
        import cpp.vm.Thread;
        import cpp.vm.Mutex;
    #end 
#end //parcel_thread_disabled


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

    } //new

//Load the parcel up

    var index : Int = 0;

    #if (luxe_native && !parcel_thread_disabled)
    #end 

    public function load( ?sequential:Bool = false ) {

        time_start_load = haxe.Timer.stamp();

        total_items = texture_list.length + shader_list.length + font_list.length;

        if(texture_list.length > 0) {

            index = 0;

            if(sequential) {

                    //load recursive so that it is sequential
                recursive_load_textures( null );
            
            } else {

                    //load each texture immediately, 
                    //so they complete whenever they are done and aren't 
                    //waiting for the next one
                #if (luxe_native && !parcel_thread_disabled)

                        //threaded loading will create a loading thread, 
                        //and then go ahead and fire the loop into it
                    // Thread.create(function(){
                        // trace(" background thread starting ");
                            load_textures();
                        // trace(" background thread ending ");
                    // });

                #else                    
                    load_textures();
                #end //native+threading

            } //sequential

        } //texture_list
             
    } //do_load

    function load_textures() {
        for(tex in texture_list) {
            load_texture( tex, single_item_complete );
        }
    }

    function recursive_load_textures( item:Resource ) {

        if(item != null) {
            single_item_complete( item );
        }

            //if you are debugging progress, change this line and it's closing brace
        // Luxe.timer.schedule(1, function(){

            if( index < texture_list.length ) {
                    //hold current so we can skip
                var current = index;
                    //increase count for complete around
                index++;
                    //send off
                load_texture( texture_list[current], recursive_load_textures );

            } //not past max length

        // });  //schedule closing brace      

    } //recursive_load_textures

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

    function load_texture( _tex:String, _complete ) {
        Luxe.loadTexture( _tex, _complete, true );
    } //load_texture

    function load_shader( _shader:String ) {

    } //load_shader
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

        current_count++;

        if(onprogress != null) {
            onprogress( item );
        }

            //There will always be a 0.1 second delay before 
            //oncomplete to allow for progress bar renders to complete
        if(current_count >= total_items) {
            Luxe.timer.schedule(0.1, function(){
                do_complete();
            });
        }

    } //single_item_complete

}