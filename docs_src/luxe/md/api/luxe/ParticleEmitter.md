
[![Logo](../../images/logo.png)](../../api/index.html)

---



<h1>ParticleEmitter</h1>
<small>`luxe.ParticleEmitter`</small>



---

`class`extends <code><span>luxe.Component</span></code>
<span class="meta">
<br/>meta: @:build(&#x27;???&#x27;), @:autoBuild(&#x27;???&#x27;)
</span>


---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="particle_system"><a class="lift" href="#particle_system">particle\_system</a></a><code class="signature apipage">particle\_system : [luxe.ParticleSystem](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="enabled"><a class="lift" href="#enabled">enabled</a></a><code class="signature apipage">enabled : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="emit_count"><a class="lift" href="#emit_count">emit\_count</a></a><code class="signature apipage">emit\_count : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="active_particles"><a class="lift" href="#active_particles">active\_particles</a></a><code class="signature apipage">active\_particles : [Array](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="elapsed_time"><a class="lift" href="#elapsed_time">elapsed\_time</a></a><code class="signature apipage">elapsed\_time : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="duration"><a class="lift" href="#duration">duration</a></a><code class="signature apipage">duration : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="emission_rate"><a class="lift" href="#emission_rate">emission\_rate</a></a><code class="signature apipage">emission\_rate : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="emit_next"><a class="lift" href="#emit_next">emit\_next</a></a><code class="signature apipage">emit\_next : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="emit_last"><a class="lift" href="#emit_last">emit\_last</a></a><code class="signature apipage">emit\_last : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="particle_index"><a class="lift" href="#particle_index">particle\_index</a></a><code class="signature apipage">particle\_index : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="particle_cache"><a class="lift" href="#particle_cache">particle\_cache</a></a><code class="signature apipage">particle\_cache : [Array](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="cache_size"><a class="lift" href="#cache_size">cache\_size</a></a><code class="signature apipage">cache\_size : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="cache_index"><a class="lift" href="#cache_index">cache\_index</a></a><code class="signature apipage">cache\_index : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="depth"><a class="lift" href="#depth">depth</a></a><code class="signature apipage">depth : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="group"><a class="lift" href="#group">group</a></a><code class="signature apipage">group : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="particle_image"><a class="lift" href="#particle_image">particle\_image</a></a><code class="signature apipage">particle\_image : [phoenix.Texture](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="pos_value"><a class="lift" href="#pos_value">pos\_value</a></a><code class="signature apipage">pos\_value : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="pos_offset"><a class="lift" href="#pos_offset">pos\_offset</a></a><code class="signature apipage">pos\_offset : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="pos_random"><a class="lift" href="#pos_random">pos\_random</a></a><code class="signature apipage">pos\_random : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="emit_time"><a class="lift" href="#emit_time">emit\_time</a></a><code class="signature apipage">emit\_time : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="direction"><a class="lift" href="#direction">direction</a></a><code class="signature apipage">direction : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="direction_random"><a class="lift" href="#direction_random">direction\_random</a></a><code class="signature apipage">direction\_random : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="gravity"><a class="lift" href="#gravity">gravity</a></a><code class="signature apipage">gravity : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="zrotation"><a class="lift" href="#zrotation">zrotation</a></a><code class="signature apipage">zrotation : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="_position"><a class="lift" href="#_position">\_position</a></a><code class="signature apipage">\_position : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="radius"><a class="lift" href="#radius">radius</a></a><code class="signature apipage">radius : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="radius_random"><a class="lift" href="#radius_random">radius\_random</a></a><code class="signature apipage">radius\_random : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="start_size"><a class="lift" href="#start_size">start\_size</a></a><code class="signature apipage">start\_size : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="start_size_random"><a class="lift" href="#start_size_random">start\_size\_random</a></a><code class="signature apipage">start\_size\_random : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="end_size"><a class="lift" href="#end_size">end\_size</a></a><code class="signature apipage">end\_size : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="end_size_random"><a class="lift" href="#end_size_random">end\_size\_random</a></a><code class="signature apipage">end\_size\_random : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="speed"><a class="lift" href="#speed">speed</a></a><code class="signature apipage">speed : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="end_speed"><a class="lift" href="#end_speed">end\_speed</a></a><code class="signature apipage">end\_speed : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="speed_random"><a class="lift" href="#speed_random">speed\_random</a></a><code class="signature apipage">speed\_random : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="life"><a class="lift" href="#life">life</a></a><code class="signature apipage">life : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="life_random"><a class="lift" href="#life_random">life\_random</a></a><code class="signature apipage">life\_random : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="rotation_value"><a class="lift" href="#rotation_value">rotation\_value</a></a><code class="signature apipage">rotation\_value : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="rotation_random"><a class="lift" href="#rotation_random">rotation\_random</a></a><code class="signature apipage">rotation\_random : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="end_rotation"><a class="lift" href="#end_rotation">end\_rotation</a></a><code class="signature apipage">end\_rotation : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="end_rotation_random"><a class="lift" href="#end_rotation_random">end\_rotation\_random</a></a><code class="signature apipage">end\_rotation\_random : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="rotation_offset"><a class="lift" href="#rotation_offset">rotation\_offset</a></a><code class="signature apipage">rotation\_offset : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="start_color"><a class="lift" href="#start_color">start\_color</a></a><code class="signature apipage">start\_color : [luxe.Color](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="start_color_random"><a class="lift" href="#start_color_random">start\_color\_random</a></a><code class="signature apipage">start\_color\_random : [luxe.Color](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="end_color"><a class="lift" href="#end_color">end\_color</a></a><code class="signature apipage">end\_color : [luxe.Color](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="end_color_random"><a class="lift" href="#end_color_random">end\_color\_random</a></a><code class="signature apipage">end\_color\_random : [luxe.Color](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="template"><a class="lift" href="#template">template</a></a><code class="signature apipage">template : [luxe.options.ParticleEmitterOptions](#)</code><br/></span>
            <span class="small_desc_flat"></span>





<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="init"><a class="lift" href="#init">init</a></a><code class="signature apipage">init(\_data:luxe.ParticleEmitterInitData<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="apply"><a class="lift" href="#apply">apply</a></a><code class="signature apipage">apply(\_template:luxe.options.ParticleEmitterOptions<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a><code class="signature apipage">destroy() : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="emit"><a class="lift" href="#emit">emit</a></a><code class="signature apipage">emit(t:Float<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="stop"><a class="lift" href="#stop">stop</a></a><code class="signature apipage">stop() : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="update"><a class="lift" href="#update">update</a></a><code class="signature apipage">update(dt:Float<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><code class="signature apipage">new() : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;