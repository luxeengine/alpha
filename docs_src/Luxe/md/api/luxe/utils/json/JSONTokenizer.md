
[![Logo](../../../../images/logo.png)](../../../../api/index.html)

---



<h1>JSONTokenizer</h1>
<small>`luxe.utils.json.JSONTokenizer`</small>



---

`class`
<span class="meta">
<br/>meta: @:noCompletion
</span>


---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="obj"><a class="lift" href="#obj">obj</a></a><div class="clear"></div><code class="signature apipage">obj : [Dynamic](#)</code><br/></span>
            <span class="small_desc_flat">The object that will get parsed from the JSON string</span><span class="member apipage">
                <a name="jsonString"><a class="lift" href="#jsonString">jsonString</a></a><div class="clear"></div><code class="signature apipage">jsonString : [String](#)</code><br/></span>
            <span class="small_desc_flat">The JSON string to be parsed</span><span class="member apipage">
                <a name="loc"><a class="lift" href="#loc">loc</a></a><div class="clear"></div><code class="signature apipage">loc : [Int](#)</code><br/></span>
            <span class="small_desc_flat">The current parsing location in the JSON string</span><span class="member apipage">
                <a name="ch"><a class="lift" href="#ch">ch</a></a><div class="clear"></div><code class="signature apipage">ch : [String](#)</code><br/></span>
            <span class="small_desc_flat">The current character in the JSON string during parsing</span><span class="member apipage">
                <a name="strict"><a class="lift" href="#strict">strict</a></a><div class="clear"></div><code class="signature apipage">strict : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="hexValToInt"><a class="lift" href="#hexValToInt">hexValToInt</a></a> <div class="clear"></div><code class="signature apipage">hexValToInt : [String](#)&nbsp;-&gt; [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="getNextToken"><a class="lift" href="#getNextToken">getNextToken</a></a> <div class="clear"></div><code class="signature apipage">getNextToken() : [luxe.utils.json.JSONToken](#)</code><br/><span class="small_desc_flat">* Gets the next token in the input sting and advances
    * the character to the next character after the token</span>
        </span>
    <span class="method apipage">
            <a name="readString"><a class="lift" href="#readString">readString</a></a> <div class="clear"></div><code class="signature apipage">readString() : [luxe.utils.json.JSONToken](#)</code><br/><span class="small_desc_flat">* Attempts to read a string from the input string.  Places
     * the character location at the first character after the
     * string.  It is assumed that ch is " before this method is called.
     *
     * @return the JSONToken with the string value if a string could
     *      be read.  Throws an error otherwise.</span>
        </span>
    <span class="method apipage">
            <a name="readNumber"><a class="lift" href="#readNumber">readNumber</a></a> <div class="clear"></div><code class="signature apipage">readNumber() : [luxe.utils.json.JSONToken](#)</code><br/><span class="small_desc_flat">* Attempts to read a number from the input string.  Places
     * the character location at the first character after the
     * number.
     *
     * @return The JSONToken with the number value if a number could
     *      be read.  Throws an error otherwise.</span>
        </span>
    <span class="method apipage">
            <a name="nextChar"><a class="lift" href="#nextChar">nextChar</a></a> <div class="clear"></div><code class="signature apipage">nextChar() : [String](#)</code><br/><span class="small_desc_flat">* Reads the next character in the input
     * string and advances the character location.
     *
     * @return The next character in the input string, or
     *      null if we've read past the end.</span>
        </span>
    <span class="method apipage">
            <a name="skipIgnored"><a class="lift" href="#skipIgnored">skipIgnored</a></a> <div class="clear"></div><code class="signature apipage">skipIgnored() : [Void](#)</code><br/><span class="small_desc_flat">* Advances the character location past any
     * sort of white space and comments</span>
        </span>
    <span class="method apipage">
            <a name="skipComments"><a class="lift" href="#skipComments">skipComments</a></a> <div class="clear"></div><code class="signature apipage">skipComments() : [Void](#)</code><br/><span class="small_desc_flat">* Skips comments in the input string, either
     * single-line or multi-line.  Advances the character
     * to the first position after the end of the comment.</span>
        </span>
    <span class="method apipage">
            <a name="skipWhite"><a class="lift" href="#skipWhite">skipWhite</a></a> <div class="clear"></div><code class="signature apipage">skipWhite() : [Void](#)</code><br/><span class="small_desc_flat">* Skip any whitespace in the input string and advances
     * the character to the first character after any possible
     * whitespace.</span>
        </span>
    <span class="method apipage">
            <a name="isWhiteSpace"><a class="lift" href="#isWhiteSpace">isWhiteSpace</a></a> <div class="clear"></div><code class="signature apipage">isWhiteSpace(ch:[String](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat">* Determines if a character is whitespace or not.
     *
     * @return True if the character passed in is a whitespace
     *  character</span>
        </span>
    <span class="method apipage">
            <a name="isDigit"><a class="lift" href="#isDigit">isDigit</a></a> <div class="clear"></div><code class="signature apipage">isDigit(ch:[String](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat">* Determines if a character is a digit [0-9].
     *
     * @return True if the character passed in is a digit</span>
        </span>
    <span class="method apipage">
            <a name="isHexDigit"><a class="lift" href="#isHexDigit">isHexDigit</a></a> <div class="clear"></div><code class="signature apipage">isHexDigit(ch:[String](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat">* Determines if a character is a digit [0-9].
     *
     * @return True if the character passed in is a digit</span>
        </span>
    <span class="method apipage">
            <a name="parseError"><a class="lift" href="#parseError">parseError</a></a> <div class="clear"></div><code class="signature apipage">parseError(message:[String](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">* Raises a parsing error with a specified message, tacking
     * on the error location and the original string.
     *
     * @param message The message indicating why the error occurred</span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a> <div class="clear"></div><code class="signature apipage">new(s:[String](#)<span></span>, strict:[Bool](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">* Constructs a new JSONDecoder to parse a JSON string
     * into a native object.
     *
     * @param s The JSON string to be converted
     *      into a native object</span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;