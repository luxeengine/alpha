
[![Logo](../../../../images/logo.png)](../../../../api/index.html)

---



<h1>JSONDecoder</h1>
<small>`luxe.utils.json.JSONDecoder`</small>



---

`class`
<span class="meta">
<br/>meta: @:noCompletion
</span>


---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="strict"><a class="lift" href="#strict">strict</a></a><div class="clear"></div><code class="signature apipage">strict : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="value"><a class="lift" href="#value">value</a></a><div class="clear"></div><code class="signature apipage">value : [Dynamic](#)</code><br/></span>
            <span class="small_desc_flat">The value that will get parsed from the JSON string</span><span class="member apipage">
                <a name="tokenizer"><a class="lift" href="#tokenizer">tokenizer</a></a><div class="clear"></div><code class="signature apipage">tokenizer : [luxe.utils.json.JSONTokenizer](#)</code><br/></span>
            <span class="small_desc_flat">The tokenizer designated to read the JSON string</span><span class="member apipage">
                <a name="token"><a class="lift" href="#token">token</a></a><div class="clear"></div><code class="signature apipage">token : [luxe.utils.json.JSONToken](#)</code><br/></span>
            <span class="small_desc_flat">The current token from the tokenizer</span>





<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="getValue"><a class="lift" href="#getValue">getValue</a></a> <div class="clear"></div><code class="signature apipage">getValue() : [Dynamic](#)</code><br/><span class="small_desc_flat">* Gets the internal object that was created by parsing
     * the JSON string passed to the constructor.
     *
     * @return The internal object representation of the JSON
     *      string that was passed to the constructor</span>
        </span>
    <span class="method apipage">
            <a name="nextToken"><a class="lift" href="#nextToken">nextToken</a></a> <div class="clear"></div><code class="signature apipage">nextToken() : [luxe.utils.json.JSONToken](#)</code><br/><span class="small_desc_flat">* Returns the next token from the tokenzier reading
     * the JSON string</span>
        </span>
    <span class="method apipage">
            <a name="parseArray"><a class="lift" href="#parseArray">parseArray</a></a> <div class="clear"></div><code class="signature apipage">parseArray() : [Array](#)&lt;[](#)&gt;</code><br/><span class="small_desc_flat">* Attempt to parse an array</span>
        </span>
    <span class="method apipage">
            <a name="parseObject"><a class="lift" href="#parseObject">parseObject</a></a> <div class="clear"></div><code class="signature apipage">parseObject() : [Dynamic](#)</code><br/><span class="small_desc_flat">* Attempt to parse an object</span>
        </span>
    <span class="method apipage">
            <a name="parseValue"><a class="lift" href="#parseValue">parseValue</a></a> <div class="clear"></div><code class="signature apipage">parseValue() : [Dynamic](#)</code><br/><span class="small_desc_flat">* Attempt to parse a value</span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a> <div class="clear"></div><code class="signature apipage">new(s:[String](#)<span></span>, strict:[Bool](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">* Constructs a new JSONDecoder to parse a JSON string
     * into a native object.
     *
     * @param s The JSON string to be converted into a native object</span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;