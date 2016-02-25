import luxe.Parcel;
import luxe.Text;
import luxe.Vector;
import luxe.Color;
import luxe.Sprite;

class Splash extends luxe.ParcelProgress {

    var spin: luxe.Sprite;
    var info: luxe.Text;

    public function new(_parcel:Parcel, oncomplete:Void->Void) {
        
        super({
            parcel      : _parcel,
            background  : new Color(0.5,0.4,0.3,0.85),
            no_visuals  : true,
            oncomplete  : function(_) { oncomplete(); }
        });

        info = new Text({
            pos: Luxe.screen.mid,
            color: new Color(0,0,0,0.6).rgb(0xf94b04),
            text: '...',
            align: center, 
            point_size: 20
        });

        spin = new luxe.Sprite({
            texture: Luxe.resources.texture('assets/load.png'),
            pos: Luxe.screen.mid.add_xyz(0, 48),
            size: new Vector(40,40)
        });

        _parcel.load();

    } //new

    function onupdate(dt:Float) {

        spin.rotation_z += 360 * dt;

    }

    override public function onbegin( _parcel:Parcel ) {
        
        super.onbegin(_parcel);

        Luxe.on(Luxe.Ev.update, onupdate);

        spin.color.tween(0.4, { a:1 });
        info.color.tween(0.4, { a:1 });

        info.text = '...';

    } //onbegin

    override public function onprogress( _state:ParcelChange ) {
        
        super.onprogress(_state);

        info.text = '${_state.index} / ${_state.total}';
            //an alternative, showing percent
        // info.text = Math.floor((_state.index / _state.total) * 100) + '%';

        spin.color.tween(0.25, { a:0.25 }).onComplete(function(){ spin.color.tween(0.25, { a:1 }); });
        info.color.tween(0.25, { a:0.5 }).onComplete(function(){ info.color.tween(0.25, { a:1 }); });

    } //onprogress

    override public function oncomplete( _parcel:Parcel ) {

        Luxe.off(Luxe.Ev.update, onupdate);

        super.oncomplete(_parcel);

        spin.color.tween(0.1, { a:0 });
        info.color.tween(0.1, { a:0 });

    }

} //Splash