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
import luxe.Vector;
import phoenix.Texture;

/**
 * This class represents a TILED map
 * @author Christopher Kaster
 */
class TiledMap {

	/** The map width in tiles */
	public var width:Int;

	/** The map height in tiles */
	public var height:Int;

	/** The map width in pixels */
	public var totalWidth(get, null):Int;

	/** The map height in pixels */
	public var totalHeight(get, null):Int;

	/** TILED orientation: Orthogonal or Isometric */
	public var orientation:TiledMapOrientation;

	/** The tile width */
	public var tileWidth:Int;

	/** The tile height */
	public var tileHeight:Int;

	/** All tilesets the map is using */
	public var tilesets:Array<Tileset>;

	/** Contains all layers from this map */
	public var layers:Array<Layer>;

	/** All objectgroups */
	public var objectGroups:Array<TiledObjectGroup>;
	
	private function new(xml:String) {
		parseXML(xml);
	}

	/** 
	 * Creates a new TiledMap from an Assets
	 * @param path The path to your asset
	 * @return A TiledMap object
	 */
	public static function fromAssets(path:String):TiledMap {
		return new TiledMap(Helper.getText(path));
	}

	/**
	 * Creates a new TiledMap from a Xml String
	 * @param xml
	 * @return A TiledMap object
	 */
	public static function fromGenericXml(xml:String):TiledMap {
		return new TiledMap(xml);
	}
	
	private function parseXML(xml:String) {
		var xml = Xml.parse(xml).firstElement();
		
		this.width = Std.parseInt(xml.get("width"));
		this.height = Std.parseInt(xml.get("height"));
		this.orientation = xml.get("orientation") == "orthogonal" ?
			TiledMapOrientation.Orthogonal : TiledMapOrientation.Isometric;
		this.tileWidth = Std.parseInt(xml.get("tilewidth"));
		this.tileHeight = Std.parseInt(xml.get("tileheight"));
		this.tilesets = new Array<Tileset>();
		this.layers = new Array<Layer>();
		this.objectGroups = new Array<TiledObjectGroup>();
		
		for (child in xml) {
			if(Helper.isValidElement(child)) {
				if (child.nodeName == "tileset") {
					var tileset:Tileset = null;
					
					if (child.get("source") != null) {
						tileset = Tileset.fromGenericXml(Helper.getText(child.get("source")));
					} else {
						tileset = Tileset.fromGenericXml(child.toString());
					}

					tileset.setFirstGID(Std.parseInt(child.get("firstgid")));
					
					this.tilesets.push(tileset);
				}
				
				if (child.nodeName == "layer") {
					var layer:Layer = Layer.fromGenericXml(child, this);
					
					this.layers.push(layer);
				}
				
				if (child.nodeName == "objectgroup") {
					var objectGroup = TiledObjectGroup.fromGenericXml(child);
					
					this.objectGroups.push(objectGroup);
				}
			}
		}
	}
	
	/**
	 * Creates a BitmapData from a specific Layer
	 * @param layer The layer which the BitmapData will contain
	 * @return A BitmapData object
	 */
	 //todo, bake texture from layer
	// public function createBitmapDataFromLayer(layer:Layer):BitmapData {
	// 	var tilesetBitmapDataByFirstGID:IntHash<BitmapData> = new IntHash<BitmapData>();
		
	// 	for(t in this.tilesets) {
	// 		tilesetBitmapDataByFirstGID.set(t.firstGID, Helper.getBitmapData(t.image.source));
	// 	}
		
	// 	var bitmapData = new BitmapData(this.width * this.tileWidth,
	// 		this.height * this.tileHeight, true, 0x000000);

	// 	var gidCounter:Int = 0;

	// 	for(y in 0...this.height) {
	// 		for(x in 0...this.width) {
	// 			var nextGID = layer.tiles[gidCounter].gid;

	// 			if(nextGID != 0) {	
	// 				var texture:Texture = layer.tiles[gidCounter].texture;
	// 				var rect:Rectangle = new Rectangle(0, 0, this.tileWidth, this.tileHeight);
	// 				var point:Vector = new Vector(x * this.tileWidth, y * this.tileHeight);
					
	// 				bitmapData.copyPixels(texture, rect, point, null, null, true);
	// 			}

	// 			gidCounter++;
	// 		}
	// 	}

