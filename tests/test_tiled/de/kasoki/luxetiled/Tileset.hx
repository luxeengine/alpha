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

import luxe.Vector;
import phoenix.Texture;
import luxe.Rectangle;

class Tileset {

	/** The first GID this tileset has */
	public var firstGID:Int;

	/** The name of this tileset */
	public var name:String;

	/** The width of the tileset image */
	public var width(get, null):Int;

	/** The height of the tileset image */
	public var height(get, null):Int;

	/** The width of one tile */
	public var tileWidth:Int;

	/** The height of one tile */
	public var tileHeight:Int;

	/** All properties this Tileset contains */
	public var properties:Map<String,String>;

	/** All tiles with special properties */
	public var propertyTiles:Map<Int,PropertyTile>;

	/** The image of this tileset */
	public var image:TilesetImage;
	
	private function new(name:String, tileWidth:Int, tileHeight:Int, properties:Map<String,String>, image:TilesetImage) {
		this.name = name;
		this.tileWidth = tileWidth;
		this.tileHeight = tileHeight;
		this.properties = properties;
		this.image = image;
	}
	
	/** Sets the first GID. */
	public function setFirstGID(gid:Int) {
		this.firstGID = gid;
	}
	
	/** Generates a new Tileset from the given Xml code */
	public static function fromGenericXml(content:String):Tileset {
		var xml = Xml.parse(content).firstElement();
		
		var name:String = xml.get("name");
		var tileWidth:Int = Std.parseInt(xml.get("tilewidth"));
		var tileHeight:Int = Std.parseInt(xml.get("tileheight"));
		var properties:Map<String,String> = new Map<String,String>();
		var propertyTiles:Map<Int,PropertyTile> = new Map<Int,PropertyTile>();
		var image:TilesetImage = null;
		
		for (child in xml.elements()) {
			if(Helper.isValidElement(child)) {
				if (child.nodeName == "properties") {
					for (property in child) {
						if (Helper.isValidElement(property)) {
							properties.set(property.get("name"), property.get("value"));
						}
					}
				}
				
				if (child.nodeName == "image") {
					var width = Std.parseInt(child.get("width"));
					var height = Std.parseInt(child.get("height"));
					
					image = new TilesetImage(child.get("source"), width, height);
				}
				
				if (child.nodeName == "tile") {
					var id:Int = Std.parseInt(child.get("id"));
					var properties:Map<String,String> = new Map<String,String>();
					
					for (element in child) {
						if(Helper.isValidElement(element)) {
							if (element.nodeName == "properties") {
								for (property in element) {
									if (!Helper.isValidElement(property)) {
										continue;
									}
									
									properties.set(property.get("name"), property.get("value"));
								}
							}
						}
					}
					
					propertyTiles.set(id, new PropertyTile(id, properties));
				}
			}
		}
		
		return new Tileset(name, tileWidth, tileHeight, properties, image);
	}
	
	/** Returns the BitmapData of the given GID */
	public function getTileTextureByGID(gid:Int) : Texture {

		// var bitmapData = new BitmapData(this.tileWidth, this.tileHeight, true, 0x000000);

		var texture:Texture = Helper.getTexture( 'assets/'+this.image.source );

		// var rect:Rectangle = new Rectangle(getTexturePositionByGID(gid).x * this.tileWidth,
			// getTexturePositionByGID(gid).y * this.tileHeight, this.tileWidth, this.tileHeight);
		// var point:Point = new Point(0, 0);

		// bitmapData.copyPixels(texture, rect, point, null, null, true);

		return texture;
	}

	/** Returns a Point which specifies the position of the gid in this tileset (Not in pixels!) */
	public function getTexturePositionByGID(gid:Int):Vector {
		var number = gid - this.firstGID;

		return new Vector(getInnerTexturePositionX(number), getInnerTexturePositionY(number));
	}

	/** Returns the inner x-position of a texture with given tileNumber */
	private function getInnerTexturePositionX(tileNumber):Int {
		return (tileNumber % Std.int(this.width / this.tileWidth));
	}
	
	/** Returns the inner y-position of a texture with given tileNumber */
	private function getInnerTexturePositionY(tileNumber):Int {
		return Std.int(tileNumber / Std.int(this.width / this.tileWidth));
	}
	
	private function get_width():Int {
		return this.image.width;
	}
	
	private function get_height():Int {
		return this.image.height;
	}
}
