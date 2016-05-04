package luxe.types.user;

typedef Game = {{#if luxe.game~}} {{{toString luxe.game}}} {{~else~}} {{{toString project.app.main}}} {{~/if~}} ;
