    
	var _Editor = new Class({
		initialize: function( srcfolder ) {
						
			this.state = new StateMachine();
			this.modeIndex = 0;
			this.modes = [];
			this.activemode = { mode : 'none' } ;
				this.modes.push( this.activemode );
			
			if(srcfolder == undefined) srcfolder = './editor/';
			this.folders = {
				src : srcfolder,
				modes : srcfolder + 'modes/'
			}			
			
		},
		
		init:function() {
			if(filesys.exists( project.path(this.folders.modes) )) {
				exec(this.folders.modes,'*');
			}
			
			events.connect('key::shift::tab::down', function() {
				
				if(editor.gui.hover) return;
				
				if(levels.current.loaded) {
					if(this.activemode.mode != 'scene') {
						var mode = this.getModeByName('scene');
						this.switchmode( mode );
					} else {
						this.switchmode( 0 );
					}
				} else {
					core.echo('editor only works when a level is loaded');
				}
			}.bind(this));
		}, 
		
		getModeByName : function( name ) {
			var c = this.modes.length;
			for(var i = 0; i < c; ++i ) {
				if(name == this.modes[i].mode) {
					return i;
				}
			}
			return -1;
		},
		
		switchmode : function( index, obj, callback ) {
		
			if(typeOf(index) == 'string') index = this.getModeByName(index);
			if(index == -1) return core.echo('\t\t Editor : No mode like that .');

			if(obj == undefined) obj = {};

				//Leave the old mode 				
			core.echo('\t\t Editor :  Switching from ' +  this.activemode.mode);
			events.fire( 'editor.' + this.activemode.mode + '.mode.deactivate', obj );
			
				//Change to the new one 
			this.activemode = this.modes[index];
				core.echo('\t\t Editor :  Switching to ' +  this.activemode.mode);
			this.activateCallback = callback;
			events.fire( 'editor.' + this.activemode.mode + '.mode.activate', obj  );
		},
		
		cyclemode:function() {
			var c = this.modes.length;
			this.modeIndex++;
			this.modeIndex = this.modeIndex % c;
			this.switchmode( this.modeIndex );
		},
		
	});
	
	var Editor = new _Editor( './src/editor/' );
		Editor.init();
	