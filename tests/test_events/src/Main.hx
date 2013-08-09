
import luxe.Vector;
import luxe.Input;
import luxe.Entity;

class Main extends luxe.Game {

    var entity : Entity;

    public function ready() {

            //Global events connections
        Luxe.events.listen( 'global event' , function(e){
            trace("Global Event Fired");
        });

            //Connect global to local event
        Luxe.events.listen( 'local event' , function(e){
            trace("Should not print");
        });

            //Local to entity event connections
        entity = Luxe.scene.create(Entity,'temp');
            //Add to the scene so it can initialise
        Luxe.scene.add(entity);

        entity.events.listen('local event', function(e){
            trace("Local Event Fired");
        });

    } //ready
  
    public function onkeyup(e) {

        if(e.value == Input.Keys.escape) {
            Luxe.shutdown();
        }

        if(e.value == Input.Keys.space) {
            
            Luxe.events.fire( 'global event' );
            entity.events.fire( 'local event' );

        } //space

    } //onkeyup

    public function update(dt:Float) {

    } //update

    public function shutdown() {

    } //shutdown
}


