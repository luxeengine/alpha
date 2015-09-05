
import luxe.Input;
import luxe.Text;

class Main extends luxe.Game {

    var edit:Text;
    var nums:Text;
    var info:Text;

    var edit_edit:TextEdit;
    var nums_edit:TextEdit;

    override function ready() {

        info = new Text({
            text: 'Top accepts anything, bottom is numbers only',
            pos : Luxe.screen.mid.subtract_xyz(0,40),
            point_size : 18,
            align: center,
            align_vertical:center
        });

        edit = new Text({
            text: 'enter something ...',
            pos : Luxe.screen.mid,
            point_size : 32,
            align: center,
            align_vertical:center
        });

        nums = new Text({
            text: '01234567890',
            pos : Luxe.screen.mid.add_xyz(0,40),
            point_size : 32,
            align: center,
            align_vertical:center
        });

        edit_edit = new TextEdit();
        nums_edit = new TextEdit({ filter:new EReg('[0-9]+','gi') });

    } //ready

    override function onmousedown( e:MouseEvent ) {


        if(edit.has('text_edit')) edit.remove('text_edit');
        if(nums.has('text_edit')) nums.remove('text_edit');

        if(edit.text_bounds.point_inside(e.pos)) {

            if(!edit.has('text_edit')) edit.add( edit_edit );

        }

        if(nums.text_bounds.point_inside(e.pos)) {

            if(!nums.has('text_edit')) nums.add( nums_edit );

        }

    }

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

} //Main


