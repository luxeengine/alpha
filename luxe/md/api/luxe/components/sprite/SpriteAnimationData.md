
[![Logo](../../../../images/logo.png)](../../../../api/index.html)

---



<h1>SpriteAnimationData</h1>
<small>`luxe.components.sprite.SpriteAnimationData`</small>



---

`class`

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="name"><a class="lift" href="#name">name</a></a><div class="clear"></div><code class="signature apipage">name : [String](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="type"><a class="lift" href="#type">type</a></a><div class="clear"></div><code class="signature apipage">type : [luxe.components.sprite.SpriteAnimationType](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="filter_type"><a class="lift" href="#filter_type">filter\_type</a></a><div class="clear"></div><code class="signature apipage">filter\_type : [phoenix.FilterType](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="frameset"><a class="lift" href="#frameset">frameset</a></a><div class="clear"></div><code class="signature apipage">frameset : [Array](#)&lt;[luxe.components.sprite.SpriteAnimationFrame](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="image_set_list"><a class="lift" href="#image_set_list">image\_set\_list</a></a><div class="clear"></div><code class="signature apipage">image\_set\_list : [Array](#)&lt;[String](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="image_set"><a class="lift" href="#image_set">image\_set</a></a><div class="clear"></div><code class="signature apipage">image\_set : [Array](#)&lt;[phoenix.Texture](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="frame_size"><a class="lift" href="#frame_size">frame\_size</a></a><div class="clear"></div><code class="signature apipage">frame\_size : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="frame_sources"><a class="lift" href="#frame_sources">frame\_sources</a></a><div class="clear"></div><code class="signature apipage">frame\_sources : [Array](#)&lt;[luxe.components.sprite.SpriteAnimationFrameSource](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="frame_time"><a class="lift" href="#frame_time">frame\_time</a></a><div class="clear"></div><code class="signature apipage">frame\_time : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="loop"><a class="lift" href="#loop">loop</a></a><div class="clear"></div><code class="signature apipage">loop : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="pingpong"><a class="lift" href="#pingpong">pingpong</a></a><div class="clear"></div><code class="signature apipage">pingpong : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="reverse"><a class="lift" href="#reverse">reverse</a></a><div class="clear"></div><code class="signature apipage">reverse : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="frame_range_regex"><a class="lift" href="#frame_range_regex">frame\_range\_regex</a></a><span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">frame\_range\_regex : [EReg](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="frame_hold_regex"><a class="lift" href="#frame_hold_regex">frame\_hold\_regex</a></a><span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">frame\_hold\_regex : [EReg](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="frame_hold_prev_regex"><a class="lift" href="#frame_hold_prev_regex">frame\_hold\_prev\_regex</a></a><span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">frame\_hold\_prev\_regex : [EReg](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="frame_regex"><a class="lift" href="#frame_regex">frame\_regex</a></a><span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">frame\_regex : [EReg](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="frame_count"><a class="lift" href="#frame_count">frame\_count</a></a> <div class="clear"></div><code class="signature apipage">frame\_count : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="get_serialize_data"><a class="lift" href="#get_serialize_data">get\_serialize\_data</a></a> <div class="clear"></div><code class="signature apipage">get\_serialize\_data() : [Dynamic](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="from_json"><a class="lift" href="#from_json">from\_json</a></a> <div class="clear"></div><code class="signature apipage">from\_json(\_animdata:[Dynamic](#)<span></span>) : [luxe.components.sprite.SpriteAnimationData](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a> <div class="clear"></div><code class="signature apipage">new(\_sprite:[luxe.Sprite](#)<span></span>, \_name:[String](#)<span>=&#x27;anim&#x27;</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;