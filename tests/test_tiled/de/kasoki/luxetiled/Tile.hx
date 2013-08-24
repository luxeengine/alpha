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

import phoenix.Texture;

class Tile {

	public var gid(default, null):Int;
	public var parent(default, null):Layer;
	public var texture(get, null):Texture;
	public var width(get, null):Int;
	public var height(get, null):Int;

	private function new(gid:Int, parent:Layer) {
		this.gid = gid;
		this.parent = parent;
	}

	public static function fromGID(gid:Int, parent:Layer):Tile {
		return new Tile(gid, parent);
	}

	private function get_texture():Texture {
		return parent.parent.getTilesetByGID(this.gid).getTileTextureByGID(this.gid);
	}

	private function get_width():Int {
		return parent.parent.tileWidth;
	}

	private function get_height():Int {
		return parent.parent.tileHeight;
	}
	
}
