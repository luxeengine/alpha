
[![Logo](../../../../images/logo.png)](../../../../api/index.html)

---



<h1>JSONEncoder</h1>
<small>`luxe.utils.json.JSONEncoder`</small>



---

`class`
<span class="meta">
<br/>meta: @:noCompletion
</span>


---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="jsonString"><a class="lift" href="#jsonString">jsonString</a></a><div class="clear"></div><code class="signature apipage">jsonString : [String](#)</code><br/></span>
            <span class="small_desc_flat">The string that is going to represent the object we're encoding</span><span class="member apipage">
                <a name="debug"><a class="lift" href="#debug">debug</a></a><div class="clear"></div><code class="signature apipage">debug : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span>





<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="getString"><a class="lift" href="#getString">getString</a></a> <div class="clear"></div><code class="signature apipage">getString() : [String](#)</code><br/><span class="small_desc_flat">* Gets the JSON string from the encoder.
     *
     * @return The JSON string representation of the object
     *      that was passed to the constructor</span>
        </span>
    <span class="method apipage">
            <a name="_trace"><a class="lift" href="#_trace">\_trace</a></a> <div class="clear"></div><code class="signature apipage">\_trace(e:[String](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="convertToString"><a class="lift" href="#convertToString">convertToString</a></a> <div class="clear"></div><code class="signature apipage">convertToString(value:[Dynamic](#)<span></span>) : [String](#)</code><br/><span class="small_desc_flat">* Converts a value to it's JSON string equivalent.
     *
     * @param value The value to convert.  Could be any
     *      type (object, number, array, etc)</span>
        </span>
    <span class="method apipage">
            <a name="mapHash"><a class="lift" href="#mapHash">mapHash</a></a> <div class="clear"></div><code class="signature apipage">mapHash(value:[Map](#)&lt;[String](#), [](#)&gt;<span></span>) : [Dynamic](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="escapeString"><a class="lift" href="#escapeString">escapeString</a></a> <div class="clear"></div><code class="signature apipage">escapeString(str:[String](#)<span></span>) : [String](#)</code><br/><span class="small_desc_flat">* Escapes a string accoding to the JSON specification.
     *
     * @param str The string to be escaped
     * @return The string with escaped special characters
     *      according to the JSON specification</span>
        </span>
    <span class="method apipage">
            <a name="arrayToString"><a class="lift" href="#arrayToString">arrayToString</a></a> <div class="clear"></div><code class="signature apipage">arrayToString(a:[Array](#)&lt;[](#)&gt;<span></span>) : [String](#)</code><br/><span class="small_desc_flat">* Converts an array to it's JSON string equivalent
     *
     * @param a The array to convert
     * @return The JSON string representation of <code>a</code></span>
        </span>
    <span class="method apipage">
            <a name="objectToString"><a class="lift" href="#objectToString">objectToString</a></a> <div class="clear"></div><code class="signature apipage">objectToString(o:[Dynamic](#)<span></span>) : [String](#)</code><br/><span class="small_desc_flat">* Converts an object to it's JSON string equivalent
     *
     * @param o The object to convert
     * @return The JSON string representation of <code>o</code></span>
        </span>
    <span class="method apipage">
            <a name="instanceToString"><a class="lift" href="#instanceToString">instanceToString</a></a> <div class="clear"></div><code class="signature apipage">instanceToString(o:[Dynamic](#)<span></span>, cls:[Class](#)&lt;[](#)&gt;<span></span>) : [String](#)</code><br/><span class="small_desc_flat">* Converts an instance object to it's JSON string equivalent
   *
   * @param o The instance object to convert
   * @param cls The class of instance object
   * @return The JSON string representation of <code>o</code></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a> <div class="clear"></div><code class="signature apipage">new(value:[Dynamic](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">* Creates a new JSONEncoder.
     *
     * @param o The object to encode as a JSON string</span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;