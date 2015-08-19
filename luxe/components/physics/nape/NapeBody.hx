package luxe.components.physics.nape;

#if nape

import luxe.Vector;
import luxe.Component;
import luxe.options.ComponentOptions;

typedef NapeBodyOptions = {

	> ComponentOptions,

        /** The nape BodyType (i.e DYNAMIC, STATIC, KINEMATIC) */
    @:optional var body_type : nape.phys.BodyType;
        /** The optional InteractionFilter */
    @:optional var filter : nape.dynamics.InteractionFilter;
        /** The optional nape material */
	@:optional var material : nape.phys.Material;

} //NapeBodyOptions

class NapeBody extends Component {

	public var body(default, default) : nape.phys.Body;

    var body_options : NapeBodyOptions;
    var euler : Vector;

	public function new(_options : NapeBodyOptions) : Void {

        body_options = _options;
        euler = new Vector();

		super(body_options);

	} //new

    override function onadded() : Void {
        
        body = new nape.phys.Body(body_options.body_type);

    } //onadded

    override function onremoved() : Void {

        super.onremoved();

        if(Luxe.physics.nape.debugdraw != null) {
            Luxe.physics.nape.debugdraw.remove(body);
        }

        body.space = null;
        body = null;

    } //onremoved

    override function update(dt:Float) {

        if(entity != null) {
            entity.pos.set_xy(body.position.x, body.position.y);
            euler.z = body.rotation;
            entity.rotation.setFromEuler(euler);
        }

    } //update

//internal
    
        //stuff that should happen after being setup in onadded
    function post_add() {

        body.space = Luxe.physics.nape.space;

        if(Luxe.physics.nape.debugdraw != null) {
            Luxe.physics.nape.debugdraw.add(body);
        }
    
    } //post_add

} //Body

#end //nape
