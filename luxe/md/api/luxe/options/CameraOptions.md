
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



<h1>CameraOptions</h1>
<small>`luxe.options.CameraOptions`</small>



---

`typedef`


---


&nbsp;
&nbsp;







<h3>Members</h3> <hr/><span class="member apipage">
                <a name="viewport"><a class="lift" href="#viewport">viewport</a></a><div class="clear"></div>
                <code class="signature apipage">viewport : [phoenix.Rectangle](#)</code><br/></span>
            <span class="small_desc_flat">the bounds of the viewport, common to ortho + perspective</span><span class="member apipage">
                <a name="projection"><a class="lift" href="#projection">projection</a></a><div class="clear"></div>
                <code class="signature apipage">projection : [phoenix.ProjectionType](#)</code><br/></span>
            <span class="small_desc_flat">The type of projection to use. ortho, perspective</span><span class="member apipage">
                <a name="near"><a class="lift" href="#near">near</a></a><div class="clear"></div>
                <code class="signature apipage">near : [Null](#)&lt;[Float](#)&gt;</code><br/></span>
            <span class="small_desc_flat">the near clipping plane, common to ortho + perspective</span><span class="member apipage">
                <a name="fov"><a class="lift" href="#fov">fov</a></a><div class="clear"></div>
                <code class="signature apipage">fov : [Null](#)&lt;[Float](#)&gt;</code><br/></span>
            <span class="small_desc_flat">the vertical field of view, in degrees. perspective only</span><span class="member apipage">
                <a name="far"><a class="lift" href="#far">far</a></a><div class="clear"></div>
                <code class="signature apipage">far : [Null](#)&lt;[Float](#)&gt;</code><br/></span>
            <span class="small_desc_flat">the far clipping plane, common to ortho + perspective</span><span class="member apipage">
                <a name="depth_test"><a class="lift" href="#depth_test">depth\_test</a></a><div class="clear"></div>
                <code class="signature apipage">depth\_test : [Null](#)&lt;[Bool](#)&gt;</code><br/></span>
            <span class="small_desc_flat">Whether or not depth testing should be enabled. defaults: ortho(false), perspective(true)</span><span class="member apipage">
                <a name="cull_backfaces"><a class="lift" href="#cull_backfaces">cull\_backfaces</a></a><div class="clear"></div>
                <code class="signature apipage">cull\_backfaces : [Null](#)&lt;[Bool](#)&gt;</code><br/></span>
            <span class="small_desc_flat">Whether or not to cull backfaces, defaults: ortho(false), perspective(true)</span><span class="member apipage">
                <a name="camera_name"><a class="lift" href="#camera_name">camera\_name</a></a><div class="clear"></div>
                <code class="signature apipage">camera\_name : [String](#)</code><br/></span>
            <span class="small_desc_flat">The camera view name. highly recommended you set this.</span><span class="member apipage">
                <a name="aspect"><a class="lift" href="#aspect">aspect</a></a><div class="clear"></div>
                <code class="signature apipage">aspect : [Null](#)&lt;[Float](#)&gt;</code><br/></span>
            <span class="small_desc_flat">The aspect ratio. usually `view width/view height`. perspective only</span>








---

&nbsp;
&nbsp;
&nbsp;
&nbsp;