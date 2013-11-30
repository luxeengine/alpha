
import luxe.Vector;
import luxe.Input;
import luxe.structural.Stack;

class Main extends luxe.Game {


    public function ready() {

        var s = new Stack<String>();

        s.push('last');
        s.push('secondlast');
        s.push('fifth');
        s.push('fourth');
        s.push('third');
        s.push('second');
        s.push('first');

        Luxe.core.show_console(true);

        trace("stack should have 7 elements, it has " + s.length);
        trace("they are : ");
        
        for(_s in s) {
            trace(_s);
        }


    } //ready
  
    public function onkeyup(e) {
        if(e.value == Input.Keys.escape) {
            Luxe.shutdown();
        }
    } //onkeyup

    public function update(dt:Float) {

    } //update

    public function shutdown() {

    } //shutdown
}


