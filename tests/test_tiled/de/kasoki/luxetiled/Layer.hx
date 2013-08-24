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

import luxe.Rectangle;

class Layer {

	/** The name of this layer */
	public var name:String;

	/** The width of this layer in tiles */
	public var width:Int;

	/** The height of this layer in tiles */
	public var height:Int;
	
	/** All tiles which this Layer contains */
	public var tiles:Array<Tile>;

	/** The parent TiledMap */
	public var parent(default, null):TiledMap;
	
	private function new(parent:TiledMap, name:String, width:Int, height:Int, tiles:Array<Int>) {
		this.parent = parent;
		this.name = name;
		this.width = width;
		this.height = height;
		
		this.tiles = new Array<Tile>();

		for(gid in tiles) {
			this.tiles.push(Tile.fromGID(gid, this));
		}
	}
	
	/**
	 * This method generates a new Layer from the given Xml code
	 * @param xml The given xml code
	 * @param 
	 * @return A new layer
	 */
	public static function fromGenericXml(xml:Xml, parent:TiledMap):Layer {
		var name:String = xml.get("name");
		var width:Int = Std.parseInt(xml.get("width"));
		var height:Int = Std.parseInt(xml.get("height"));
		var tileGIDs:Array<Int> = new Array<Int>();
		
		for (child in xml) {
			if(Helper.isValidElement(child)) {
				if (child.nodeName == "data") {
					for (tile in child) {
						if (Helper.isValidElement(tile)) {
							var gid = Std.parseInt(tile.get("gid"));
							
							tileGIDs.push(gid);
						}
					}
				}
			}
		}
		
		return new Layer(parent, name, width, height, tileGIDs);
	}

	/**
	 * This method generates a version of this layer in CSV
	 * @param ?width [OPTIONAL] The number of tiles in width. Default: The layer width.
	 * @return A string which contains CSV
	 */
	public function toCSV(?width:Int):String {
		if(width <= 0 || width == null) {
			width = this.width;
		}

		var counter:Int = 0;
		var csv:String = "";

		for(tile in this.tiles) {
			var tileGID = tile.gid;

			if(counter >= width) {
				// remove the last ","
				csv = csv.substr(0, csv.length - 1);

				// add a new line and reset counter
				csv += '\n';
				counter = 0;
			}

			csv += tileGID;
			csv += ',';

			counter++;
		}

		// remove the last ","
		csv = csv.substr(0, csv.length - 1);

		return csv;
	}
}
