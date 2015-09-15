
import luxe.Input;

import luxe.physics.nape.DebugDraw;
import luxe.Vector;
import nape.constraint.PivotJoint;

import nape.phys.Body;
import nape.phys.BodyType;
import nape.geom.Vec2;
import nape.phys.Material;
import nape.shape.Polygon;

import luxe.components.physics.nape.*;

class Main extends luxe.Game {

        //the debug drawer
    var drawer : DebugDraw;
        //for attaching to the mouse when dragging
    var mouseJoint : PivotJoint;

    override function ready() {

        Luxe.renderer.clear_color.rgb(0xffffff);

        Luxe.renderer.batcher.on(prerender, function(_) { Luxe.renderer.state.lineWidth(2); });
        Luxe.renderer.batcher.on(postrender, function(_) { Luxe.renderer.state.lineWidth(1); });

        reset_world();

    } //ready

        //overriding the built in function to configure the default window
    override function config( config:luxe.AppConfig ) {

        config.window.title = "nape physics components";
        config.render.antialiasing = 4;

        config.preload.textures.push({ id:'assets/box.png' });
        config.preload.textures.push({ id:'assets/circle.png' });

        return config;

    } //config

    function reset_world() {

        if(drawer != null) {
            drawer.destroy();
            drawer = null;
        }

            //create the drawer, and assign it to the nape debug drawer
        drawer = new DebugDraw();
        Luxe.physics.nape.debugdraw = drawer;

        var w = Luxe.screen.w;
        var h = Luxe.screen.h;

        mouseJoint = new PivotJoint(Luxe.physics.nape.space.world, null, Vec2.weak(), Vec2.weak());
        mouseJoint.space = Luxe.physics.nape.space;
        mouseJoint.active = false;
        mouseJoint.stiff = false;

        var border = new Body(BodyType.STATIC);

            border.shapes.add(new Polygon(Polygon.rect(0, 0, w, -1)));
            border.shapes.add(new Polygon(Polygon.rect(0, h, w, 1)));
            border.shapes.add(new Polygon(Polygon.rect(0, 0, -1, h)));
            border.shapes.add(new Polygon(Polygon.rect(w, 0, 1, h)));
            border.space = Luxe.physics.nape.space;

            drawer.add(border);

        var circle = new luxe.Sprite({ name:'circle', texture:Luxe.resources.texture('assets/circle.png') });
        var box = new luxe.Sprite({ name:'box', texture:Luxe.resources.texture('assets/box.png') });
        var poly = new luxe.Entity({ name:'poly' });

        var circle_col = new CircleCollider({
            body_type:BodyType.DYNAMIC,
            material:Material.rubber(),
            x:100, y:100, r:64
        });

        var box_col = new BoxCollider({
            body_type:BodyType.DYNAMIC,
            material:Material.wood(),
            x:140, y:100, w:128, h:128
        });

        var points = [
            new Vector(6, 21),
            new Vector(105, 0),
            new Vector(118, 10),
            new Vector(166, 160),
            new Vector(39, 197),
            new Vector(0, 33)
        ];

        var poly_col = new PolygonCollider({
            body_type:BodyType.DYNAMIC,
            x:400, y:100, polygon:points
        });

        circle.add(circle_col);
        box.add(box_col);
        poly.add(poly_col);

    } //reset_world

    override function onmouseup( e:MouseEvent ) {

        mouseJoint.active = false;

    } //onmouseup

    override function onmousedown( e:MouseEvent ) {

        var mousePoint = Vec2.get(e.pos.x, e.pos.y);

        for (body in Luxe.physics.nape.space.bodiesUnderPoint(mousePoint)) {

            if (!body.isDynamic()) {
                continue;
            }

            mouseJoint.anchor1.setxy(e.pos.x, e.pos.y);

            // Configure hand joint to drag this body.
            //   We initialise the anchor point on this body so that
            //   constraint is satisfied.
            //
            //   The second argument of worldPointToLocal means we get back
            //   a 'weak' Vec2 which will be automatically sent back to object
            //   pool when setting the mouseJoint's anchor2 property.
            mouseJoint.body2 = body;
            mouseJoint.anchor2.set( body.worldPointToLocal(mousePoint, true));

            // Enable hand joint!
            mouseJoint.active = true;

            break;
        }

        mousePoint.dispose();

    } //onmousedown

    override function onmousemove( e:MouseEvent ) {
        if (mouseJoint.active) {
            mouseJoint.anchor1.setxy(e.pos.x, e.pos.y);
        }
    }

    #if mobile
        override function ontouchmove( e:TouchEvent ) {

            if (mouseJoint.active) {
                mouseJoint.anchor1.setxy(e.pos.x, e.pos.y);
            }

        } //ontouchmove
    #end //mobile

    var ramp = false;
    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.key_r) {
            Luxe.scene.empty();
            Luxe.physics.nape.space.clear();
            reset_world();
        }

        if(e.keycode == Key.key_e) {
            ramp = !ramp;
            if(ramp) {
                luxe.tween.Actuate.tween( Luxe, 0.8, { timescale:0.3 });
            } else {
                luxe.tween.Actuate.tween( Luxe, 0.8, { timescale:1 });
            }
        }

        if(e.keycode == Key.key_g) {
            Luxe.physics.nape.draw = !Luxe.physics.nape.draw;
        }

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup


} //Main
