

class RunTests extends luxe.Game {

    override function config( config:luxe.AppConfig ) {

        config.has_window = false;

        return config;

    } //config

	override function ready() {

			//run tests
		new transform.Transforms();

	} //ready

} //RunTests