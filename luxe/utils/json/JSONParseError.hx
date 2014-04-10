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

@:noCompletion class JSONParseError {

	/** The location in the string where the error occurred */
	private var _location:Int;	
	/** The string in which the parse error occurred */
	private var _text:String;	
	private var name:String;	
	public var text(get, null):String;
	public var location(get, null):Int;	
	private var message:String;
	
	/**
	 * Constructs a new JSONParseError.
	 *
	 * @param message The error message that occured during parsing
	 */
	public function new(message:String = "",location:Int = 0,text:String = "") {
		//super( message );
		name = "JSONParseError";
		_location = location;
		_text = text;
		this.message = message;
	}
	
	/**
	 * Provides read-only access to the location variable.
	 *
	 * @return The location in the string where the error occurred
	 */
	public function get_location():Int {
		return _location;
	}
	
	/**
	 * Provides read-only access to the text variable.
	 *
	 * @return The string in which the error occurred
	 */
	public function get_text():String {
		return _text;
	}
	
	public function toString():String {
		return name + ": " + message + " at position: " + _location + " near \"" + _text+"\"";
	}
}
