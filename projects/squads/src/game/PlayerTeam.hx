
package game;

import luxe.Vector;
import luxe.Sprite;
import luxe.Color;

import luxe.components.Components.Component;

class PlayerTeam extends Component {

        //offset rotation in degrees
    public var flag : Sprite;
    var teamcolor : Color;

    public function init() {

        if(teamcolor == null) {
            teamcolor = new Color();
        }

        flag = new Sprite({
            texture : Luxe.loadTexture('assets/game/flag.png'),
            origin : new Vector(30,45),
            color : teamcolor
        });

        entity.add_child(flag);

        entity.events.listen('player.flip', onflip);
    }

    public function set_team_color( _team_color:Color ) {

        teamcolor = _team_color;

    }

    function onflip(_event:Dynamic) {

        flag.flipx = _event.flipx;

    }

    public function update() {

    }

} //PlayerAim