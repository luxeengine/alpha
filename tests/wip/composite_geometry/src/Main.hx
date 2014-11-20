
import luxe.Color;
import luxe.Input;
import luxe.Sprite;
import luxe.Vector;
import luxe.Rectangle;
import luxe.Text;
import luxe.Camera;
import luxe.Visual;
import phoenix.geometry.CompositeGeometry;
import phoenix.geometry.Geometry;
import phoenix.Texture;

class Main extends luxe.Game {

	var composite:CompositeGeometry;
	var box:Geometry;
	var visual:Visual;

    override function config( config:luxe.AppConfig ) {

        config.window.width = 640;
        config.window.height = 480;

        return config;

    } //config

    override function ready() {
		//Create a box at 0,0
		box = Luxe.draw.box( {
			w:64,
			h:64,
			color:new Color().rgb(0xf94b04),
			no_batcher_add:true
		});

		//Move the box to modify its transform
		box.translate(new Vector().set_xy(30, 30));

		composite = new CompositeGeometry();
		//add the box to the composite, linking the transforms
		composite.add_geometry(box);

		visual = new Visual({
			name:'Visual',
			geometry:composite
		});

		Luxe.draw.text( { text:'Click the mouse to link/unlink the box' } );

    } //ready

    override function onmousemove( e:MouseEvent ) {
       visual.pos = e.pos;
    }

	override public function onmousedown(event:MouseEvent)
	{
		if (composite.has_geometry(box)) {
			composite.remove_geometry(box);
		}
		else {
			composite.add_geometry(box);
		}
	} //onmousedown

} //Main
