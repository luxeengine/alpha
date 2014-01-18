
import luxe.Input;
import luxe.utils.Base64;

class Main extends luxe.Game {

    public function ready() {

    	var encoded = Base64.encode('hello world');
        var decoded = Base64.decode( encoded );

        Luxe.draw.text({
        	text: "from hello world to `" + encoded + "` and back to `" + decoded +"`",
        	pos : Luxe.screen.mid,
        	align : luxe.Text.TextAlign.center
        });

    } //ready

    public function onkeyup( e:KeyEvent ) {

        if(e.key == KeyValue.escape) {
            Luxe.shutdown();
        }
        
    } //onkeyup

    public function update(dt:Float) {

    } //update

} //Main