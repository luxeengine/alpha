
package game;

import luxe.Vector;
import luxe.Sprite;
import luxe.Color;

import luxe.components.Components.Component;
import phoenix.Texture;

class PlayerTeam extends Component {

        //offset rotation in degrees
    public var flag : Sprite;
    var teamcolor : Color;

    public function init() {

        if(teamcolor == null) {
            teamcolor = new Color();
        }

        flag = new Sprite({
            name : 'flag',
            texture : Luxe.loadTexture('assets/game/flag.png'),
            // origin : new Vector(0,0),
            color : teamcolor,
            size : new Vector(96,96),
            depth : 5
        });

        flag.texture.filter = FilterType.nearest;

        flag.parent = entity;

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