package luxe;

import luxe.Resource;


#if (!parcel_thread_disabled && luxe_native)
    #if neko
        import neko.vm.Thread;
        import neko.vm.Mutex;
    #else
        import cpp.vm.Thread;
        import cpp.vm.Mutex;
    #end 
#end //parcel_thread_disabled


typedef ShaderInfo = {
    ps_id : String,
    vs_id : String
}

typedef FontInfo = {
    id : String,
    path : String
}

typedef SoundInfo = {
    id : String,
    name : String,
    is_music : Bool
}

typedef ParcelOptions = {
    ? sequential : Bool,
    ? threaded : Bool,
    ? load_spacing : Float,
    ? start_spacing : Float,
    ? oncomplete : Parcel->Void, 
    ? onprogress : Resource->Void
}

class Parcel extends luxe.ResourceManager {

    public var time_to_load : Float = 0;
    var time_start_load : Float = 0;

    var texture_list : Array<String>;
    var shader_list : Array<ShaderInfo>;
    var font_list : Array<FontInfo>;
    var sound_list : Array<SoundInfo>;
    var text_list : Array<String>;
    var data_list : Array<String>;

    public var total_items : Int = 0;
    public var current_count : Int = 0;
    public var options : ParcelOptions;

    public function new( ?_options:ParcelOptions ) {

        super();

        options = _options != null ? _options : {};

        if( options.load_spacing == null ) { options.load_spacing = 0.1; }
        if( options.start_spacing == null ) { options.start_spacing = 0.4; }
        if( options.sequential == null ) { options.sequential = false; }
        if( options.threaded == null ) { options.threaded = false; }

        texture_list    = [];
        font_list       = [];
        shader_list     = [];
        sound_list      = [];
        text_list       = [];
        data_list       = [];

    } //new

//Load the parcel up

    var index_textures  : Int = 0;
    var index_fonts     : Int = 0;
    var index_shaders   : Int = 0;
    var index_sounds    : Int = 0;
    var index_datas     : Int = 0;
    var index_texts     : Int = 0;


    public function load() {

        time_start_load = haxe.Timer.stamp();

        total_items =
            texture_list.length +
            shader_list.length  +
            font_list.length    +
            sound_list.length   +
            text_list.length    +
            data_list.length;

        Luxe.timer.schedule(options.start_spacing, function(){

        #if (luxe_native && !parcel_thread_disabled)
            Thread.create(function(){
                Sys.println('background thread loading ' + options);
        #end                
                if( !options.sequential ) {

                    start_textures_load();
                    start_fonts_load();
                    start_shaders_load();
                    start_sounds_load();
                    start_texts_load();
                    start_datas_load();

                } else {

                    start_textures_load();

                }

        #if (luxe_native && !parcel_thread_disabled)
                Sys.println('background thread end');
            }); //Thread
        #end 

        }); //timer schedule
             
    } //load

    public function from_json( _json_object:Dynamic ) {

        if(_json_object != null) {

            if(_json_object.textures != null) {
                var _textures : Array<Dynamic> = cast _json_object.textures;
                for(item in _textures) {
                    if(item != null) {
                        var id : String = item.id == null ? '' : cast item.id;
                        if(id != '') {
                            add_texture( id );
                        } else {
                            trace("parcel: texture not added due to incomplete info: " + item);
                        }
                    } //item != null
                } //item in textures
            } //json object textures

            if(_json_object.shaders != null) {
                var _shaders : Array<Dynamic> = cast _json_object.shaders;
                for(item in _shaders) {
                    if(item != null) {
                        var ps_id : String = item.ps_id == null ? 'default' : cast item.ps_id;
                        var vs_id : String = item.vs_id == null ? 'default' : cast item.vs_id;
                            
                        add_shader(ps_id, vs_id);

                    } //item != null
                } //item in shaders
            } //json object shaders

            if(_json_object.fonts != null) {
                var _fonts : Array<Dynamic> = cast _json_object.fonts;
                for(item in _fonts) {
                    if(item != null) {
                        var id : String = item.id == null ? '' : cast item.id;
                        var path : String = item.path == null ? '' : cast item.path;
                        if(id != '' && path != '') {
                            add_font(id, path);
                        } else {
                            trace("parcel: font not added due to incomplete info: " + item);
                        }
                    } //item != null
                } //item in fonts
            } //json object fonts

            if(_json_object.sounds != null) {
                var _sounds : Array<Dynamic> = cast _json_object.sounds;
                for(item in _sounds) {
                    if(item != null) {
                        var id : String = item.id == null ? '' : cast item.id;
                        var name : String = item.name == null ? '' : cast item.name;
                        var is_music : Bool = item.is_music == null ? false : cast item.is_music;
                        if(id != '' && name != '') {
                            add_sound( id, name, is_music);
                        } else {
                            trace("parcel: sounds not added due to incomplete info: " + item);
                        }
                    } //item != null
                } //each sounds
            } //json object sounds

            if(_json_object.text != null) {
                var _texts : Array<Dynamic> = cast _json_object.text;
                for(item in _texts) {
                    if(item != null) {
                        var id : String = item.id == null ? '' : cast item.id;
                        if(id != '') {
                            add_text( id );
                        }  else {
                            trace("parcel: text not added due to incomplete info: " + item);
                        }//id != ''
                    } //item != null
                } //each text
            } //json object text

            if(_json_object.data != null) {
                var _datas : Array<Dynamic> = cast _json_object.data;
                for(item in _datas) {
                    if(item != null) {
                        var id : String = item.id == null ? '' : cast item.id;
                        if(id != '') {
                            add_data( id );
                        } else {
                            trace("parcel: data not added due to incomplete info: " + item);
                        }
                    }
                }
            } //json object data

        } //json_object

    } //from_json

//Texture

