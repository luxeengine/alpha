//How to use : 
//Put the file inside your project, like this one is, inside the ./modules folder
// Near the top of your game.js file, add
  //  modules.use('.textitem', true, true);

  //Now, you may use TextItem anywhere in your game (it is a global class)
  // var t = new TextItem( 'WOO' , phoenix.resolution.div(2) );


//TextItem docs
// Since TextItem is a sprite, it has the same functions plus more : 

//var t = new TextItem('Hello');
// t.scale = 2; //font size to draw at
// t.text = 'new text';
// t.align = 0 = left ; 1 = center ; 2 = right
// t.font = different_font;
// var area = t.bounds(); //gets a rect

// var mousehit = t.contains(mouse);
// t.fade({ to:0.5, time:1000 }); //fade to half alpha over 1 second
// t.color = Color.orange; //change color



var TextItem = new Class({
    Extends:Sprite,

  initialize: function(text){
    var t = text;

    arguments[0] = false;
    this.parent.apply(this, arguments);
    this.geom.drop();
    this._font = game.font;

    if(this._font) {
      if(t.length) {
        this.geom = this._font.drawText(false, t, this.pos , Color.white, 1);
      } else {
        this.geom = new geometry();
      }    
    }

    this._align = 0;

    if(this.centered) {
      this._align = 1;
    }

    this._text = t;
    this._p = this.pos;
    this._scale = 1;

  }, //initialize


  bounds : function() {
    var r = rect(
        this.pos.x-(this.size.x/2),
        this.pos.y+(this.size.y/4),
        this.size.x,
        this.size.y);
    return r;
  },

  _settext : function(t) {

    if(!this._font) return;

    this._text = t; 

    var d = this.depth;
    var g = this.group;
    var p = this.pos;
    var c = this.color;
  
    this.geom.visible = false;
      //first
    this.size = vec2(this._font.widthOf(t,this.scale), this._font.height(t,this.scale));

    this.geom.drop();

    this.geom = this._font.drawText(false, t, vec2() , c, this._scale, d, g, this._align);
    this.pos = p;
    this._p = p;
    this.color = c;

    return true;
  }

});

  Object.defineProperty( TextItem.prototype, "text", {
      enumerable: true,
      configurable: true,
      get: function () {
        return this._text;
      },
      set: function(t) {
        return this._settext(t);
      }
  });

  Object.defineProperty( TextItem.prototype, "align", {
      enumerable: true,
      configurable: true,
      get: function () {
        return this._align;
      },
      set: function(a) {
        this._align = a;
        this._settext(this._text);
        return true;
      }
  });  

  Object.defineProperty( TextItem.prototype, "scale", {
      enumerable: true,
      configurable: true,
      get: function () {
        return this._scale;
      },
      set: function(s) {
        this._scale = s;
        this._settext(this._text);
        return true;
      }
  });  

  Object.defineProperty( TextItem.prototype, "font", {
      enumerable: true,
      configurable: true,
      get: function () {
        return this._font;
      },
      set: function(f) {
        this._font = f;
        this._settext(this._text);
        return true;
      }
  });  
