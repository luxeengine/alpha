
[![Logo](../../../images/logo.png)](../../../api/index.html)

---


<h1>CameraOptions</h1>
<small>`luxe.options.CameraOptions`</small>



<hr/>

`typedef`
<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="viewport"><a class="lift" href="#viewport">viewport</a></a><div class="clear"></div>
                <code class="signature apipage">viewport : [phoenix.Rectangle](../../../api/phoenix/Rectangle.html)</code><br/></span>
            <span class="small_desc_flat">the bounds of the viewport, common to ortho + perspective</span><br/><span class="member apipage">
                <a name="projection"><a class="lift" href="#projection">projection</a></a><div class="clear"></div>
                <code class="signature apipage">projection : [phoenix.ProjectionType](../../../api/phoenix/ProjectionType.html)</code><br/></span>
            <span class="small_desc_flat">The type of projection to use. ortho, perspective</span><br/><span class="member apipage">
                <a name="near"><a class="lift" href="#near">near</a></a><div class="clear"></div>
                <code class="signature apipage">near : [Null](http://api.haxe.org/Null.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/></span>
            <span class="small_desc_flat">the near clipping plane, common to ortho + perspective</span><br/><span class="member apipage">
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