    function start_textures_load() {

        if(texture_list.length > 0) {

            index_textures = 0;

            if(options.sequential) {

                    //load recursive so that it is sequential
                recursive_load_textures( null );
            
            } else {

                    //load all fonts immediately
                    //whether that's sequential or not
                load_textures();


            } //sequential

        } else { //texture_list
        
            if( options.sequential ) {
                start_fonts_load();
            }

        }

    } //start_texture_load

//Font

    function start_fonts_load() {

        if(font_list.length > 0) {

            index_fonts = 0;

            if(options.sequential) {

                    //load recursive so that it is sequential
                recursive_load_fonts( null );
            
            } else {

                    //load all fonts immediately
                    //whether that's sequential or not
                load_fonts();

            } //sequential

        } else { //font_list > 0

            if( options.sequential ) {
                start_shaders_load();
            }

        }

    } //start_fonts_load

//Shader

    function start_shaders_load() {

        if(shader_list.length > 0) {

            index_shaders = 0;

            if(options.sequential) {

                    //load recursive so that it is sequential
                recursive_load_shaders( null );
            
            } else {

                    //load all fonts immediately
                    //whether that's sequential or not
                load_shaders();

            } //sequential

        } else { //shader_list > 0
            
            if( options.sequential ) {
                start_sounds_load();
            }

        }

    } //start_shaders_load

//Sound

    function start_sounds_load() {

        if(sound_list.length > 0) {

            index_sounds = 0;

            if(options.sequential) {

                    //load recursive so that it is sequential
                recursive_load_sounds( null );
            
            } else {

                    //load all fonts immediately
                    //whether that's sequential or not
                load_sounds();

            } //sequential

        } else { //sound_list > 0

            if( options.sequential ) {
                start_texts_load();
            }

        }

    } //start_sounds_load

//Data 

    function start_datas_load() {

        if(data_list.length > 0) {

            index_datas = 0;

            if(options.sequential) {

                    //load recursive so that it is sequential
                recursive_load_datas( null );
            
            } else {

                    //load all fonts immediately
                    //whether that's sequential or not
                load_datas();

            } //sequential

        } else { //data_list > 0
            
        }

    } //start_datas_load

//Texts

    function start_texts_load() {

        if(text_list.length > 0) {

            index_texts = 0;

            if(options.sequential) {

                    //load recursive so that it is sequential
                recursive_load_texts( null );
            
            } else {

                    //load all fonts immediately
                    //whether that's sequential or not
                load_texts();

            } //sequential

        } //text_list > 0

    } //start_texts_load


//Texture

    function load_textures() {
        for(tex in texture_list) {
            load_texture( tex, single_item_complete );
        }
    }

//Font

    function load_fonts() {
        for(fnt in font_list) {
            load_font( fnt, single_item_complete );
        }
    }

//Shader

    function load_shaders() {
        for(shader in shader_list) {
            load_shader( shader, single_item_complete );
        }
    }

//Sound

    function load_sounds() {
        for(sound in sound_list) {
            load_sound( sound, single_item_complete );
        }
    }

//Data

    function load_datas() {
        for(data in data_list) {
            load_data( data, single_item_complete );
        }
    }

//Text

