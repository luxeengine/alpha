
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[Back to feature guide](guide.html#list)
###[View all guides](guide.html)

---
## Using custom fonts in luxe
---


###Creating custom bitmap fonts

The fonts currently supported by luxe are in a "AngelCode BMFont" format. This format has become widespread and many tools now exist to create fonts easily for it.

Some tools to generate a font, but Literra is the best free choice :

- [Literra](http://kvazars.com/littera/), online, free
- [bmGlyph](http://www.bmglyph.com/), mac only, commercial
- [glyphdesigner](https://71squared.com/en/glyphdesigner), mac only, commercial
- [BMFont](http://www.angelcode.com/products/bmfont/), windows only, free

If you want to color the text in luxe using geometry colors, you must create a white fill on alpha image.

**Export the fonts as .fnt text based format**. 

###Importing custom fonts

To use a custom font, you can use a [parcel](guide.parcels.html) (as shown in the [beginner guide](guide.four.html)), or, you can manually load the font yourself.

To do so, you use `Luxe.resources.load_font`. You can manually create a `phoenix.BitmapFont` and use `BitmapFont.load`, or even `new BitmapFont()` and `from_string` functions. The [BitmapFont API docs](api/phoenix/BitmapFont.html) have all the details.


To use `Luxe.resources.font` and `Luxe.resources.load_font` you should also read the [assets guide](guide.assets.html).   
Take note that the folder is separated from the file name, because there can and often are multiple texture sheets for a font set. The name is always without a path.

_find more code in tests/rendering/fonts/_

```
override function ready() {

    var get = Luxe.resources.load_font('assets/fonts/font.fnt');
    get.then(function(font:BitmapFont) {

        Luxe.draw.text({
            font: font,
            text : "LUXE\n",
            bounds : new Rectangle(0, 0, Luxe.screen.w * 0.99, Luxe.screen.h * 0.98),
            color : new Color().rgb(0xff4b03),
            align : TextAlign.right,
            align_vertical : TextAlign.bottom,
            point_size : 32
        });

    }); //onload

}
```

---

&nbsp;   

###[Back to feature guide](guide.html#list)
###[View all guides](guide.html)

&nbsp;   
&nbsp;   
&nbsp;   