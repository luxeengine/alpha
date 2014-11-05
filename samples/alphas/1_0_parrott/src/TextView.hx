import luxe.States;
import luxe.Text;
import luxe.Color;
import luxe.Vector;
import luxe.Log.log;
import phoenix.BitmapFont;

class TextView extends State {

    var root : Parrott;

    var font : BitmapFont;
    var letters : Array<Text>;

    var start : Float = 0;
    var high : Float = 12;

        //remember that new happens when you call new TextView. that means
        //you will want to avoid doing things that are meant to happen during/after `init` event
        //because that stuff hasn't happened yet if you aren't watching out for it.
    public function new( _root:Parrott ) {

            //sets the name for the state in the machine
        super({name:'textview'});

            //store the reference to our parent for access to the state machine
        root = _root;

        letters = [];

        var string = ['l','u','x','e',' ','a','l','p','h','a', '-', '1','.','0','+','p','a','r','r','o','t','t'];

        start = Luxe.screen.mid.x - ((string.length * 32)/2);

        font = Luxe.loadFont('alpha.fnt', 'assets/font/', function(_){

            for(letter in string) {

                var _text = new Text({
                    text : letter,
                    font : font,    //use the custom font
                    depth : 3,      //make sure its above the tiles
                    pos : new Vector(start + (letters.length*32), Luxe.screen.mid.y ),
                    size:72
                });

                letters.push(_text);

            } //each letter

        }); //font onload


    } //new

    override function onenabled<T>( ignored:T ) {

        log('onenabled textview');

    } //onenabled

    override function ondisabled<T>( ignored:T ) {

        log('ondisabled textview');

    } //ondisabled

    override function update(dt:Float) {

        var index = 0;
        for(letter in letters) {
            var n = (Luxe.time*0.8) + index;
            letter.pos.y = (Luxe.screen.mid.y + Math.cos(n) * high);
            index++;
        }

    } //update


} //TextView