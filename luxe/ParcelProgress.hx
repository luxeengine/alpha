package luxe;

import luxe.Resource;

import luxe.Parcel;
import luxe.Sprite;
import luxe.Color;
import luxe.options.ParcelProgressOptions;

class ParcelProgress { 
    
    var parcel : Parcel;

        //Parcle progress will create a fullscreen overlay
        //color background, logo image, and a progress bar
    var progress_bar        : Sprite;
    var progress_border     : Sprite;
    var background          : Sprite;

    var image_logo          : Sprite;
    var options             : ParcelProgressOptions;

        //for now, 
    var width : Float = 0;
    var height : Float = 0;

    public function new( _options:ParcelProgressOptions ) {

        options = _options;

        if(options.bar == null) {
            options.bar = new Color().rgb(0x343434);
        }

        if(options.bar_border == null) {
            options.bar_border = new Color().rgb(0x161616);
        }

        if(options.background == null) {
            options.background = new Color().rgb(0x090909);
        }

        if(options.fade_in == null) {
            options.fade_in = true;
        }

        if(options.fade_out == null) {
            options.fade_out = true;
        }

        if(options.fade_time == null) {
            options.fade_time = 0.3;
        }

        // if(options.texture != null) {
        //     image_logo = new Sprite({
        //         texture : options.texture, 
        //         pos : Luxe.screen.mid
        //     });
        // }

        var fade_alpha : Float = options.background.a;
        
        if(options.fade_in) {

            options.background.a = 0;
            options.bar.a = 0;
            options.bar_border.a = 0;

        } //fade in

        width = Luxe.screen.w * 0.75;
        height = Luxe.screen.h * 0.002;
        var ypos = Luxe.screen.h * 0.60; 

        background = new Sprite({
            pos : new Vector(),
            no_scene : true,
            size : new Vector( Luxe.screen.w, Luxe.screen.h ),
            centered : false,
            color : options.background
        });

        progress_bar = new Sprite({
            pos : new Vector(Luxe.screen.mid.x - (width/2), ypos - (height/2)),
            size : new Vector( 2, height ),
            no_scene : true,
            centered : false,
            color : options.bar
        });

        progress_border = new Sprite({
            size : new Vector( width, height ),
            color : options.bar,
            no_scene : true,
            centered : false,
            pos : new Vector(Luxe.screen.mid.x - (width/2) - 1, ypos - (height/2) - 1),
            geometry : Luxe.draw.rectangle({
                w : width + 2,
                h : height + 2
            })
        });

            //we intercept the onprogress and oncomplete of the parcel
        options.parcel.options.oncomplete = oncomplete;
        options.parcel.options.onprogress = onprogress;

        if(options.fade_in) {

                //fade in the progress bar
            background.color.tween(options.fade_time,{a:fade_alpha},true);
            progress_bar.color.tween(options.fade_time,{a:1},true);
            progress_border.color.tween(options.fade_time,{a:1},true);

        } //fade_in

    } //new

    public function set_progress( amount : Float ) {

        if(amount < 0) amount = 0;
        if(amount > 1) amount = 1;

        progress_bar.size.x = width * amount;

    } //set_progress

    public function onprogress( r:Resource ) {

            //work out where we are out
        var amount = options.parcel.current_count / options.parcel.total_items;
        
            //update the progress bar
        set_progress( amount );

    } //onprogress

    public function oncomplete( p:Parcel ) {

        if(options.fade_out) {

            background.color.tween( options.fade_time, {a:0}, true);
            progress_bar.color.tween( options.fade_time, {a:0}, true);
            progress_border.color.tween( options.fade_time, {a:0}, true)
                .onComplete( do_complete );

        } else {

            do_complete();

        } //fade out

    } //oncomplete

    function do_complete() {
        if(options.oncomplete != null) {
            options.oncomplete( options.parcel );
        }
    } //do_complete

} //Parcel Progress
