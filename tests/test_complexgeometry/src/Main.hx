
import luxe.Color;
import luxe.Vector;
import luxe.Input;

class Main extends luxe.Game {

    public function ready() {

        var geom = new phoenix.geometry.ComplexGeometry({

        });

            //create a quad inside the complex geometry
        var quad1 = geom.quad_add({
            x: 100, y:100,
            w: 64,  h:64
        });

            //move it over
        geom.quad_pos( quad1, new Vector(960 - 64,200) );
            //color it
        geom.quad_color( quad1, new Color(0,0,0,1).rgb(0xf6007b) );
            //color the alpha only
        geom.quad_alpha( quad1, 0.5 );

            //add to the renderer
        Luxe.addGeometry( geom );

    } //ready
  
    public function onkeyup(e) {
        
        if(e.value == Input.Keys.escape) {
            Luxe.shutdown();
        } //escape

    } //onkeyup

    public function update(dt:Float) {



    } //update

    public function shutdown() {



    } //shutdown
}


