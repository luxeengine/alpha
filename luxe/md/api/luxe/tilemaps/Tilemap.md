
[![Logo](../../../images/logo.png)](../../../api/index.html)

---


<h1>Tilemap</h1>
<small>`luxe.tilemaps.Tilemap`</small>



<hr/>

`class`<br/><span class="meta">
meta: @:keep</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="height"><a class="lift" href="#height">height</a></a><div class="clear"></div>
                <code class="signature apipage">height : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="layers"><a class="lift" href="#layers">layers</a></a><div class="clear"></div>
                <code class="signature apipage">layers : [Map](http://api.haxe.org/Map.html)&lt;[String](http://api.haxe.org/String.html), [luxe.tilemaps.TileLayer](../../../api/luxe/tilemaps/TileLayer.html)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="layers_ordered"><a class="lift" href="#layers_ordered">layers\_ordered</a></a><div class="clear"></div>
                <code class="signature apipage">layers\_ordered : [Array](http://api.haxe.org/Array.html)&lt;[luxe.tilemaps.TileLayer](../../../api/luxe/tilemaps/TileLayer.html)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="orientation"><a class="lift" href="#orientation">orientation</a></a><div class="clear"></div>
                <code class="signature apipage">orientation : [luxe.tilemaps.TilemapOrientation](../../../api/luxe/tilemaps/TilemapOrientation.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="pos"><a class="lift" href="#pos">pos</a></a><div class="clear"></div>
                <code class="signature apipage">pos : [luxe.Vector](../../../api/luxe/Vector.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="properties"><a class="lift" href="#properties">properties</a></a><div class="clear"></div>
                <code class="signature apipage">properties : [Map](http://api.haxe.org/Map.html)&lt;[String](http://api.haxe.org/String.html), [String](http://api.haxe.org/String.html)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="tile_height"><a class="lift" href="#tile_height">tile\_height</a></a><div class="clear"></div>
                <code class="signature apipage">tile\_height : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="tile_width"><a class="lift" href="#tile_width">tile\_width</a></a><div class="clear"></div>
                <code class="signature apipage">tile\_width : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="tilesets"><a class="lift" href="#tilesets">tilesets</a></a><div class="clear"></div>
                <code class="signature apipage">tilesets : [Map](http://api.haxe.org/Map.html)&lt;[String](http://api.haxe.org/String.html), [luxe.tilemaps.Tileset](../../../api/luxe/tilemaps/Tileset.html)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="visuals"><a class="lift" href="#visuals">visuals</a></a><div class="clear"></div>
                <code class="signature apipage">visuals : [luxe.tilemaps.TilemapVisuals](../../../api/luxe/tilemaps/TilemapVisuals.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="width"><a class="lift" href="#width">width</a></a><div class="clear"></div>
                <code class="signature apipage">width : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/>

<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="bounds"><a class="lift" href="#bounds">bounds</a></a><div class="clear"></div>
                <code class="signature apipage">bounds : [luxe.Rectangle](../../../api/luxe/Rectangle.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="total_height"><a class="lift" href="#total_height">total\_height</a></a><div class="clear"></div>
                <code class="signature apipage">total\_height : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="total_width"><a class="lift" href="#total_width">total\_width</a></a><div class="clear"></div>
                <code class="signature apipage">total\_width : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="add_layer"><a class="lift" href="#add_layer">add\_layer</a></a><div class="clear"></div>
            <code class="signature apipage">add\_layer(options:[luxe.options.TileLayerOptions](../../../api/luxe/options/TileLayerOptions.html)<span></span>) : [luxe.tilemaps.TileLayer](../../../api/luxe/tilemaps/TileLayer.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="add_tiles_fill_by_id"><a class="lift" href="#add_tiles_fill_by_id">add\_tiles\_fill\_by\_id</a></a><div class="clear"></div>
            <code class="signature apipage">add\_tiles\_fill\_by\_id(layer\_name:[String](http://api.haxe.org/String.html)<span></span>, \_tileid:[Int](http://api.haxe.org/Int.html)<span>=0</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="add_tiles_from_grid"><a class="lift" href="#add_tiles_from_grid">add\_tiles\_from\_grid</a></a><div class="clear"></div>
            <code class="signature apipage">add\_tiles\_from\_grid(layer\_name:[String](http://api.haxe.org/String.html)<span></span>, grid:[Array](http://api.haxe.org/Array.html)&lt;[Array](http://api.haxe.org/Array.html)&gt;<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="add_tileset"><a class="lift" href="#add_tileset">add\_tileset</a></a><div class="clear"></div>
            <code class="signature apipage">add\_tileset(options:[luxe.options.TilesetOptions](../../../api/luxe/options/TilesetOptions.html)<span></span>) : [luxe.tilemaps.Tileset](../../../api/luxe/tilemaps/Tileset.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="display"><a class="lift" href="#display">display</a></a><div class="clear"></div>
            <code class="signature apipage">display(options:[Dynamic](#)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="inside"><a class="lift" href="#inside">inside</a></a><div class="clear"></div>
            <code class="signature apipage">inside(x:[Int](http://api.haxe.org/Int.html)<span></span>, y:[Int](http://api.haxe.org/Int.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="iterator"><a class="lift" href="#iterator">iterator</a></a><div class="clear"></div>
            <code class="signature apipage">iterator() : [Iterator](#)&lt;[luxe.tilemaps.TileLayer](../../../api/luxe/tilemaps/TileLayer.html)&gt;</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="layer"><a class="lift" href="#layer">layer</a></a><div class="clear"></div>
            <code class="signature apipage">layer(layer\_name:[String](http://api.haxe.org/String.html)<span></span>) : [Null](http://api.haxe.org/Null.html)&lt;[luxe.tilemaps.TileLayer](../../../api/luxe/tilemaps/TileLayer.html)&gt;</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new(options:[luxe.options.TilemapOptions](../../../api/luxe/options/TilemapOptions.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="remove_layer"><a class="lift" href="#remove_layer">remove\_layer</a></a><div class="clear"></div>
            <code class="signature apipage">remove\_layer(name:[String](http://api.haxe.org/String.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="remove_tile"><a class="lift" href="#remove_tile">remove\_tile</a></a><div class="clear"></div>
            <code class="signature apipage">remove\_tile(layer\_name:[String](http://api.haxe.org/String.html)<span></span>, x:[Int](http://api.haxe.org/Int.html)<span></span>, y:[Int](http://api.haxe.org/Int.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="remove_tileset"><a class="lift" href="#remove_tileset">remove\_tileset</a></a><div class="clear"></div>
            <code class="signature apipage">remove\_tileset(name:[String](http://api.haxe.org/String.html)<span></span>, \_destroy\_textures:[Bool](http://api.haxe.org/Bool.html)<span>=false</span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="tile_at"><a class="lift" href="#tile_at">tile\_at</a></a><div class="clear"></div>
            <code class="signature apipage">tile\_at(layer\_name:[String](http://api.haxe.org/String.html)<span></span>, x:[Int](http://api.haxe.org/Int.html)<span></span>, y:[Int](http://api.haxe.org/Int.html)<span></span>) : [luxe.tilemaps.Tile](../../../api/luxe/tilemaps/Tile.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="tile_at_pos"><a class="lift" href="#tile_at_pos">tile\_at\_pos</a></a><div class="clear"></div>
            <code class="signature apipage">tile\_at\_pos(layer\_name:[String](http://api.haxe.org/String.html)<span></span>, worldpos:[luxe.Vector](../../../api/luxe/Vector.html)<span></span>) : [luxe.tilemaps.Tile](../../../api/luxe/tilemaps/Tile.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="tile_pos"><a class="lift" href="#tile_pos">tile\_pos</a></a><div class="clear"></div>
            <code class="signature apipage">tile\_pos(layer\_name:[String](http://api.haxe.org/String.html)<span></span>, x:[Int](http://api.haxe.org/Int.html)<span></span>, y:[Int](http://api.haxe.org/Int.html)<span></span>, offset\_x:[luxe.tilemaps.TileOffset](../../../api/luxe/tilemaps/TileOffset.html)<span>=null</span>, offset\_y:[luxe.tilemaps.TileOffset](../../../api/luxe/tilemaps/TileOffset.html)<span>=null</span>) : [phoenix.Vector](../../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="tileset"><a class="lift" href="#tileset">tileset</a></a><div class="clear"></div>
            <code class="signature apipage">tileset(layer\_name:[String](http://api.haxe.org/String.html)<span></span>) : [Null](http://api.haxe.org/Null.html)&lt;[luxe.tilemaps.Tileset](../../../api/luxe/tilemaps/Tileset.html)&gt;</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="tileset_from_id"><a class="lift" href="#tileset_from_id">tileset\_from\_id</a></a><div class="clear"></div>
            <code class="signature apipage">tileset\_from\_id(\_id:[Int](http://api.haxe.org/Int.html)<span></span>) : [luxe.tilemaps.Tileset](../../../api/luxe/tilemaps/Tileset.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="worldpos_to_map"><a class="lift" href="#worldpos_to_map">worldpos\_to\_map</a></a><div class="clear"></div>
            <code class="signature apipage">worldpos\_to\_map(worldpos:[luxe.Vector](../../../api/luxe/Vector.html)<span></span>) : [luxe.Vector](../../../api/luxe/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;