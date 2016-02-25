package luxe;

import luxe.resource.Resource;

import luxe.Log.*;
import luxe.Parcel;
import luxe.Sprite;
import luxe.Color;
import luxe.options.ParcelProgressOptions;

class ParcelProgress {

    var parcel : Parcel;

        //Parcel progress will create a fullscreen overlay
        //color background, logo image, and a progress bar
        //unless no_visuals option was provided as true. if so these are null
    var progress_bar        : Sprite;
    var progress_border     : Visual;
    var background          : Sprite;

    var image_logo          : Sprite;
    var options             : ParcelProgressOptions;

        //for now,
    var width : Float = 0;
    var height : Float = 0;
    var fade_alpha : Float = 0;

    public function new( _options:ParcelProgressOptions ) {

        var _view_width:Float = Luxe.screen.w;
        var _view_height:Float = Luxe.screen.h;

        if(Luxe.camera.size != null) {
            _view_width = Luxe.camera.size.x;
            _view_height = Luxe.camera.size.y;
        }

        var _view_mid_x = Math.floor(_view_width/2);
        var _view_mid_y = Math.floor(_view_height/2);

        width = Math.max(Math.floor(_view_width * 0.75), 2);
        height = Math.max(Math.floor(_view_height * 0.002), 2);

        options = _options;

        def(options.no_visuals, false);
        def(options.bar, new Color().rgb(0x343434));
        def(options.bar_border, new Color().rgb(0x161616));
        def(options.background, new Color().rgb(0x090909));
        def(options.fade_in, true);
        def(options.fade_out, true);
        def(options.fade_time, 0.3);

        fade_alpha = options.background.a;

        if(!options.no_visuals) {

            if(options.fade_in) {
                options.background.a = 0;
                options.bar.a = 0;
                options.bar_border.a = 0;
            } //fade in

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

            if(options.fade_in) {

                    //fade in the progress bar
                background.color.tween(options.fade_time,{a:fade_alpha},true);
                progress_bar.color.tween(options.fade_time,{a:1},true);
                progress_border.color.tween(options.fade_time,{a:1},true);

            } //fade_in

        } //no visuals?

            //we intercept the begin, onprogress and oncomplete of the parcel
        options.parcel.on(ParcelEvent.load, onbegin);
        options.parcel.on(ParcelEvent.progress, onprogress);
        options.parcel.on(ParcelEvent.complete, oncomplete);

    } //new

    public function set_progress( amount : Float ) {

        if(amount < 0) amount = 0;
        if(amount > 1) amount = 1;

        if (!options.no_visuals) {
            progress_bar.size.x = Math.ceil(width * amount);
        }

    } //set_progress

    public function onbegin( _parcel:Parcel ) {

        set_progress(0);

        if(!options.no_visuals) {

            if(options.fade_in) {

                options.background.a = 0;
                options.bar.a = 0;
                options.bar_border.a = 0;
                background.color.tween(options.fade_time,{a:fade_alpha},true);
                progress_bar.color.tween(options.fade_time,{a:1},true);
                progress_border.color.tween(options.fade_time,{a:1},true);
            
            } else {

                options.background.a = 1;
                options.bar.a = 1;
                options.bar_border.a = 1;

            }

        } //not with no_visuals

    } //onbegin

    public function onprogress( _state:ParcelChange ) {

            //work out where we are out
        var amount = _state.index / _state.total;

            //update the progress bar
        set_progress( amount );

    } //onprogress

    public function oncomplete( _parcel:Parcel ) {

        if(!options.no_visuals && options.fade_out) {

            do_complete();

            background.color.tween( options.fade_time, {a:0}, true);
            progress_bar.color.tween( options.fade_time, {a:0}, true);
            progress_border.color.tween( options.fade_time, {a:0}, true);

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
