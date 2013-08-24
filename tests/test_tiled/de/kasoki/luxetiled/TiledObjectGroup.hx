// Copyright (C) 2013 Christopher "Kasoki" Kaster
// 
// This file is part of "nme-tiled". <http://github.com/Kasoki/nme-tiled>
// 
// Permission is hereby granted, free of charge, to any person obtaining a
// copy of this software and associated documentation files (the "Software"),
// to deal in the Software without restriction, including without limitation
// the rights to use, copy, modify, merge, publish, distribute, sublicense,
// and/or sell copies of the Software, and to permit persons to whom the
// Software is furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included
// in all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
// OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
// THE SOFTWARE.
package de.kasoki.luxetiled;

class TiledObjectGroup {

	/** The name of this ObjectGroup */
	public var name:String;

	/** The color of this ObjectGroup */
	public var color:String;

	/** The width of this ObjectGroup */
	public var width:Int;

	/** The height of this ObjectGroup */
	public var height:Int;

	/** All properties this ObjectGroup contains */
	public var properties:Map<String,String>;

	/** All objects which are in this ObjectGroup */
	public var objects:Array<TiledObject>;

	private var objectCounter:Int;
	
	private function new(name:String, color:String, width:Int, height:Int, properties:Map<String,String>,
			objects:Array<TiledObject>) {

		this.name = name;
		this.color = color;
		this.width = width;
		this.height = height;
		this.properties = properties;
		this.objects = objects;

		this.objectCounter = 0;
	}
	
	/** Generates a new ObjectGroup from the given Xml code */
	public static function fromGenericXml(xml:Xml):TiledObjectGroup {
		var name = xml.get("name");
		var color = xml.get("color");
		var width = Std.parseInt(xml.get("width"));
		var height = Std.parseInt(xml.get("height"));
		var properties:Map<String,String> = new Map<String,String>();
		var objects:Array<TiledObject> = new Array<TiledObject>();
		
		for (child in xml) {
			if (Helper.isValidElement(child)) {
				if (child.nodeName == "properties") {
					for (property in child) {
						if (Helper.isValidElement(property)) {
							properties.set(property.get("name"), property.get("value"));
						}
					}
				}
				
				if (child.nodeName == "object") {
					objects.push(TiledObject.fromGenericXml(child));
				}
			}
		}
		
		return new TiledObjectGroup(name, color, width, height, properties, objects);
	}

	public function hasNext():Bool {
		if(objectCounter < objects.length) {
			return true;
		} else {
			objectCounter = 0;
			return false;
		}
	}

	public function next():TiledObject {
		return objects[objectCounter++];
	}
	
}
