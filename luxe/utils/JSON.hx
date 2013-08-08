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

class JSON {

	/**
	 * Encodes a object into a JSON string.
	 *
	 * @param o The object to create a JSON string for
	 * @return the JSON string representing o
	 */
	public inline static function encode(o:Dynamic):String {		
		return new JSONEncoder(o).getString();
	}
	
	/**
	 * Decodes a JSON string into a native object.
	 * 
	 * @param s The JSON string representing the object
	 * @return A native object as specified by s
	 */
	public inline static function decode(s:String,strict:Bool=true):Dynamic {		
		return new JSONDecoder(s,strict).getValue();
	}
	
	/**
	 * Encodes a object into a JSON string.
	 *
	 * @param o The object to create a JSON string for
	 * @return the JSON string representing o
	 */
	public inline static function stringify(o:Dynamic):String {			
		return new JSONEncoder(o).getString();
	}
	
	/**
	 * Decodes a JSON string into a native object.
	 * 
	 * @param s The JSON string representing the object
	 * @return A native object as specified by s
	 */
	public inline static function parse(s:String,strict:Bool=false):Dynamic {		
		return new JSONDecoder(s,strict).getValue();
	}
	
	

}
