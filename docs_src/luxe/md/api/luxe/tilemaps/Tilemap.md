
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



<h1>Tilemap</h1>
<small>`luxe.tilemaps.Tilemap`</small>



---

`class`

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="layers"><a class="lift" href="#layers">layers</a></a><div class="clear"></div><code class="signature apipage">layers : [Map](#)&lt;[String](#), [luxe.tilemaps.TileLayer](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="layers_ordered"><a class="lift" href="#layers_ordered">layers\_ordered</a></a><div class="clear"></div><code class="signature apipage">layers\_ordered : [Array](#)&lt;[luxe.tilemaps.TileLayer](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="tilesets"><a class="lift" href="#tilesets">tilesets</a></a><div class="clear"></div><code class="signature apipage">tilesets : [Map](#)&lt;[String](#), [luxe.tilemaps.Tileset](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="properties"><a class="lift" href="#properties">properties</a></a><div class="clear"></div><code class="signature apipage">properties : [Map](#)&lt;[String](#), [String](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="orientation"><a class="lift" href="#orientation">orientation</a></a><div class="clear"></div><code class="signature apipage">orientation : [luxe.tilemaps.TilemapOrientation](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="visuals"><a class="lift" href="#visuals">visuals</a></a><div class="clear"></div><code class="signature apipage">visuals : [luxe.tilemaps.TilemapVisuals](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="pos"><a class="lift" href="#pos">pos</a></a><div class="clear"></div><code class="signature apipage">pos : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="tile_width"><a class="lift" href="#tile_width">tile\_width</a></a><div class="clear"></div><code class="signature apipage">tile\_width : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="tile_height"><a class="lift" href="#tile_height">tile\_height</a></a><div class="clear"></div><code class="signature apipage">tile\_height : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="width"><a class="lift" href="#width">width</a></a><div class="clear"></div><code class="signature apipage">width : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="height"><a class="lift" href="#height">height</a></a><div class="clear"></div><code class="signature apipage">height : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="total_width"><a class="lift" href="#total_width">total\_width</a></a><div class="clear"></div><code class="signature apipage">total\_width : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="total_height"><a class="lift" href="#total_height">total\_height</a></a><div class="clear"></div><code class="signature apipage">total\_height : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="bounds"><a class="lift" href="#bounds">bounds</a></a><div class="clear"></div><code class="signature apipage">bounds : [luxe.Rectangle](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="display"><a class="lift" href="#display">display</a></a> <div class="clear"></div><code class="signature apipage">display(options:[Dynamic](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="inside"><a class="lift" href="#inside">inside</a></a> <div class="clear"></div><code class="signature apipage">inside(x:[Int](#)<span></span>, y:[Int](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="tile_pos"><a class="lift" href="#tile_pos">tile\_pos</a></a> <div class="clear"></div><code class="signature apipage">tile\_pos(layer\_name:[String](#)<span></span>, x:[Int](#)<span></span>, y:[Int](#)<span></span>, offset\_x:[luxe.tilemaps.TileOffset](#)<span>=null</span>, offset\_y:[luxe.tilemaps.TileOffset](#)<span>=null</span>) : [phoenix.Vector](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="tile_at_pos"><a class="lift" href="#tile_at_pos">tile\_at\_pos</a></a> <div class="clear"></div><code class="signature apipage">tile\_at\_pos(layer\_name:[String](#)<span></span>, worldpos:[luxe.Vector](#)<span></span>) : [luxe.tilemaps.Tile](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="worldpos_to_map"><a class="lift" href="#worldpos_to_map">worldpos\_to\_map</a></a> <div class="clear"></div><code class="signature apipage">worldpos\_to\_map(worldpos:[luxe.Vector](#)<span></span>) : [luxe.Vector](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="layer"><a class="lift" href="#layer">layer</a></a> <div class="clear"></div><code class="signature apipage">layer(layer\_name:[String](#)<span></span>) : [Null](#)&lt;[luxe.tilemaps.TileLayer](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="tileset"><a class="lift" href="#tileset">tileset</a></a> <div class="clear"></div><code class="signature apipage">tileset(layer\_name:[String](#)<span></span>) : [Null](#)&lt;[luxe.tilemaps.Tileset](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="tile_at"><a class="lift" href="#tile_at">tile\_at</a></a> <div class="clear"></div><code class="signature apipage">tile\_at(layer\_name:[String](#)<span></span>, x:[Int](#)<span></span>, y:[Int](#)<span></span>) : [luxe.tilemaps.Tile](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="iterator"><a class="lift" href="#iterator">iterator</a></a> <div class="clear"></div><code class="signature apipage">iterator() : [Iterator](#)&lt;[luxe.tilemaps.TileLayer](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="add_tileset"><a class="lift" href="#add_tileset">add\_tileset</a></a> <div class="clear"></div><code class="signature apipage">add\_tileset(options:[luxe.options.TilesetOptions](#)<span></span>) : [luxe.tilemaps.Tileset](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="tileset_from_id"><a class="lift" href="#tileset_from_id">tileset\_from\_id</a></a> <div class="clear"></div><code class="signature apipage">tileset\_from\_id(\_id:[Int](#)<span></span>) : [luxe.tilemaps.Tileset](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="remove_tile"><a class="lift" href="#remove_tile">remove\_tile</a></a> <div class="clear"></div><code class="signature apipage">remove\_tile(layer\_name:[String](#)<span></span>, x:[Int](#)<span></span>, y:[Int](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="remove_tileset"><a class="lift" href="#remove_tileset">remove\_tileset</a></a> <div class="clear"></div><code class="signature apipage">remove\_tileset(name:[String](#)<span></span>, \_destroy\_textures:[Bool](#)<span>=false</span>) : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="remove_layer"><a class="lift" href="#remove_layer">remove\_layer</a></a> <div class="clear"></div><code class="signature apipage">remove\_layer(name:[String](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="add_layer"><a class="lift" href="#add_layer">add\_layer</a></a> <div class="clear"></div><code class="signature apipage">add\_layer(options:[luxe.options.TileLayerOptions](#)<span></span>) : [luxe.tilemaps.TileLayer](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="add_tiles_fill_by_id"><a class="lift" href="#add_tiles_fill_by_id">add\_tiles\_fill\_by\_id</a></a> <div class="clear"></div><code class="signature apipage">add\_tiles\_fill\_by\_id(layer\_name:[String](#)<span></span>, \_tileid:[Int](#)<span>=0</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="add_tiles_from_grid"><a class="lift" href="#add_tiles_from_grid">add\_tiles\_from\_grid</a></a> <div class="clear"></div><code class="signature apipage">add\_tiles\_from\_grid(layer\_name:[String](#)<span></span>, grid:[Array](#)&lt;[Array](#)&gt;<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a> <div class="clear"></div><code class="signature apipage">new(options:[luxe.options.TilemapOptions](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;