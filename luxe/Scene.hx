package luxe;

import luxe.Input;
import luxe.options.EntityOptions;

import luxe.Log._verboser;
import luxe.Log._verbose;
import luxe.Log._debug;
import luxe.Log.log;

class Scene extends Objects {

    public var entities : Map<String,Entity>;
    public var inited : Bool = false;
    public var started : Bool = false;

    var _delayed_init_entities : Array<Entity>;
    var _delayed_reset_entities : Array<Entity>;

    public var length(get, null) : Int = 0;

    public function new( ?_name:String='untitled scene' ) {

        super(_name);


        entities = new Map<String,Entity>();

        _delayed_init_entities = [];
        _delayed_reset_entities = [];

        Luxe.core.on('init', init);
        Luxe.core.on('destroy', _destroy);
        Luxe.core.on('update', update);

        Luxe.core.on('prerender', prerender);
        Luxe.core.on('postrender', postrender);
        Luxe.core.on('render', render);

        Luxe.core.on('keydown', keydown);
        Luxe.core.on('keyup', keyup);
        Luxe.core.on('textinput', textinput);

        Luxe.core.on('inputup', inputup);
        Luxe.core.on('inputdown', inputdown);

        Luxe.core.on('mouseup', mouseup);
        Luxe.core.on('mousedown', mousedown);
        Luxe.core.on('mousemove', mousemove);
        Luxe.core.on('mousewheel', mousewheel);

        Luxe.core.on('touchup', touchup);
        Luxe.core.on('touchdown', touchdown);
        Luxe.core.on('touchmove', touchmove);

        Luxe.core.on('gamepadup', gamepadup);
        Luxe.core.on('gamepaddown', gamepaddown);
        Luxe.core.on('gamepadaxis', gamepadaxis);
        Luxe.core.on('gamepaddevice', gamepaddevice);

            //if we have already missed the internal init
        if(Luxe.core.has_inited) {
            init(null);
        }

    } //new


    public function add( entity:Entity ) {

        if(entity == null) {
            throw "can't put entity in a scene if the entity is null.";
        }

            _debug('${name} / adding ${entity.name} with id : ${entity.id}');


        entity.scene = this;
        entities.set( entity.name, entity );


            if(inited) {
                _debug('adding a delayed entity to init list ' + entity.name);
                _delayed_init_entities.push(entity);
            } //inited

            if(started) {
                _debug('adding a delayed entity to reset list ' + entity.name);
                _delayed_reset_entities.push(entity);
            } //started

    } //add

    public function remove( entity:Entity ) : Bool {

        if(entity == null) {
            throw "can't remove entity from a scene if the entity is null.";
        }

        if(entity.scene == this) {

            entity.scene = null;
            return entities.remove( entity.name );

        } else {

            log("can't remove the entity from this scene, it is not mine (entity.scene != this)");
            return false;

        }

        return false;

    } //remove

    public function empty() {

        for(entity in entities) {
            if(entity != null) {

                remove( entity );
                entity.destroy();
                entity = null;

            }
        } //each entity

    } //empty

//render

    function render(_) {

        emit('render');

    } //render

    function prerender(_) {

        emit('prerender');

    } //prerender

    function postrender(_) {

        emit('postrender');

    } //postrender

//Keys

    function keydown(e:KeyEvent) {

        _verboser('$name / key down / $e');

        emit('keydown', e);

    } //keydown

    function keyup(e:KeyEvent) {

        _verboser('$name / key up / $e');

        emit('keyup', e);

    } //keyup

    function textinput(e:TextEvent) {

        _verboser('$name / text event / $e');

        emit('textinput', e);

    } //textinput

//Mouse

    function mousedown(e:MouseEvent) {

        _verboser('$name / mousedown / $e');

        emit('mousedown', e);

    } //onmousedown

    function mousewheel(e:MouseEvent) {

        _verboser('$name / mousewheel / $e');

        emit('mousewheel', e);

    } //onmousewheel

