
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



#TiledMap



---

`class`extends <code><span>[luxe.tilemaps.Tilemap]()</span></code>
<span class="meta">

</span>


---

&nbsp;
&nbsp;

<h3>Members</h3> <hr/><span class="member apipage">
            <a name="tiledmap_data"><a class="lift" href="#tiledmap_data">tiledmap\_data</a></a><code class="signature apipage">tiledmap\_data : [luxe.tilemaps.tiled.TiledMapData](#luxe.tilemaps.tiled.TiledMapData)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="height"><a class="lift" href="#height">height</a></a><a title="inherited from luxe.tilemaps.Tilemap" class="tooltip inherited">&gt;</a><code class="signature apipage">height : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="layers"><a class="lift" href="#layers">layers</a></a><a title="inherited from luxe.tilemaps.Tilemap" class="tooltip inherited">&gt;</a><code class="signature apipage">layers : [Map](http://api.haxe.org/Map.html)&lt;[String](http://api.haxe.org/String.html), [luxe.tilemaps.TileLayer](#luxe.tilemaps.TileLayer)&gt;</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="layers_ordered"><a class="lift" href="#layers_ordered">layers\_ordered</a></a><a title="inherited from luxe.tilemaps.Tilemap" class="tooltip inherited">&gt;</a><code class="signature apipage">layers\_ordered : [Array](http://api.haxe.org/Array.html)&lt;[luxe.tilemaps.TileLayer](#luxe.tilemaps.TileLayer)&gt;</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="orientation"><a class="lift" href="#orientation">orientation</a></a><a title="inherited from luxe.tilemaps.Tilemap" class="tooltip inherited">&gt;</a><code class="signature apipage">orientation : [luxe.tilemaps.TilemapOrientation](#luxe.tilemaps.TilemapOrientation)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="pos"><a class="lift" href="#pos">pos</a></a><a title="inherited from luxe.tilemaps.Tilemap" class="tooltip inherited">&gt;</a><code class="signature apipage">pos : [luxe.Vector](#luxe.Vector)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="properties"><a class="lift" href="#properties">properties</a></a><a title="inherited from luxe.tilemaps.Tilemap" class="tooltip inherited">&gt;</a><code class="signature apipage">properties : [Map](http://api.haxe.org/Map.html)&lt;[String](http://api.haxe.org/String.html), [String](http://api.haxe.org/String.html)&gt;</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="tile_height"><a class="lift" href="#tile_height">tile\_height</a></a><a title="inherited from luxe.tilemaps.Tilemap" class="tooltip inherited">&gt;</a><code class="signature apipage">tile\_height : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="tile_width"><a class="lift" href="#tile_width">tile\_width</a></a><a title="inherited from luxe.tilemaps.Tilemap" class="tooltip inherited">&gt;</a><code class="signature apipage">tile\_width : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="tilesets"><a class="lift" href="#tilesets">tilesets</a></a><a title="inherited from luxe.tilemaps.Tilemap" class="tooltip inherited">&gt;</a><code class="signature apipage">tilesets : [Map](http://api.haxe.org/Map.html)&lt;[String](http://api.haxe.org/String.html), [luxe.tilemaps.Tileset](#luxe.tilemaps.Tileset)&gt;</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="visuals"><a class="lift" href="#visuals">visuals</a></a><a title="inherited from luxe.tilemaps.Tilemap" class="tooltip inherited">&gt;</a><code class="signature apipage">visuals : [luxe.tilemaps.TilemapVisuals](#luxe.tilemaps.TilemapVisuals)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="width"><a class="lift" href="#width">width</a></a><a title="inherited from luxe.tilemaps.Tilemap" class="tooltip inherited">&gt;</a><code class="signature apipage">width : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><a title="inherited from luxe.tilemaps.Tilemap" class="tooltip inherited">&gt;</a><code class="signature apipage">new(options:<span>[luxe.tilemaps.TiledMapOptions](#luxe.tilemaps.TiledMapOptions)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="add_layer"><a class="lift" href="#add_layer">add\_layer</a></a><a title="inherited from luxe.tilemaps.Tilemap" class="tooltip inherited">&gt;</a><code class="signature apipage">add\_layer(options:<span>[luxe.options.TileLayerOptions](#luxe.options.TileLayerOptions)</span>) : [luxe.tilemaps.TileLayer](#luxe.tilemaps.TileLayer)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="add_tiles_fill_by_id"><a class="lift" href="#add_tiles_fill_by_id">add\_tiles\_fill\_by\_id</a></a><a title="inherited from luxe.tilemaps.Tilemap" class="tooltip inherited">&gt;</a><code class="signature apipage">add\_tiles\_fill\_by\_id(layer\_name:<span>[String](http://api.haxe.org/String.html)</span>, ?\_tileid:<span>[Int](http://api.haxe.org/Int.html)=0</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="add_tiles_from_grid"><a class="lift" href="#add_tiles_from_grid">add\_tiles\_from\_grid</a></a><a title="inherited from luxe.tilemaps.Tilemap" class="tooltip inherited">&gt;</a><code class="signature apipage">add\_tiles\_from\_grid(layer\_name:<span>[String](http://api.haxe.org/String.html)</span>, grid:<span>[Array](http://api.haxe.org/Array.html)&lt;[Array](http://api.haxe.org/Array.html)&lt;[Int](http://api.haxe.org/Int.html)&gt;&gt;</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="add_tileset"><a class="lift" href="#add_tileset">add\_tileset</a></a><a title="inherited from luxe.tilemaps.Tilemap" class="tooltip inherited">&gt;</a><code class="signature apipage">add\_tileset(options:<span>[luxe.options.TilesetOptions](#luxe.options.TilesetOptions)</span>) : [luxe.tilemaps.Tileset](#luxe.tilemaps.Tileset)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="display"><a class="lift" href="#display">display</a></a><a title="inherited from luxe.tilemaps.Tilemap" class="tooltip inherited">&gt;</a><code class="signature apipage">display(options:<span>[Dynamic](http://api.haxe.org/Dynamic.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="inside"><a class="lift" href="#inside">inside</a></a><a title="inherited from luxe.tilemaps.Tilemap" class="tooltip inherited">&gt;</a><code class="signature apipage">inside(x:<span>[Int](http://api.haxe.org/Int.html)</span>, y:<span>[Int](http://api.haxe.org/Int.html)</span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="iterator"><a class="lift" href="#iterator">iterator</a></a><a title="inherited from luxe.tilemaps.Tilemap" class="tooltip inherited">&gt;</a><code class="signature apipage">iterator() : [Iterator]()&lt;[luxe.tilemaps.TileLayer](#luxe.tilemaps.TileLayer)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="layer"><a class="lift" href="#layer">layer</a></a><a title="inherited from luxe.tilemaps.Tilemap" class="tooltip inherited">&gt;</a><code class="signature apipage">layer(layer\_name:<span>[String](http://api.haxe.org/String.html)</span>) : [Null](http://api.haxe.org/Null.html)&lt;[luxe.tilemaps.TileLayer](#luxe.tilemaps.TileLayer)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="remove_layer"><a class="lift" href="#remove_layer">remove\_layer</a></a><a title="inherited from luxe.tilemaps.Tilemap" class="tooltip inherited">&gt;</a><code class="signature apipage">remove\_layer(name:<span>[String](http://api.haxe.org/String.html)</span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="remove_tile"><a class="lift" href="#remove_tile">remove\_tile</a></a><a title="inherited from luxe.tilemaps.Tilemap" class="tooltip inherited">&gt;</a><code class="signature apipage">remove\_tile(layer\_name:<span>[String](http://api.haxe.org/String.html)</span>, x:<span>[Int](http://api.haxe.org/Int.html)</span>, y:<span>[Int](http://api.haxe.org/Int.html)</span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="remove_tileset"><a class="lift" href="#remove_tileset">remove\_tileset</a></a><a title="inherited from luxe.tilemaps.Tilemap" class="tooltip inherited">&gt;</a><code class="signature apipage">remove\_tileset(name:<span>[String](http://api.haxe.org/String.html)</span>, ?\_destroy\_textures:<span>[Bool](http://api.haxe.org/Bool.html)=false</span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="tile_at"><a class="lift" href="#tile_at">tile\_at</a></a><a title="inherited from luxe.tilemaps.Tilemap" class="tooltip inherited">&gt;</a><code class="signature apipage">tile\_at(layer\_name:<span>[String](http://api.haxe.org/String.html)</span>, x:<span>[Int](http://api.haxe.org/Int.html)</span>, y:<span>[Int](http://api.haxe.org/Int.html)</span>) : [luxe.tilemaps.Tile](#luxe.tilemaps.Tile)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="tile_at_pos"><a class="lift" href="#tile_at_pos">tile\_at\_pos</a></a><a title="inherited from luxe.tilemaps.Tilemap" class="tooltip inherited">&gt;</a><code class="signature apipage">tile\_at\_pos(layer\_name:<span>[String](http://api.haxe.org/String.html)</span>, worldpos:<span>[luxe.Vector](#luxe.Vector)</span>) : [luxe.tilemaps.Tile](#luxe.tilemaps.Tile)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="tile_pos"><a class="lift" href="#tile_pos">tile\_pos</a></a><a title="inherited from luxe.tilemaps.Tilemap" class="tooltip inherited">&gt;</a><code class="signature apipage">tile\_pos(layer\_name:<span>[String](http://api.haxe.org/String.html)</span>, x:<span>[Int](http://api.haxe.org/Int.html)</span>, y:<span>[Int](http://api.haxe.org/Int.html)</span>, ?offset\_x:<span>[luxe.tilemaps.TileOffset](#luxe.tilemaps.TileOffset)=null</span>, ?offset\_y:<span>[luxe.tilemaps.TileOffset](#luxe.tilemaps.TileOffset)=null</span>) : [phoenix.Vector](#phoenix.Vector)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="tileset"><a class="lift" href="#tileset">tileset</a></a><a title="inherited from luxe.tilemaps.Tilemap" class="tooltip inherited">&gt;</a><code class="signature apipage">tileset(layer\_name:<span>[String](http://api.haxe.org/String.html)</span>) : [Null](http://api.haxe.org/Null.html)&lt;[luxe.tilemaps.Tileset](#luxe.tilemaps.Tileset)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="tileset_from_id"><a class="lift" href="#tileset_from_id">tileset\_from\_id</a></a><a title="inherited from luxe.tilemaps.Tilemap" class="tooltip inherited">&gt;</a><code class="signature apipage">tileset\_from\_id(\_id:<span>[Int](http://api.haxe.org/Int.html)</span>) : [luxe.tilemaps.Tileset](#luxe.tilemaps.Tileset)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="worldpos_to_map"><a class="lift" href="#worldpos_to_map">worldpos\_to\_map</a></a><a title="inherited from luxe.tilemaps.Tilemap" class="tooltip inherited">&gt;</a><code class="signature apipage">worldpos\_to\_map(worldpos:<span>[luxe.Vector](#luxe.Vector)</span>) : [luxe.Vector](#luxe.Vector)</code><br/><span class="small_desc_flat"></span>
        </span>
    

<h3>Properties</h3> <hr/><span class="property apipage">
            <a name="bounds"><a class="lift" href="#bounds">bounds</a></a><a title="inherited from luxe.tilemaps.Tilemap" class="tooltip inherited">&gt;</a><code class="signature apipage">bounds : [luxe.Rectangle]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="total_height"><a class="lift" href="#total_height">total\_height</a></a><a title="inherited from luxe.tilemaps.Tilemap" class="tooltip inherited">&gt;</a><code class="signature apipage">total\_height : [Int]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="total_width"><a class="lift" href="#total_width">total\_width</a></a><a title="inherited from luxe.tilemaps.Tilemap" class="tooltip inherited">&gt;</a><code class="signature apipage">total\_width : [Int]()</code><br/><span class="small_desc_flat"></span>
        </span>

&nbsp;
&nbsp;
&nbsp;