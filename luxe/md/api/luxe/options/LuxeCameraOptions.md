
[![Logo](../../../images/logo.png)](../../../api/index.html)

---


<h1>LuxeCameraOptions</h1>
<small>`luxe.options.LuxeCameraOptions`</small>

Don't like this naming here, tentative. Will have to do for now.

<hr/>

`typedef`
<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="viewport"><a class="lift" href="#viewport">viewport</a></a><div class="clear"></div>
                <code class="signature apipage">viewport : [phoenix.Rectangle](../../../api/phoenix/Rectangle.html)</code><br/></span>
            <span class="small_desc_flat">the bounds of the viewport, common to ortho + perspective</span><br/><span class="member apipage">
                <a name="view"><a class="lift" href="#view">view</a></a><div class="clear"></div>
                <code class="signature apipage">view : [phoenix.Camera](../../../api/phoenix/Camera.html)</code><br/></span>
            <span class="small_desc_flat">Give this luxe entity camera a pre-existing phoenix view camera</span><br/><span class="member apipage">
                <a name="scene"><a class="lift" href="#scene">scene</a></a><div class="clear"></div>
                <code class="signature apipage">scene : [luxe.Scene](../../../api/luxe/Scene.html)</code><br/></span>
            <span class="small_desc_flat">if set, add to given scene. If not set, will add to default scene (unless no_scene)</span><br/><span class="member apipage">
                <a name="scale"><a class="lift" href="#scale">scale</a></a><div class="clear"></div>
                <code class="signature apipage">scale : [luxe.Vector](../../../api/luxe/Vector.html)</code><br/></span>
            <span class="small_desc_flat">the transform scale</span><br/><span class="member apipage">
                <a name="projection"><a class="lift" href="#projection">projection</a></a><div class="clear"></div>
                <code class="signature apipage">projection : [phoenix.ProjectionType](../../../api/phoenix/ProjectionType.html)</code><br/></span>
            <span class="small_desc_flat">The type of projection to use. ortho, perspective</span><br/><span class="member apipage">
                <a name="pos"><a class="lift" href="#pos">pos</a></a><div class="clear"></div>
                <code class="signature apipage">pos : [luxe.Vector](../../../api/luxe/Vector.html)</code><br/></span>
            <span class="small_desc_flat">the transform position</span><br/><span class="member apipage">
                <a name="parent"><a class="lift" href="#parent">parent</a></a><div class="clear"></div>
                <code class="signature apipage">parent : [luxe.Entity](../../../api/luxe/Entity.html)</code><br/></span>
            <span class="small_desc_flat">if set, set parent to given entity</span><br/><span class="member apipage">
                <a name="no_scene"><a class="lift" href="#no_scene">no\_scene</a></a><div class="clear"></div>
                <code class="signature apipage">no\_scene : [Null](http://api.haxe.org/Null.html)&lt;[Bool](http://api.haxe.org/Bool.html)&gt;</code><br/></span>
            <span class="small_desc_flat">if true, do not add to any scene</span><br/><span class="member apipage">
                <a name="near"><a class="lift" href="#near">near</a></a><div class="clear"></div>
                <code class="signature apipage">near : [Null](http://api.haxe.org/Null.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/></span>
            <span class="small_desc_flat">the near clipping plane, common to ortho + perspective</span><br/><span class="member apipage">
                <a name="name"><a class="lift" href="#name">name</a></a><div class="clear"></div>
                <code class="signature apipage">name : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat">the entity name. highly recommended you set this.</span><br/><span class="member apipage">
                <a name="fov"><a class="lift" href="#fov">fov</a></a><div class="clear"></div>
                <code class="signature apipage">fov : [Null](http://api.haxe.org/Null.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/></span>
            <span class="small_desc_flat">the vertical field of view, in degrees. perspective only</span><br/><span class="member apipage">
                <a name="far"><a class="lift" href="#far">far</a></a><div class="clear"></div>
                <code class="signature apipage">far : [Null](http://api.haxe.org/Null.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/></span>
            <span class="small_desc_flat">the far clipping plane, common to ortho + perspective</span><br/><span class="member apipage">
                <a name="depth_test"><a class="lift" href="#depth_test">depth\_test</a></a><div class="clear"></div>
                <code class="signature apipage">depth\_test : [Null](http://api.haxe.org/Null.html)&lt;[Bool](http://api.haxe.org/Bool.html)&gt;</code><br/></span>
            <span class="small_desc_flat">Whether or not depth testing should be enabled. defaults: ortho(false), perspective(true)</span><br/><span class="member apipage">
                <a name="cull_backfaces"><a class="lift" href="#cull_backfaces">cull\_backfaces</a></a><div class="clear"></div>
                <code class="signature apipage">cull\_backfaces : [Null](http://api.haxe.org/Null.html)&lt;[Bool](http://api.haxe.org/Bool.html)&gt;</code><br/></span>
            <span class="small_desc_flat">Whether or not to cull backfaces, defaults: ortho(false), perspective(true)</span><br/><span class="member apipage">
                <a name="camera_name"><a class="lift" href="#camera_name">camera\_name</a></a><div class="clear"></div>
                <code class="signature apipage">camera\_name : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat">The camera view name. highly recommended you set this.</span><br/><span class="member apipage">
                <a name="aspect"><a class="lift" href="#aspect">aspect</a></a><div class="clear"></div>
                <code class="signature apipage">aspect : [Null](http://api.haxe.org/Null.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/></span>
            <span class="small_desc_flat">The aspect ratio. usually `view width/view height`. perspective only</span><br/>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;