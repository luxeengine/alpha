/*
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

package luxe.utils;

#if neko
import neko.Utf8;
#elseif php
import php.Utf8;
#end

	//import flash.utils.describeType;

class JSONEncoder {

	/** The string that is going to represent the object we're encoding */
	private var jsonString:String;
	
	/**
	 * Creates a new JSONEncoder.
	 *
	 * @param o The object to encode as a JSON string
	 */
	public function new(value:Dynamic) {
		jsonString = convertToString(value);
	}
	
	/**
	 * Gets the JSON string from the encoder.
	 *
	 * @return The JSON string representation of the object
	 * 		that was passed to the constructor
	 */
	public function getString():String {
		return jsonString;
	}

	public var debug : Bool = false;
	public function _trace(e) { if(debug) trace(e); }
	
	/**
	 * Converts a value to it's JSON string equivalent.
	 *
	 * @param value The value to convert.  Could be any 
	 *		type (object, number, array, etc)
	 */
	private function convertToString(value:Dynamic):String {

		if (Std.is(value, List) || Std.is(value,Map)) {
			value = Lambda.array(value);
			_trace("convertToString: was List or Map");
		}

		if (Std.is(value, Map)) {
			value = mapHash(value);		
			_trace("convertToString: was Hash");
		}

		// determine what value is and convert it based on it's type
		if ( Std.is(value,String )) {	
			_trace("convertToString: value was String");		
			// escape the string so it's formatted correctly			
			return escapeString(cast(value, String));
			//return escapeString( value as String );			
		} else if ( Std.is(value,Float) ) {			
			_trace("convertToString: value was Float");		
			// only encode numbers that finate
			return Math.isFinite(cast(value,Float)) ? value+"" : "null";
		} else if ( Std.is(value,Bool) ) {		
			_trace("convertToString: value was Bool");			
			// convert boolean to string easily
			return value ? "true" : "false";
		} else if ( Std.is(value,Array)) {		
			// call the helper method to convert an array
			_trace("convertToString: value was Array");		
			return arrayToString(cast(value,Array<Dynamic>));
		} else if (Std.is(value,Dynamic) && value != null ) {
			// call the helper method to convert an object
			_trace("convertToString: value was Dynamic");		
			var cls = Type.getClass (value);
			if (null == cls) {
				return objectToString( value );
			} else {
				return instanceToString( value, cls );
			}
		} else if (Type.getEnum(value) != null) {
			_trace("convertToString: value was (Type.getEnum(value) != null)");		
			return Std.string(Type.enumIndex(value));
		}

			_trace("convertToString: returning null");		
		return "null";
	}
	
	private function mapHash(value:Map<String,Dynamic>):Dynamic{
		var ret:Dynamic = { };
		for (i in value.keys())
			Reflect.setField(ret, i, value.get(i));
		return ret;
	}
	
	/**
	 * Escapes a string accoding to the JSON specification.
	 *
	 * @param str The string to be escaped
	 * @return The string with escaped special characters
	 * 		according to the JSON specification
	 */
	private function escapeString( str:String ):String {
		// create a string to store the string's jsonstring value
		var s:String = "";
		// current character in the string we're processing
		var ch:String;
		// store the length in a local variable to reduce lookups
		var len:Int = str.length;
		#if neko
		var utf8mode = (Utf8.length(str)!=str.length);
		if (utf8mode)
			len = Utf8.length(str);
		#elseif php
		var utf8mode = (Utf8.length(str)!=str.length);
		if (utf8mode)
			len = Utf8.length(str);
		#end
		// loop over all of the characters in the string
		for (i in 0...len) {		
			// examine the character to determine if we have to escape it
			ch = str.charAt( i );
			#if neko
			if (utf8mode) {
				ch = Utf8.sub(str,i,1);
			}
			#elseif php
			if (utf8mode) {
				ch = Utf8.sub(str,i,1);
			}
			#end
			switch ( ch ) {			
				// case '/':	// solidus
					// s += "\\/";
				case '"':	// quotation mark
					s += "\\\"";					
				case '\\':	// reverse solidus
					s += "\\\\";
				case '\n':	// newline
					s += "\\n";
				case '\r':	// carriage return
					s += "\\r";
				case '\t':	// horizontal tab
					s += "\\t";						
				default:	// everything else					
					// check for a control character and escape as unicode
					var code = ch.charCodeAt(0);
					#if neko
					if (utf8mode)
						code = Utf8.charCodeAt(str,i);
					#elseif php
					if (utf8mode)
						code = Utf8.charCodeAt(str,i);
					#end
					if ( ch < ' ' || code > 127) {
						// get the hex digit(s) of the character (either 1 or 2 digits)
						#if neko
						var hexCode:String = StringTools.hex(Utf8.charCodeAt(str,i));
						#elseif php
						var hexCode:String = StringTools.hex(Utf8.charCodeAt(str,i));
						#else
						var hexCode:String = StringTools.hex(ch.charCodeAt( 0 ));
						#end
						// ensure that there are 4 digits by adjusting
						// the # of zeros accordingly.
						var zeroPad:String = "";
						for (j in 0...4 - hexCode.length) {
							zeroPad += "0" ;
						}
						//var zeroPad:String = hexCode.length == 2 ? "00" : "000";						
						// create the unicode escape sequence with 4 hex digits
						s += "\\u" + zeroPad + hexCode;
					} else {					
						// no need to do any special encoding, just pass-through
						s += ch;						
					}
			}	// end switch			
		}	// end for loop					
		return "\"" + s + "\"";
	}
	
	/**
	 * Converts an array to it's JSON string equivalent
	 *
	 * @param a The array to convert
	 * @return The JSON string representation of <code>a</code>
	 */
	private function arrayToString( a:Array < Dynamic > ):String {
		//trace("arrayToString");
		// create a string to store the array's jsonstring value
		var s:String = "";		
		// loop over the elements in the array and add their converted
		// values to the string
		for (i in 0...a.length) {
			// when the length is 0 we're adding the first element so
			// no comma is necessary
			if ( s.length > 0 ) {
				// we've already added an element, so add the comma separator
				s += ",";
			}			
			// convert the value to a string
			s += convertToString( a[i] );	
		}
		
		// KNOWN ISSUE:  In ActionScript, Arrays can also be associative
		// objects and you can put anything in them, ie:
		//		myArray["foo"] = "bar";
		//
		// These properties aren't picked up in the for loop above because
		// the properties don't correspond to indexes.  However, we're
		// sort of out luck because the JSON specification doesn't allow
		// these types of array properties.
		//
		// So, if the array was also used as an associative object, there
		// may be some values in the array that don't get properly encoded.
		//
		// A possible solution is to instead encode the Array as an Object
		// but then it won't get decoded correctly (and won't be an
		// Array instance)
					
		// close the array and return it's string value
		return "[" + s + "]";
	}
	
	/**
	 * Converts an object to it's JSON string equivalent
	 *
	 * @param o The object to convert
	 * @return The JSON string representation of <code>o</code>
	 */
	private function objectToString(o:Dynamic):String {
		//trace("objectToString");
		//trace(o);
		// create a string to store the object's jsonstring value
		var s:String = "";		
		var value:Dynamic;		
		// loop over the keys in the object and add their converted
		// values to the string
		for ( key in Reflect.fields(o) ) {
			// assign value to a variable for quick lookup
			value = Reflect.field(o,key);			
			// don't add function's to the JSON string
			if (!Reflect.isFunction(value))	{
				// when the length is 0 we're adding the first item so
				// no comma is necessary
				if ( s.length > 0 ) {
					// we've already added an item, so add the comma separator
					s += ",";
				}
				s += escapeString( key ) + ":" + convertToString( value );
			}			
		}		
		return "{" + s + "}";
	}	

  /**
   * Converts an instance object to it's JSON string equivalent
   *
   * @param o The instance object to convert
   * @param cls The class of instance object
   * @return The JSON string representation of <code>o</code>
   */
  private function instanceToString (o : Dynamic, cls : Class <Dynamic>) : String {
    var s : String = "";
    var value : Dynamic;

    for (key in Type.getInstanceFields (cls)) {
      value = Reflect.field (o, key);
      if (!Reflect.isFunction (value)) {
        if (s.length > 0) {
          s += ",";
        }
        s += escapeString (key) + ":" + convertToString (value);
      }
    }
    return "{" + s + "}";
  }
}
