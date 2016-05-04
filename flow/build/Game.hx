package luxe.types.user;

@:noCompletion typedef Game = {{#if luxe.game~}} {{{toString luxe.game}}} {{~else~}} {{{toString project.app.main}}} {{~/if~}} ;
