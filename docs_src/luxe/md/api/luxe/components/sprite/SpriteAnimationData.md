
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
                <a name="sprite"><a class="lift" href="#sprite">sprite</a></a><div class="clear"></div><code class="signature apipage">sprite : [luxe.Sprite](#)</code><br/></span>
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
            <a name="get_frame_count"><a class="lift" href="#get_frame_count">get\_frame\_count</a></a> <div class="clear"></div><code class="signature apipage">get\_frame\_count() : [Int](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_serialize_data"><a class="lift" href="#get_serialize_data">get\_serialize\_data</a></a> <div class="clear"></div><code class="signature apipage">get\_serialize\_data() : [Dynamic](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="on_image_sequence_loaded"><a class="lift" href="#on_image_sequence_loaded">on\_image\_sequence\_loaded</a></a> <div class="clear"></div><code class="signature apipage">on\_image\_sequence\_loaded(\_textures:[Array](#)&lt;[phoenix.Texture](#)&gt;<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="from_json"><a class="lift" href="#from_json">from\_json</a></a> <div class="clear"></div><code class="signature apipage">from\_json(\_animdata:[Dynamic](#)<span></span>) : [luxe.components.sprite.SpriteAnimationData](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="parse_event_for_frame"><a class="lift" href="#parse_event_for_frame">parse\_event\_for\_frame</a></a> <div class="clear"></div><code class="signature apipage">parse\_event\_for\_frame(\_events:[Array](#)&lt;[luxe.components.sprite.SpriteAnimationFrameEvent](#)&gt;<span></span>, \_frame:[Int](#)<span></span>) : [Array](#)&lt;[luxe.components.sprite.SpriteAnimationFrameEvent](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="parse_source_size_for_frame"><a class="lift" href="#parse_source_size_for_frame">parse\_source\_size\_for\_frame</a></a> <div class="clear"></div><code class="signature apipage">parse\_source\_size\_for\_frame(\_sources:[Array](#)&lt;[luxe.components.sprite.SpriteAnimationFrameSource](#)&gt;<span></span>, \_frame:[Int](#)<span></span>) : [luxe.Vector](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="parse_source_pos_for_frame"><a class="lift" href="#parse_source_pos_for_frame">parse\_source\_pos\_for\_frame</a></a> <div class="clear"></div><code class="signature apipage">parse\_source\_pos\_for\_frame(\_sources:[Array](#)&lt;[luxe.components.sprite.SpriteAnimationFrameSource](#)&gt;<span></span>, \_frame:[Int](#)<span></span>) : [luxe.Vector](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="parse_source_for_frame"><a class="lift" href="#parse_source_for_frame">parse\_source\_for\_frame</a></a> <div class="clear"></div><code class="signature apipage">parse\_source\_for\_frame(\_sources:[Array](#)&lt;[luxe.components.sprite.SpriteAnimationFrameSource](#)&gt;<span></span>, \_frame:[Int](#)<span></span>) : [luxe.Rectangle](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="parse_frame_sources_set"><a class="lift" href="#parse_frame_sources_set">parse\_frame\_sources\_set</a></a> <div class="clear"></div><code class="signature apipage">parse\_frame\_sources\_set(\_sources:[Array](#)&lt;[](#)&gt;<span></span>) : [Array](#)&lt;[luxe.components.sprite.SpriteAnimationFrameSource](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="parse_event_set"><a class="lift" href="#parse_event_set">parse\_event\_set</a></a> <div class="clear"></div><code class="signature apipage">parse\_event\_set(\_events:[Array](#)&lt;[](#)&gt;<span></span>) : [Array](#)&lt;[luxe.components.sprite.SpriteAnimationFrameEvent](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="parse_frameset_range"><a class="lift" href="#parse_frameset_range">parse\_frameset\_range</a></a> <div class="clear"></div><code class="signature apipage">parse\_frameset\_range(\_frameset:[Array](#)&lt;[Int](#)&gt;<span></span>, regex:[EReg](#)<span></span>, \_frame:[String](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="parse_frameset_hold"><a class="lift" href="#parse_frameset_hold">parse\_frameset\_hold</a></a> <div class="clear"></div><code class="signature apipage">parse\_frameset\_hold(\_frameset:[Array](#)&lt;[Int](#)&gt;<span></span>, regex:[EReg](#)<span></span>, \_frame:[String](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="parse_frameset_prev_hold"><a class="lift" href="#parse_frameset_prev_hold">parse\_frameset\_prev\_hold</a></a> <div class="clear"></div><code class="signature apipage">parse\_frameset\_prev\_hold(\_frameset:[Array](#)&lt;[Int](#)&gt;<span></span>, regex:[EReg](#)<span></span>, \_frame:[String](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="parse_frameset_frame"><a class="lift" href="#parse_frameset_frame">parse\_frameset\_frame</a></a> <div class="clear"></div><code class="signature apipage">parse\_frameset\_frame(\_frameset:[Array](#)&lt;[Int](#)&gt;<span></span>, regex:[EReg](#)<span></span>, \_frame:[String](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="parse_frameset"><a class="lift" href="#parse_frameset">parse\_frameset</a></a> <div class="clear"></div><code class="signature apipage">parse\_frameset(\_json\_frameset:[Array](#)&lt;[String](#)&gt;<span></span>) : [Array](#)&lt;[Int](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a> <div class="clear"></div><code class="signature apipage">new(\_sprite:[luxe.Sprite](#)<span></span>, \_name:[String](#)<span>=&#x27;anim&#x27;</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;