
[![Logo](../../../../images/logo.png)](../../../../api/index.html)

---



<h1>Shape</h1>
<small>`luxe.collision.shapes.Shape`</small>

A base collision class shape

---

`class`

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="active"><a class="lift" href="#active">active</a></a><div class="clear"></div><code class="signature apipage">active : [Bool](#)</code><br/></span>
            <span class="small_desc_flat">The state of this shape, if inactive can be ignored in results</span><span class="member apipage">
                <a name="name"><a class="lift" href="#name">name</a></a><div class="clear"></div><code class="signature apipage">name : [String](#)</code><br/></span>
            <span class="small_desc_flat">The name of this shape, to help in debugging</span><span class="member apipage">
                <a name="data"><a class="lift" href="#data">data</a></a><div class="clear"></div><code class="signature apipage">data : [Dynamic](#)</code><br/></span>
            <span class="small_desc_flat">A generic data object where you can store anything you want, for later use</span><span class="member apipage">
                <a name="tags"><a class="lift" href="#tags">tags</a></a><div class="clear"></div><code class="signature apipage">tags : [Map](#)&lt;[String](#), [String](#)&gt;</code><br/></span>
            <span class="small_desc_flat">A list of tags to use for marking shapes with data for later use, by key/value</span><span class="member apipage">
                <a name="_position"><a class="lift" href="#_position">\_position</a></a><div class="clear"></div><code class="signature apipage">\_position : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="_rotation"><a class="lift" href="#_rotation">\_rotation</a></a><div class="clear"></div><code class="signature apipage">\_rotation : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="_rotation_radians"><a class="lift" href="#_rotation_radians">\_rotation\_radians</a></a><div class="clear"></div><code class="signature apipage">\_rotation\_radians : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="_rotation_quat"><a class="lift" href="#_rotation_quat">\_rotation\_quat</a></a><div class="clear"></div><code class="signature apipage">\_rotation\_quat : [luxe.Quaternion](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="_scale"><a class="lift" href="#_scale">\_scale</a></a><div class="clear"></div><code class="signature apipage">\_scale : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="_scaleX"><a class="lift" href="#_scaleX">\_scaleX</a></a><div class="clear"></div><code class="signature apipage">\_scaleX : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="_scaleY"><a class="lift" href="#_scaleY">\_scaleY</a></a><div class="clear"></div><code class="signature apipage">\_scaleY : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="_transformed"><a class="lift" href="#_transformed">\_transformed</a></a><div class="clear"></div><code class="signature apipage">\_transformed : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="_transformMatrix"><a class="lift" href="#_transformMatrix">\_transformMatrix</a></a><div class="clear"></div><code class="signature apipage">\_transformMatrix : [luxe.Matrix](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="_transformedVertices"><a class="lift" href="#_transformedVertices">\_transformedVertices</a></a><div class="clear"></div><code class="signature apipage">\_transformedVertices : [Array](#)&lt;[luxe.Vector](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="_vertices"><a class="lift" href="#_vertices">\_vertices</a></a><div class="clear"></div><code class="signature apipage">\_vertices : [Array](#)&lt;[luxe.Vector](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="position"><a class="lift" href="#position">position</a></a> <div class="clear"></div><code class="signature apipage">position : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat">The position of this shape</span><span class="member apipage">
                <a name="x"><a class="lift" href="#x">x</a></a> <div class="clear"></div><code class="signature apipage">x : [Float](#)</code><br/></span>
            <span class="small_desc_flat">The x position of this shape</span><span class="member apipage">
                <a name="y"><a class="lift" href="#y">y</a></a> <div class="clear"></div><code class="signature apipage">y : [Float](#)</code><br/></span>
            <span class="small_desc_flat">The y position of this shape</span><span class="member apipage">
                <a name="rotation"><a class="lift" href="#rotation">rotation</a></a> <div class="clear"></div><code class="signature apipage">rotation : [Float](#)</code><br/></span>
            <span class="small_desc_flat">The rotation of this shape, in degrees</span><span class="member apipage">
                <a name="scaleX"><a class="lift" href="#scaleX">scaleX</a></a> <div class="clear"></div><code class="signature apipage">scaleX : [Float](#)</code><br/></span>
            <span class="small_desc_flat">The scale in the x direction of this shape</span><span class="member apipage">
                <a name="scaleY"><a class="lift" href="#scaleY">scaleY</a></a> <div class="clear"></div><code class="signature apipage">scaleY : [Float](#)</code><br/></span>
            <span class="small_desc_flat">The scale in the y direction of this shape</span><span class="member apipage">
                <a name="transformedVertices"><a class="lift" href="#transformedVertices">transformedVertices</a></a> <div class="clear"></div><code class="signature apipage">transformedVertices : [Array](#)&lt;[luxe.Vector](#)&gt;</code><br/></span>
            <span class="small_desc_flat">The transformed (rotated/scale) vertices cache</span><span class="member apipage">
                <a name="vertices"><a class="lift" href="#vertices">vertices</a></a> <div class="clear"></div><code class="signature apipage">vertices : [Array](#)&lt;[luxe.Vector](#)&gt;</code><br/></span>
            <span class="small_desc_flat">The vertices of this shape</span>



<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a> <div class="clear"></div><code class="signature apipage">destroy() : [Void](#)</code><br/><span class="small_desc_flat">clean up and destroy this shape</span>
        </span>
    <span class="method apipage">
            <a name="refresh_transform"><a class="lift" href="#refresh_transform">refresh\_transform</a></a> <div class="clear"></div><code class="signature apipage">refresh\_transform() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_position"><a class="lift" href="#get_position">get\_position</a></a> <div class="clear"></div><code class="signature apipage">get\_position() : [luxe.Vector](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_position"><a class="lift" href="#set_position">set\_position</a></a> <div class="clear"></div><code class="signature apipage">set\_position(v:[luxe.Vector](#)<span></span>) : [luxe.Vector](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_x"><a class="lift" href="#get_x">get\_x</a></a> <div class="clear"></div><code class="signature apipage">get\_x() : [Float](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_x"><a class="lift" href="#set_x">set\_x</a></a> <div class="clear"></div><code class="signature apipage">set\_x(x:[Float](#)<span></span>) : [Float](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_y"><a class="lift" href="#get_y">get\_y</a></a> <div class="clear"></div><code class="signature apipage">get\_y() : [Float](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_y"><a class="lift" href="#set_y">set\_y</a></a> <div class="clear"></div><code class="signature apipage">set\_y(y:[Float](#)<span></span>) : [Float](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_rotation"><a class="lift" href="#get_rotation">get\_rotation</a></a> <div class="clear"></div><code class="signature apipage">get\_rotation() : [Float](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_rotation"><a class="lift" href="#set_rotation">set\_rotation</a></a> <div class="clear"></div><code class="signature apipage">set\_rotation(v:[Float](#)<span></span>) : [Float](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_scaleX"><a class="lift" href="#get_scaleX">get\_scaleX</a></a> <div class="clear"></div><code class="signature apipage">get\_scaleX() : [Float](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_scaleX"><a class="lift" href="#set_scaleX">set\_scaleX</a></a> <div class="clear"></div><code class="signature apipage">set\_scaleX(scale:[Float](#)<span></span>) : [Float](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_scaleY"><a class="lift" href="#get_scaleY">get\_scaleY</a></a> <div class="clear"></div><code class="signature apipage">get\_scaleY() : [Float](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_scaleY"><a class="lift" href="#set_scaleY">set\_scaleY</a></a> <div class="clear"></div><code class="signature apipage">set\_scaleY(scale:[Float](#)<span></span>) : [Float](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_transformedVertices"><a class="lift" href="#get_transformedVertices">get\_transformedVertices</a></a> <div class="clear"></div><code class="signature apipage">get\_transformedVertices() : [Array](#)&lt;[luxe.Vector](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_vertices"><a class="lift" href="#get_vertices">get\_vertices</a></a> <div class="clear"></div><code class="signature apipage">get\_vertices() : [Array](#)&lt;[luxe.Vector](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a> <div class="clear"></div><code class="signature apipage">new(\_x:[Float](#)<span></span>, \_y:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Create a new shape at give position x,y</span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;