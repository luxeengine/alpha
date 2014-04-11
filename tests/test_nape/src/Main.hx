
import luxe.Input;

import nape.geom.Vec2;
import nape.phys.Body;
import nape.phys.BodyType;
import nape.shape.Circle;
import nape.shape.Polygon;

import nape.utils.Debug;

class Main extends luxe.Game {


    public function ready() {

        var w = Luxe.screen.w;
        var h = Luxe.screen.h;

        var floor = new Body(BodyType.STATIC);
        
            floor.shapes.add(new Polygon(Polygon.rect(50, (h - 50), (w - 100), 1)));
            floor.space = Luxe.physics.nape.space;

            for (i in 0...16) {
                var box = new Body(BodyType.DYNAMIC);
                box.shapes.add(new Polygon(Polygon.box(16, 32)));
                box.position.setxy((w / 2), ((h - 50) - 32 * (i + 0.5)));
                box.space = Luxe.physics.nape.space;
            }

            var ball = new Body(BodyType.DYNAMIC);
                ball.shapes.add(new Circle(50));
                ball.position.setxy(50, h / 2);
                ball.angularVel = 10;
                ball.space = Luxe.physics.nape.space;
         

    } //ready

    public function onkeyup( e:KeyEvent ) {

        if(e.key == KeyValue.escape) {
            Luxe.shutdown();
        }
        
    } //onkeyup

    public function update(dt:Float) {

    } //update


} //Main
