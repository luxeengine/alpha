
import luxe.Input;

class Main extends luxe.Game {

    public function ready() {

    	var bytes = Luxe.loadData('assets/asset.bytes');
    	var text = Luxe.loadText('assets/asset.txt');

    	//all other asset loading is done in other tests, 
    	// loadShader - test_shaders
    	// loadTexture - test_sprite, etc

    	trace("bytes: " + bytes );
    	trace("text: " + text);

    	Luxe.core.show_console(true);

    } //ready

    public function onkeyup( e:KeyEvent ) {

        if(e.key == KeyValue.escape) {
            Luxe.shutdown();
        }
        
    } //onkeyup

    public function update(dt:Float) {

    } //update

} //Main