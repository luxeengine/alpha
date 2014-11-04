package luxe.utils.json;

/*

    Originated from hxJson2

  Copyright (c) 2008, Adobe Systems Incorporated
  Copyright (c) 2011, Philipp Klose
  All rights reserved.

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are
  met:

  * Redistributions of source code must retain the above copyright notice,
  this list of conditions and the following disclaimer.

  * Redistributions in binary form must reproduce the above copyright
  notice, this list of conditions and the following disclaimer in the
  documentation and/or other materials provided with the distribution.

  * Neither the name of Adobe Systems Incorporated nor the names of its
  contributors and authors may be used to endorse or promote products
  derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
  IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
  PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
  PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
  LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

@:noCompletion enum JSONTokenType {
    tUNKNOWN;
    tCOMMA;
    tLEFT_BRACE;
    tRIGHT_BRACE;
    tLEFT_BRACKET;
    tRIGHT_BRACKET;
    tCOLON;
    tTRUE;
    tFALSE;
    tNULL;
    tSTRING;
    tNUMBER;
    tNAN;
}

@:noCompletion class JSONDecoder {

    var strict:Bool;

    /** The value that will get parsed from the JSON string */
    var value:Dynamic;

    /** The tokenizer designated to read the JSON string */
    var tokenizer:JSONTokenizer;

    /** The current token from the tokenizer */
    var token:JSONToken;

    /**
      Constructs a new JSONDecoder to parse a JSON string   
      into a native object.   
        
      @param s The JSON string to be converted into a native object   
     */
    public function new(s:String, strict:Bool) {
        this.strict = strict;
        tokenizer = new JSONTokenizer(s,strict);
        nextToken();
        value = parseValue();
        if (strict && nextToken() != null)
            tokenizer.parseError("Unexpected characters left in input stream!");
    }

    /**
      Gets the internal object that was created by parsing   
      the JSON string passed to the constructor.   
        
      @return The internal object representation of the JSON   
           string that was passed to the constructor   
     */
    public function getValue():Dynamic {
        return value;
    }

    /**
      Returns the next token from the tokenzier reading   
      the JSON string   
     */
    function nextToken():JSONToken {
        return token = tokenizer.getNextToken();
    }

    /**
      Attempt to parse an array   
     */
    function parseArray():Array < Dynamic > {
        // create an array internally that we're going to attempt
        // to parse from the tokenizer
        var a:Array<Dynamic> = new Array<Dynamic>();
        // grab the next token from the tokenizer to move
        // past the opening [
        nextToken();
        // check to see if we have an empty array
        if ( token.type == tRIGHT_BRACKET ) {
            // we're done reading the array, so return it
            return a;
        }
        else {
            if (!strict && token.type == JSONTokenType.tCOMMA) {
                nextToken();
                // check to see if we're reached the end of the array
                if ( token.type == JSONTokenType.tRIGHT_BRACKET ){
                    return a;
                }
                else {
                    tokenizer.parseError( "Leading commas are not supported.  Expecting ']' but found " + token.value );
                }
            }
        }
        // deal with elements of the array, and use an "infinite"
        // loop because we could have any amount of elements
        while ( true ) {
            // read in the value and add it to the array
            a.push ( parseValue() );
            // after the value there should be a ] or a ,
            nextToken();
            if ( token.type == tRIGHT_BRACKET ) {
                // we're done reading the array, so return it
                return a;
            } else if ( token.type == tCOMMA ) {
                // move past the comma and read another value
                nextToken();
                // Allow arrays to have a comma after the last element
                // if the decoder is not in strict mode
                if ( !strict ){
                    // Reached ",]" as the end of the array, so return it
                    if ( token.type == JSONTokenType.tRIGHT_BRACKET ){
                        return a;
                    }
                }
            } else {
                tokenizer.parseError( "Expecting ] or , but found " + token.value );
            }
        }
        return null;
    }

    /**
      Attempt to parse an object   
     */
    function parseObject():Dynamic {
        // create the object internally that we're going to
        // attempt to parse from the tokenizer
        var o:Dynamic = { };
        // store the string part of an object member so
        // that we can assign it a value in the object
        var key:String;
        // grab the next token from the tokenizer
        nextToken();
        // check to see if we have an empty object
        if ( token.type == tRIGHT_BRACE ) {
            // we're done reading the object, so return it
            return o;
        }   // in non-strict mode an empty object is also a comma
            // followed by a right bracket
        else {
            if ( !strict && token.type == JSONTokenType.tCOMMA )    {
                // move past the comma
                nextToken();
                // check to see if we're reached the end of the object
                if ( token.type == JSONTokenType.tRIGHT_BRACE )             {
                    return o;
                }
                else {
                    tokenizer.parseError( "Leading commas are not supported.  Expecting '}' but found " + token.value );
                }
            }
        }
        // deal with members of the object, and use an "infinite"
        // loop because we could have any amount of members
        while ( true ) {
            if ( token.type == tSTRING ) {
                // the string value we read is the key for the object
                key = Std.string(token.value);
                // move past the string to see what's next
                nextToken();
                // after the string there should be a :
                if ( token.type == tCOLON ) {
                    // move past the : and read/assign a value for the key
                    nextToken();
                    Reflect.setField(o,key,parseValue());
                    // move past the value to see what's next
                    nextToken();
                    // after the value there's either a } or a ,
                    if ( token.type == tRIGHT_BRACE ) {
                        // // we're done reading the object, so return it
                        return o;
                    } else if ( token.type == tCOMMA ) {
                        // skip past the comma and read another member
                        nextToken();

                        // Allow objects to have a comma after the last member
                        // if the decoder is not in strict mode
                        if ( !strict ){
                            // Reached ",}" as the end of the object, so return it
                            if ( token.type == JSONTokenType.tRIGHT_BRACE ) {
                                return o;
                            }
                        }
                    } else {
                        tokenizer.parseError( "Expecting } or , but found " + token.value );
                    }
                } else {
                    tokenizer.parseError( "Expecting : but found " + token.value );
                }
            } else {
                tokenizer.parseError( "Expecting string but found " + token.value );
            }
        }
        return null;
    }

    /**
      Attempt to parse a value   
     */
    function parseValue():Dynamic   {
        // Catch errors when the input stream ends abruptly
        if ( token == null )
            tokenizer.parseError( "Unexpected end of input" );
        switch ( token.type ) {
            case tLEFT_BRACE:
                return parseObject();
            case tLEFT_BRACKET:
                return parseArray();
            case tSTRING:
                return token.value;
            case tNUMBER:
                return token.value;
            case tTRUE:
                return true;
            case tFALSE:
                return false;
            case tNULL:
                return null;
            case tNAN:
                if (!strict)
                    return token.value;
                else
                    tokenizer.parseError( "Unexpected " + token.value );
            default:
                tokenizer.parseError( "Unexpected " + token.value );
        }
        return null;
    }
}