	// 	return bitmapData;
	// }

	/**
	 * Creates a BitmapData from a specific Layer ID
	 * @param layerID
	 * @return A BitmapData object
	 */
	// public function createBitmapDataFromLayerID(layerID:Int):BitmapData {
	// 	return this.createBitmapDataFromLayer(this.layers[layerID]);
	// }

	// /**
	//  * Creates a BitmapData from a specific set of Layers
	//  * @param layers An array filled with layers
	//  * @return A BitmapData object
	//  */
	// public function createBitmapDataFromArray(layers:Array<Layer>):BitmapData {
	// 	var bitmapData = new BitmapData(this.width * this.tileWidth,
	// 		this.height * this.tileHeight, true, 0x000000);

	// 	for(layer in layers) {
	// 		var layerBitmapData:BitmapData = this.createBitmapDataFromLayer(layer);

	// 		bitmapData.copyPixels(layerBitmapData, new Rectangle(0, 0, layerBitmapData.width, layerBitmapData.height),
	// 			new Point(0, 0), null, null, true);
	// 	}

	// 	return bitmapData;
	// }

	/**
	 * Creates a BitmapData from a specific set of Layer IDs
	 * @param layerIDs An array filled with IDs
	 * @return A BitmapData object
	 */
	// public function createBitmapDataFromIntArray(layerIDs:Array<Int>):BitmapData {
	// 	var layers = new Array<Layer>();

	// 	for(layerID in layerIDs) {
	// 		layers.push(this.layers[layerID]);
	// 	}

	// 	return this.createBitmapDataFromArray(layers);
	// }

	/**
	 * Creates a BitmapData from a range of Layers (example: from layer 2 to layer 5)
	 * @param fromLayerID the first layer
	 * @param toLayerID the last layer
	 * @return A BitmapData object
	 */
	// public function createBitmapDataFromRange(fromLayerID:Int, toLayerID:Int) {
	// 	var range:Array<Int> = new Array<Int>();

	// 	// toLayerID + 1 because layerID should also take the value of toLayerID
	// 	for(layerID in fromLayerID...(toLayerID + 1)) {
	// 		range.push(layerID);
	// 	}

	// 	return this.createBitmapDataFromIntArray(range);
	// }

	// /**
	//  * Creates a BitmapData from all layers
	//  * @return A BitmapData object
	//  */
	// public function createBitmapData():BitmapData {
	// 	return this.createBitmapDataFromRange(0, this.layers.length - 1);
	// }

	/**
	 * Returns the Tileset which contains the given GID.
	 * @return The tileset which contains the given GID, or if it doesn't exist "null"
	 */
	public function getTilesetByGID(gid:Int):Tileset {
		var tileset:Tileset = null;

		for(t in this.tilesets) {
			if(gid >= t.firstGID) {
				tileset = t;
			}
		}

		return tileset;
	}

	/**
	 * Returns the total Width of the map
	 * @return Map width in pixels
	 */
	private function get_totalWidth():Int {
		return this.width * this.tileWidth;	
	}
	
	/**
	 * Returns the total Height of the map
	 * @return Map height in pixels
	 */
	private function get_totalHeight():Int {
		return this.height * this.tileHeight;
	}

	/**
	 * Returns the layer with the given name.
	 * @param name The name of the layer
	 * @return The searched layer, null if there is no such layer.
	 */
	public function getLayerByName(name:String):Layer {
		for(layer in this.layers) {
			if(layer.name == name) {
				return layer;
			}
		}

		return null;
	}

	/**
	 * Returns the object group with the given name.
	 * @param name The name of the object group
	 * @return The searched object group, null if there is no such object group.
	 */
	public function getObjectGroupByName(name:String):TiledObjectGroup {
		for(objectGroup in this.objectGroups) {
			if(objectGroup.name == name) {
				return objectGroup;
			}
		}

		return null;
	}

	 /**
	  * Returns an object in a given object group
	  * @param name The name of the object
	  * @param inObjectGroup The object group which contains this object.
	  * @return An TiledObject, null if there is no such object.
	  */
	public function getObjectByName(name:String, inObjectGroup:TiledObjectGroup):TiledObject {
		for(object in inObjectGroup) {
			if(object.name == name) {
				return object;
			}
		}

		return null;
	}
	
}
