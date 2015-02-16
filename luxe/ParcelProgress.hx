package luxe;

import luxe.resource.Resource;

import luxe.Parcel;
import luxe.Sprite;
import luxe.Color;
import luxe.options.ParcelProgressOptions;

class ParcelProgress {

    var parcel : Parcel;

        //Parcle progress will create a fullscreen overlay
        //color background, logo image, and a progress bar
    var progress_bar        : Sprite;
    var progress_border     : Visual;
    var background          : Sprite;

    var image_logo          : Sprite;
    var options             : ParcelProgressOptions;

        //for now,
    var width : Float = 0;
    var height : Float = 0;

    public function new( _options:ParcelProgressOptions ) {

        var _view_width = Luxe.screen.w;
        var _view_height = Luxe.screen.h;

        if(Luxe.camera.size != null) {
            _view_width = Luxe.camera.size.x;
            _view_height = Luxe.camera.size.y;
        }

        var _view_mid_x = Math.floor(_view_width/2);
        var _view_mid_y = Math.floor(_view_height/2);

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

        width = Math.max(Math.floor(_view_width * 0.75), 2);
        height = Math.max(Math.floor(_view_height * 0.002), 2);
        var ypos = Math.floor(_view_height * 0.60);
        var half_width = Math.floor(width/2);
        var half_height = Math.floor(height/2);

        background = new Sprite({
            no_scene : true,
            size : new Vector( _view_width, _view_height ),
            centered : false,
            color : options.background,
            depth : 998,
            visible: true,
        });

        progress_bar = new Sprite({
            pos : new Vector(_view_mid_x - half_width, ypos - half_height),
            size : new Vector( 2, height ),
            no_scene : true,
            centered : false,
            color : options.bar,
            depth : 998
        });

        progress_border = new Visual({
            color : options.bar,
            no_scene : true,
            pos : new Vector(_view_mid_x - half_width, ypos - half_height),
            geometry : Luxe.draw.rectangle({
                w : width,
                h : height,
                depth : 998.1
            }),
            depth : 998.1
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

        progress_bar.size.x = Math.ceil(width * amount);

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