    function load_texts() {
        for(text in text_list) {
            load_text( text, single_item_complete );
        }
    }


//Texture

    function recursive_load_textures( item:Resource ) {

        if(item != null) {

            single_item_complete( item );

            if(index_textures == texture_list.length && options.sequential) {                
                start_fonts_load();
            }

        }

            //if you are debugging progress, change this line and it's closing brace
        // Luxe.timer.schedule(1, function(){

            if( index_textures < texture_list.length ) {
                    //hold current so we can skip
                var current = index_textures;
                    //increase count for complete around
                index_textures++;
                    //send off
                load_texture( texture_list[current], recursive_load_textures );

            } //not past max length

        // });  //schedule closing brace      

    } //recursive_load_textures

//Shader

    function recursive_load_shaders( item:Resource ) {

        if(item != null) {
            
            single_item_complete( item );

            if(index_shaders == shader_list.length && options.sequential) {                
                start_sounds_load();
            }

        }

            //if you are debugging progress, change this line and it's closing brace
        // Luxe.timer.schedule(1, function(){

            if( index_shaders < shader_list.length ) {
                    //hold current so we can skip
                var current = index_shaders;
                    //increase count for complete around
                index_shaders++;
                    //send off
                load_shader( shader_list[current], recursive_load_shaders );

            } //not past max length

        // });  //schedule closing brace      

    } //recursive_load_shaders

//Font

    function recursive_load_fonts( item:Resource ) {

        if(item != null) {

            single_item_complete( item );

            if(index_fonts == font_list.length && options.sequential) {                
                start_shaders_load();
            }

        }

            //if you are debugging progress, change this line and it's closing brace
        // Luxe.timer.schedule(1, function(){

            if( index_fonts < font_list.length ) {
                    //hold current so we can skip
                var current = index_fonts;
                    //increase count for complete around
                index_fonts++;
                    //send off
                load_font( font_list[current], recursive_load_fonts );

            } //not past max length

        // });  //schedule closing brace      

    } //recursive_load_fonts

//Sound

    function recursive_load_sounds( item:Resource ) {

        if(item != null) {

            single_item_complete( item );

            if(index_sounds == sound_list.length && options.sequential) {                
                start_texts_load();
            }

        }

            //if you are debugging progress, change this line and it's closing brace
        // Luxe.timer.schedule(1, function(){

            if( index_sounds < sound_list.length ) {
                    //hold current so we can skip
                var current = index_sounds;
                    //increase count for complete around
                index_sounds++;
                    //send off
                load_sound( sound_list[current], recursive_load_sounds );

            } //not past max length

        // });  //schedule closing brace      

    } //recursive_load_sounds

//Data

    function recursive_load_datas( item:Resource ) {

        if(item != null) {
            single_item_complete( item );
        }

            //if you are debugging progress, change this line and it's closing brace
        // Luxe.timer.schedule(1, function(){

            if( index_datas < data_list.length ) {
                    //hold current so we can skip
                var current = index_datas;
                    //increase count for complete around
                index_datas++;
                    //send off
                load_data( data_list[current], recursive_load_datas );

            } //not past max length

        // });  //schedule closing brace      

    } //recursive_load_datas

//Text

    function recursive_load_texts( item:Resource ) {

        if(item != null) {

            single_item_complete( item );

            if(index_texts == text_list.length && options.sequential) {                
                start_datas_load();
            }

        }

            //if you are debugging progress, change this line and it's closing brace
        // Luxe.timer.schedule(1, function(){

            if( index_texts < text_list.length ) {
                    //hold current so we can skip
                var current = index_texts;
                    //increase count for complete around
                index_texts++;
                    //send off
                load_text( text_list[current], recursive_load_texts );

            } //not past max length

        // });  //schedule closing brace      

    } //recursive_load_texts

//Public api for preparing a parcel

//Texture

    public function add_texture( _id:String ) {
        texture_list.push(_id);
    } //add_texture

    public function add_textures( list:Array<String> ) {
        for(texture in list) {
            texture_list.push(texture);
        }
    } //add_textures

//Shader

    public function add_shader( ps_id:String='default', vs_id:String='default' ) {
        shader_list.push({ ps_id:ps_id, vs_id:vs_id });
    } //add_shader

    public function add_shaders( list:Array<ShaderInfo> ) {
        for(shader_info in list) {
            shader_list.push( shader_info );
        }
    } //add_shaders

//Font

    public function add_font( _id:String, _path:String ) {
        font_list.push( { id:_id, path:_path });
    } //add_font

