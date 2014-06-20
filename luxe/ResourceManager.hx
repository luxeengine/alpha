package luxe;

import lumen.utils.ByteArray;

import phoenix.BitmapFont;
import phoenix.Shader;
import phoenix.Texture;
import phoenix.RenderTexture;

import luxe.Resource;

class ResourceStats {    


    public var resources : Int = 0;
    public var fonts : Int = 0;
    public var textures : Int = 0;
    public var render_textures : Int = 0;
    public var shaders : Int = 0;
    public var texts : Int = 0;
    public var jsons : Int = 0;
    public var datas : Int = 0;
    public var sounds : Int = 0;
    public var unknown : Int = 0;


    public function new() {

    } //new

    public function toString() {

        return 
            'Resource Statistics\n' + 
            '\ttotal resources : ' + resources + '\n' +
            '\ttextures : ' + textures + ' \n' + '' +
            '\trender textures : ' + render_textures + ' \n' +
            '\tfonts : ' + fonts + '\n' +
            '\tshaders : ' + shaders + '\n' +
            '\tsounds : ' + sounds + '\n' +
            '\ttext : ' + texts + '\n' +
            '\tjson : ' + jsons + '\n' +
            '\tdata : ' + datas + '\n' +
            '\tunknown : ' + unknown;

    } //toString

    public function reset() {

        resources = 0;
        fonts = 0;
        textures = 0;
        render_textures = 0;
        shaders = 0;
        texts = 0;
        jsons = 0;
        datas = 0;
        sounds = 0;
        unknown = 0;

    } //reset


} //ResourceStats

class ResourceManager {
    

    public var resourcelist : Array<Resource>;
        //cache lists for creating
    public var render_textures : Map<String,RenderTexture>;
    public var textures : Map<String,Texture>;
    public var shaders : Map<String,Shader>;
    public var fonts : Map<String,BitmapFont>;
    public var data : Map<String,ByteArray>;
    public var text : Map<String,String>;
    public var json : Map<String,Dynamic>;
    public var sounds : Map<String,String>;

    public var stats : ResourceStats;


    public function new() {

        resourcelist = new Array<Resource>();
        textures = new Map();
        render_textures = new Map();
        fonts = new Map();
        shaders = new Map();
        sounds = new Map();
        data = new Map();
        text = new Map();        
        json = new Map();        
        stats = new ResourceStats();

    } //new

    public function add( res:Resource ) {
        
        resourcelist.push(res);

        switch (res.type) {

            case ResourceType.texture:
                stats.textures++;               
            case ResourceType.render_texture:
                stats.render_textures++;                
            case ResourceType.font:
                stats.fonts++;
            case ResourceType.shader:
                stats.shaders++;
            case ResourceType.sound:
                stats.sounds++;                
            case ResourceType.text:
                stats.texts++;
            case ResourceType.json:
                stats.jsons++;
            case ResourceType.data:
                stats.datas++;
            case ResourceType.unknown:
                stats.unknown++;
        
        } //switch

        stats.resources++;

    } //add

    public function remove( res:Resource ) {

        resourcelist.remove(res);
        uncache(res);

        switch (res.type) {

            case ResourceType.texture:
                stats.textures--;
            case ResourceType.render_texture:
                stats.render_textures--;
            case ResourceType.font:
                stats.fonts--;
            case ResourceType.shader:
                stats.shaders--;
            case ResourceType.sound:
                stats.sounds--;                
            case ResourceType.text:
                stats.texts--;
            case ResourceType.json:
                stats.jsons--;
            case ResourceType.data:
                stats.datas--;
            case ResourceType.unknown:
                stats.unknown--;
        }

        stats.resources--;

    } //remove

    public function uncache(res:Resource) {

        switch (res.type) {

            case ResourceType.texture:
                textures.remove(res.id);
            case ResourceType.render_texture:
                render_textures.remove(res.id);
            case ResourceType.font:
                fonts.remove(res.id);
            case ResourceType.shader:
                shaders.remove(res.id);
            case ResourceType.sound:
                sounds.remove(res.id);
            case ResourceType.data:
                data.remove(res.id);
            case ResourceType.text:
                text.remove(res.id);
            case ResourceType.json:
                json.remove(res.id);
            case ResourceType.unknown:{}

        } //switch

    } //uncache

    public function cache( res:Resource ) {

        switch (res.type) {

            case ResourceType.texture:
                textures.set(res.id, cast res);
            case ResourceType.render_texture:
                render_textures.set(res.id, cast res);
            case ResourceType.font:
                fonts.set(res.id, cast res);
            case ResourceType.shader:
                shaders.set(res.id, cast res);
            case ResourceType.sound:
                sounds.set(res.id, cast res);
            case ResourceType.text:
                text.set(res.id, cast res);
            case ResourceType.json:
                json.set(res.id, cast res);
            case ResourceType.data:
                data.set(res.id, cast res);
            case ResourceType.unknown:

        } //switch

    } //cache

    public function find_render_texture( _name:String ) {
        return render_textures.get(_name);
    } //find_render_texture

    public function find_texture( _name:String ) {
        return textures.get(_name);
    } //find_texture

    public function find_shader( _name:String ) {
        return shaders.get(_name);
    } //find_shader

    public function find_font( _name:String ) {
        return fonts.get(_name);
    } //find_font

    public function find_sound( _name:String ) {
        return sounds.get(_name);
    } //find_sound

    public function find_text( _name:String ) {
        return text.get(_name);
    } //find_text

    public function find_json( _name:String ) {
        return json.get(_name);
    } //find_json

    public function find_data( _name:String ) {
        return data.get(_name);
    } //find_data

    public function clear( ?and_persistent : Bool = false ) {
        
        var keep = [];
        for(res in resourcelist) {
            if(!res.persistent || and_persistent) {
                res.drop();     
            } else {
                keep.push(res);
            }
        }

            //kill everything, and readd them
            //will reset the counters for internal data
        resourcelist.splice(0,resourcelist.length);
        resourcelist = new Array<Resource>();
        stats.reset();

            //readd
        for(res in keep) {
            add(res);
        }

        keep = null;

    } //clear

    public function find( id : String ) : Resource {
        
        for(resource in resourcelist) {
            if(resource.id == id) {
                return resource;
            }
        }

        return null;

    } //find

    
} //ResourceManager
