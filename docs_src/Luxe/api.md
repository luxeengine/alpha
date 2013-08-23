
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

## Luxe API

All methods and objects are accessible via the Luxe class. i.e

	var text_file : String = Luxe.loadText('assets/test.txt');   

### Public values

<a name="dt">
[dt](#dt)
</a> 

<span class="small_desc"> Delta time, the time the last frame took, in seconds. </span>      


<span class="section">
   **Frame rate independence**   
<br/>
When a block travels across the screen, it can be a simple line of code. `block.position.x += 1;` This 1 here, what unit is that measured in? Actually, this is one pixel - but it is moving 1 pixel per frame. Each time the loop runs, we move one pixel. That is - at 30 frames per second, it moves 30 pixels. At 60 frames per second, it moves 60 pixels. This is really bad for games, because hardware and performance can vary from one device or computer to another. Even between different browsers, this problem can be a huge difference. One player reaches the wall, the other barely moves at all.
<br/><br/>
In order to ensure that the block moves the same distance over the same amount of time, the concept of delta time is used. This value is the milliseconds per frame (mspf), which is measured while updating your game. It is how long one update takes. By taking the time at the start of your loop, and the time at the end of the loop, you can work out how long the update has taken.
<br/><br/>
At 30 frames per second (1/30) the delta is about 0.033s. One frame, every 33.3 ms. At 60 frames per second (1/60) the delta is about 0.016 or 16.66 ms per frame. So lets say that the ball is moving at 1 pixel per frame. To solve the problem of frame rate dependence, we multiply any change in position by the mspf value, balancing out the time, making the distance always the same.
<br/><br/>
![deltatime](http://luxeengine.com/docs/images/deltatime.png)
<br/><br/>
Our example calculation becomes `ball.position.x += (1 * deltatime);`. With bigger delta (slower frame rate) the ball moves more pixels - reaching the destination at the same time as at a smaller delta (higher frame rate). This gives us concrete units that will act the same at any render speed. This is critical for animations, movements and pretty much any value that changes over time: they all should be scaled to the mspf.
<br/><br/>
</span> 

### Public default entities

[scene](luxe.scene.html)   
<span class="small_desc"> Access to the default scene </span>   
[camera](luxe.camera.html)   
<span class="small_desc"> Access to the default camera </span>    
[resources](luxe.resources.html)   
<span class="small_desc"> Access to the default resource manager </span>    

### Public objects

[core](luxe.core.html)   
<span class="small_desc"> Access to the luxe core object </span>      
[audio](luxe.audio.html)   
<span class="small_desc"> Access to the audio API </span>   
[time](luxe.time.html)   
<span class="small_desc"> Access to the time API </span>   
[events](luxe.events.html)   
 <span class="small_desc"> Access to the global events/messaging </span>   
[draw](luxe.draw.html)   
 <span class="small_desc"> Access to the drawing API </span>   
[input](luxe.input.html)   
 <span class="small_desc"> Access to the input API </span>   
[utils](luxe.utils.html)   
 <span class="small_desc"> Access to the common utilities </span>   
[screen](luxe.screen.html)   
 <span class="small_desc"> Access to the screen properties and functions</span>   
[renderer](luxe.renderer.html)   
<span class="small_desc"> Access to the rendering system </span> 

### Public methods

<a name="Core" href="#Core">
#### Core
</a>

<a name="shutdown" href="#shutdown">shutdown</a>

	shutdown() : Void   
<span class="small_desc_flat"> Quit the game/engine </span>      

<a name="Window" href="#Window">
#### Window
</a>

<span class="small_desc warn"> These functions are here temporarily, <br/>will soon be migrated to Luxe.screen.cursor </span> 

<a name="showCursor" href="#showCursor">showCursor</a>


	showCursor( _show:Bool ) : Void   
<span class="small_desc_flat"> Show the cursor inside the window </span>      

<a name="lockCursor" href="#lockCursor">lockCursor</a>

    lockCursor( _lock:Bool ) : Void   
<span class="small_desc_flat"> Lock the cursor inside the edges of the window </span>      

<a name="cursorShown" href="#cursorShown">cursorShown</a>

    cursorShown() : Bool   
<span class="small_desc_flat"> If the cursor is visible </span>          

<a name="cursorLocked" href="#cursorLocked">cursorLocked</a>

    cursorLocked() : Bool   
<span class="small_desc_flat"> If the cursor is locked </span>          

<a name="setCursorPosition" href="#setCursorPosition">setCursorPosition</a>

    setCursorPosition( _x:Int , _y:Int ) : Void   
<span class="small_desc_flat"> Set the position in screen space of the cursor in the window (0,0 top left) </span>              

<a name="Assets" href="#Assets">
#### Assets
</a>

<a name="loadText" href="#loadText">loadText</a>

	loadText( _id:String ) : String   
<span class="small_desc_flat"> Load a text based asset by id </span>      

<a name="loadTexture" href="#loadTexture">loadTexture</a>

	loadTexture( _id:String, ?_onloaded:Texture->Void ) : Texture    
<span class="small_desc_flat"> Load a Texture asset by id </span>      

<a name="loadShader" href="#loadShader">loadShader</a>

	loadShader( ?_pixel_shader_id:String="default", ?_vertex_shader_id : String="default" ) : Shader    
<span class="small_desc_flat"> Load a Shader asset by id </span>      


<a name="DefaultRenderer" href="#DefaultRenderer">
#### Shortcuts for the default Renderer
</a>

<a name="addGeometry" href="#addGeometry">addGeometry</a>

	addGeometry( _geom:Geometry ) : Void   
<span class="small_desc_flat"> Add some geometry to the default renderer </span>      

<a name="removeGeometry" href="#removeGeometry">removeGeometry</a>

	removeGeometry( _geom:Geometry ) : Void   
<span class="small_desc_flat"> Remove some geometry from the default renderer </span>      


&nbsp;
&nbsp;
&nbsp;

