
import luxe.GameConfig;
import luxe.Input;

class Main extends luxe.Game {

    override function config(config:GameConfig) {

        config.preload.textures.push({ id:'assets/luxe.png' });

        return config;

    } //config

    override function ready() {

        #if web
            web_cursor();
        #end

        #if desktop
            desktop_cursor();
        #end

    } //ready

    function web_cursor() {
        
        #if web

                //On web targets, the canvas or the document css can be modified.
                //The cursor property is well documented, so this just shows you how.
            var canvas: js.html.CanvasElement = Luxe.snow.runtime.window;
                canvas.style.cursor = 'url(assets/luxe.png) 25 4, auto';

        #end

    } //web_cursor

    function desktop_cursor() {
        
        #if desktop
            //

                //Get the texture image if you're using a texture
            var texture = Luxe.resources.texture('assets/luxe.png');
                //Since the pixels aren't kept when loading, we fetch them from the GPU as RGBA
            var pixels = new snow.api.buffers.Uint8Array(texture.width * texture.height * 4); //RGBA
                texture.fetch(pixels);

                //An alternative to texture.fetch is use Luxe.snow.assets.image(),
                //which returns a promise that when loaded, contains the AssetImage,
                //and that asset.image.pixels is the same Uint8Array format.
                //The asset also contains the width, height, and bpp needed for the info below.
                
                // var get = Luxe.snow.assets.image('assets/logo.png');
                // get.then(function(asset:snow.systems.assets.Asset.AssetImage){
                //     asset.image.pixels
                // });

                //Now, we get the raw bytes data to talk to SDL with
            var bytes: haxe.io.BytesData = pixels.toBytes().getData();
                //SDL wants a surface to create a cursor from
            var surface = sdl.SDL.createRGBSurfaceFrom(bytes, 
                texture.width, 
                texture.height, 
                32,                 //32 bits, 8 bits per pixel = R G B A
                texture.width*4,    //pitch is the stride, in our case, width * 4 (R G B A * width is one row of pixels)
                0x000000ff,         //the masks are in little endian for all luxe targets, so red
                0x0000ff00,         //blue
                0x00ff0000,         //green
                0xff000000          //alpha
            );

                //Then create a cursor from it, the hot spot is where pointing happens
            var cursor = sdl.SDL.createColorCursor(surface, 25, 4);
                //And finally, set the cursor.
            sdl.SDL.setCursor(cursor);

            //Additional notes:
            //- `import sdl.SDL` to shorten the calls
            //- use SDL.getError() to diagnose issues after each call
            //- Don't forget SDL is native targets only, 
            //  and cursors on mobile are not really a thing. 
            //  Use #if desktop or your own define

        #end //if desktop
    
    } //desktop_cursor

    override function onkeyup(event:KeyEvent) {

        if(event.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

} //Main