    public function add_fonts( list:Array<FontInfo> ) {
        for(font_info in list) {
            font_list.push( font_info );
        }
    } //add_fonts

//Sound

    public function add_sound( _id:String, _name:String, _is_music:Bool = false ) {
        sound_list.push( { id:_id, name:_name, is_music:_is_music });
    } //add_sound

    public function add_sounds( list:Array<SoundInfo> ) {
        for(sound_info in list) {
            sound_list.push( sound_info );
        }
    } //add_sounds

//Text

    public function add_text( _id:String ) {
        text_list.push( _id );
    } //add_text

    public function add_texts( list:Array<String> ) {
        for(text in list) {
            text_list.push( text );
        }
    } //add_texts

//Data

    public function add_data( _id:String ) {
        data_list.push( _id );
    } //add_text

    public function add_datas( list:Array<String> ) {
        for(data in list) {
            data_list.push( data );
        }
    } //add_fonts


//Per item handlers
    
    function load_texture( _tex:String, _complete ) {
        #if luxe_parcel_logging trace("\t parcel: loading texture " + _tex ); #end 
        
        #if (luxe_native && !parcel_thread_disabled)
            
            Sys.println("loading from thread?");
            var now = Luxe.time;

            var asset_bytes = lime.utils.Assets.getBytes( _tex );

            Sys.println('done in ' + (Luxe.time - now) + '  ' + asset_bytes.length);

                //textures require being uploaded to GL on the main thread
            Luxe.core.core_thread.sendMessage({
                type : luxe.Core.CoreThreadRequest.load_texture,
                info : {
                    id : _tex,
                    bytes : asset_bytes,
                    onloaded : _complete
                }
            });

        #else 

            Luxe.timer.schedule( options.load_spacing, function(){ 
                Luxe.loadTexture( _tex, _complete );
            });

        #end

    } //load_texture

    function load_shader( _shader:ShaderInfo, _complete ) {
        #if luxe_parcel_logging trace("\t parcel: loading shader " + _shader.ps_id + _shader.vs_id ); #end 

        #if (luxe_native && !parcel_thread_disabled)

                //textures require being uploaded to GL on the main thread
            Luxe.core.core_thread.sendMessage({
                type : luxe.Core.CoreThreadRequest.load_shader,
                info : {
                    ps_id : _shader.ps_id,
                    vs_id : _shader.vs_id,
                    onloaded : _complete
                }
            });

        #else 

            Luxe.timer.schedule( options.load_spacing, function(){ 
                Luxe.loadShader( _shader.ps_id, _shader.vs_id, _complete );
            });

        #end //end

    } //load_shader

    function load_font( _font:FontInfo, _complete ) {
        #if luxe_parcel_logging trace("\t parcel: loading font " + _font.path + _font.id ); #end 

        Luxe.timer.schedule( options.load_spacing, function(){ 
            Luxe.loadFont( _font.id, _font.path, _complete );
        });

    } //load_font

    function load_data( _data_path:String, _complete ) {
        #if luxe_parcel_logging trace("\t parcel: loading data " + _data_path ); #end 

        Luxe.timer.schedule( options.load_spacing, function(){ 
            Luxe.loadData( _data_path, _complete );
        });

    } //load_data_path

    function load_text( _text_path:String, _complete ) {
        #if luxe_parcel_logging trace("\t parcel: loading text " + _text_path ); #end 

        Luxe.timer.schedule( options.load_spacing, function(){ 
            Luxe.loadText( _text_path, _complete );
        });

    } //load_datafile

    function load_sound( _sound:SoundInfo, _complete ) {
        #if luxe_parcel_logging trace("\t parcel: loading sound " + _sound.id + " (" + _sound.name + ")" ); #end 

        Luxe.timer.schedule( options.load_spacing, function(){ 
            Luxe.loadSound( _sound.name, _sound.id, _sound.is_music, _complete );
        });

    } //load_sound

//Complete internal handler

    function do_complete() {

            //figure out how long
        time_to_load = haxe.Timer.stamp() - time_start_load;

            //tell the creator
        if( options.oncomplete != null ) {
            options.oncomplete( this );
        }

    } //do_complete

//Per item complete handler

    function single_item_complete( item:Resource ) {

        item.time_to_load = haxe.Timer.stamp() - item.time_created;

        current_count++;

        #if luxe_parcel_logging
            trace( "\t parcel: item finished " + item.id + "( " + current_count + "/" + total_items + " )"); 
        #end //luxe_parcel_logging

        if(options.onprogress != null) {
            options.onprogress( item );
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