    function mouseup(e:MouseEvent) {

        _verboser('$name / mouseup / $e');

        emit('mouseup', e);

    } //onmouseup

    function mousemove(e:MouseEvent) {

        _verboser('$name / mousemove / $e');

        emit('mousemove', e);

    } //onmousemove

//Touch

    function touchdown( event : TouchEvent ) {

        emit('touchdown', event);

    } //ontouchdown

    function touchup( event : TouchEvent ) {

        emit('touchup', event);

    } //ontouchup

    function touchmove( event : TouchEvent ) {

        emit('touchmove', event);

    } //ontouchmove

//Gamepad

    function gamepadaxis( event:GamepadEvent ) {

        emit('gamepadaxis', event);

    } //gamepadaxis

    function gamepadup( event:GamepadEvent ) {

        emit('gamepadup', event);

    } //gamepadup

    function gamepaddown( event:GamepadEvent ) {

        emit('gamepaddown', event);

    } //gamepaddown

    function gamepaddevice( event:GamepadEvent ) {

        emit('gamepaddevice', event);

    } //gamepaddown

//Input

    function inputdown( event:{ _name:String, event:InputEvent } ) {

        emit('inputdown', event);

    } //oninputdown

    function inputup( event:{ _name:String, event:InputEvent }) {

        emit('inputup', event);

    } //oninputup

//Cleanup

    function _destroy(_) {

        destroy();

    } //destroy

    public function destroy() {

        Luxe.core.off('init', init);
        Luxe.core.off('destroy', _destroy);
        Luxe.core.off('update', update);

        Luxe.core.off('prerender', prerender);
        Luxe.core.off('postrender', postrender);
        Luxe.core.off('render', render);

        Luxe.core.off('keydown', keydown);
        Luxe.core.off('keyup', keyup);
        Luxe.core.off('textinput', textinput);

        Luxe.core.off('inputup', inputup);
        Luxe.core.off('inputdown', inputdown);

        Luxe.core.off('mouseup', mouseup);
        Luxe.core.off('mousedown', mousedown);
        Luxe.core.off('mousemove', mousemove);
        Luxe.core.off('mousewheel', mousewheel);

        Luxe.core.off('touchup', touchup);
        Luxe.core.off('touchdown', touchdown);
        Luxe.core.off('touchmove', touchmove);

        Luxe.core.off('gamepadup', gamepadup);
        Luxe.core.off('gamepaddown', gamepaddown);
        Luxe.core.off('gamepadaxis', gamepadaxis);
        Luxe.core.off('gamepaddevice', gamepaddevice);

        emit('destroy');

    } //destroy

    function _do_init() : Bool {

        var _before_count = length;

        for(entity in entities) {
            if(entity != null) {
                if(!entity.inited) {
                    _verbose('calling init on an entity : ' + entity.name);
                    entity._init();
                }
            }
        }

        var _after_count = length;

        return _before_count != _after_count;

    } // _do_init

        //Entities themselves can create entities
        //inside of their init so we have to keep checking
    public function init(_) {

        var keep_going : Bool = true;
        while(keep_going) {
            keep_going = _do_init();
        }

        inited = true;

        reset();

    } //init

        //If entities are created during start they will
        // be inited and started in the next available frame
    public function reset() {

        started = false;

            emit('reset');

        started = true;

    } //reset

    function update(dt:Float) {

        Luxe.core.debug.start('scene.' + name);

            //late scene additions get init'ed and start'ed
        handle_delayed_additions();
            //just in case, as the entities are called directly
        emit('update', dt);

            //finally update them
        for(entity in entities) {
            if(entity != null) {
                entity._update(dt);
            }
        } //for each entity

        Luxe.core.debug.end('scene.' + name);

    } //update

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
                entity._reset(null);
            }
            _delayed_reset_entities.splice(0, _delayed_reset_entities.length);
        }

    } //handle_delayed_additions

    function get_length() : Int {

        return Lambda.count(entities);

    } //get_length

    function toString() {

        return 'luxe Scene: $name / $length entities / id: $id';

    } //toString


} //Scene
