		
			
		var ItemSelector = new Class({
			initialize : function(options) {
			
				
				if(options.depth == undefined) options.depth = 5004; 
				if(options.group == undefined) options.group = 902; 
				if(options.title == undefined) options.title = 'Select an item'; 
				if(options.rows == undefined) options.rows = 3;
				if(options.cols == undefined) options.cols = 4;
				if(options.spacing == undefined) options.spacing = vec2(10,15);
				if(options.offsets == undefined) options.offsets = vec2(40,40);
				if(options.buttonsize == undefined) options.buttonsize = vec2(140,140);
				if(options.imagesize == undefined) options.imagesize = vec2(112,112);
				if(options.textoffset == undefined) options.textoffset =  vec2(0,134);
				if(options.types == undefined) options.types = [game.types.js, game.types.json];							
				if(options.folder == undefined) options.folder = 'src/';					
				if(options.selectHandler == undefined) options.selectHandler = function() {}
				
				this.options = options;
				this.types = options.types;
				this.folder = options.folder;
				
				this.window = new Container('data/ui/window.png', vec2((phoenix.resolution.x/2) - 315, 40), vec2(630, 580), options.title, options.depth, options.group);
				this.window.hide(true);
				
				this.items = [];
				
					var cc = -1; var rr = 0;
					for( var i = 0; i < (this.options.rows * this.options.cols); ++i ) {
					
						var img = 'data/icons/script.png';
						var imgonly = ' ';
						
						var b = {
							imagename : 'data/icons/spriteback.png',						font: gamelab.font,
							hidden : true,															textoffset : this.options.textoffset,
							size: this.options.buttonsize,									centered: false,
							fontscale : 0.35, 														text: imgonly,
							normalAlpha : 0.5,													depth: 5005,
							group: 902,																fadeSpeed : 250,
							image : img,																imagesize : this.options.imagesize,
							imageoffset : vec2(),
						};
						
						cc += 1;
						if(cc >= this.options.cols) {  cc = 0;  rr += 1;  }
						
						var x = this.window.pos.x + this.options.offsets.x + (cc * (this.options.buttonsize.x + this.options.spacing.x)); 
						var y = this.window.pos.y + this.options.offsets.y + (rr * (this.options.buttonsize.y + this.options.spacing.y));
							
							b.pos = vec2(x,y);
							
						var a = new fadeButton(b);
							a.connect( function() {
								this.close();
							}.bind(this));
						this.items.push(a);
					}

						var b = {
							imagename : 'data/ui/window.png', 
							font: gamelab.font,					hidden : true, 
							textoffset : vec2(0,10),				size: vec2(100,35),
							centered: false, 						fontscale : 0.35, 
							text: 'CANCEL',							normalAlpha : 0.7,
							depth: 5005,	  							group: 902,
							fadeSpeed : 250,													
							pos : vec2(this.window.pos.x + 510, this.window.pos.y + 522 ),
						};
						
						this.window.cancelbutton = new fadeButton(b);
							this.window.cancelbutton.connect(function() {
								this.close();
							}.bind(this));

							
						b.text = '< PAGE ';
						b.pos = vec2(this.window.pos.x + 20, this.window.pos.y + 522 );
							
						this.window.pagebackbutton = new fadeButton(b);
							this.window.pagebackbutton.connect(function() {
								
								if(this.window.page > 1) {
									this.window.page--;
								} else {
									this.window.page = this.window.pages.length;
								}
								
								this.setPage( this.window.page );
									
							}.bind(this));
							
						b.text = 'PAGE > ';
						b.pos = vec2(this.window.pos.x + 120, this.window.pos.y + 522 );
							
						this.window.pagenextbutton = new fadeButton(b);
							this.window.pagenextbutton.connect(function() {
								
								if(this.window.page < this.window.pages.length) {
									this.window.page++;
								} else {
									this.window.page = 1;
								}
								
								this.setPage( this.window.page );
									
							}.bind(this));
							

			},
			
			setPage : function( page ) {
			
				var c = this.window.pages.length;
				if(page <= c) {
					this.window.setTitle( 'Select an item ' + ' [ ' + this.folder +  ' ] ' +  ' [ page ' + page + '/' + c + ' ]' );
					this.items.each(function(item, index){
						var pp = this.window.pages[page-1];
						var cc = pp.length;
						if(index >= cc) {
							if(!item.hidden) {
								item.hide();
							}
						} else {
							var listitem = this.window.pages[page-1][index];
							var filename = listitem.path;
							filename = filename.substr(5, filename.length-5);
							
							if(listitem.type == game.types.parentfolder) {
								listitem.filename = '[parent]';
								listitem.projectpath =  listitem.path;		
								core.echo(	this.folder + ' :::: ' + listitem.projectpath );
							} else {
								listitem.projectpath = filename;
								listitem.filename = filesys.filename(filename, false);
							}
							
							if( listitem.type == game.types.jpg ||   listitem.type == game.types.png ||  listitem.type == game.types.psd ) {
								item.imagesprite.texture = phoenix.texture( filename );
							} else {
								item.imagesprite.texture = phoenix.texture( listitem.type.icon );
							}
							
							item.setImageSize();
								var iconname = listitem.filename;
								if(iconname.length > 16) {
									//11111111...1111111
									var st = iconname.substr(0,8);
									var en = iconname.substr(iconname.length - 8,8);
									iconname = st+'...'+en;
								}
							item.setText( iconname );
							item.connect( function() {
								this.handleSelect( listitem );								
							}.bind(this));
							
							if(item.hidden) {
								item.show();
								item.enabled = true;
							}

						}

					}.bind(this));
				}			
			},
			
				//this actually sets the item images and descriptions.
			refresh : function( folder, types ) {
			
				if(folder) this.folder = folder;
				if(types) this.types = types;
				
				var newflist = [];
				if(this.types.contains(game.types.folder)) {
					this.filelist = filesys.getDirList(project.path(this.folder));
						newflist.push( {path:filesys.parentpath(this.folder), type:game.types.parentfolder});
					this.filelist.each(function(item) {
						var ss = item;
						if( ss.indexOf(project.location) != -1) {
							ss = ss.substr( project.location.length, ss.length - project.location.length);
						}
						
							if(this.folder.substr(0,2) == './') this.folder = this.folder.substr(2,this.folder.length-2);
						if(ss.indexOf(this.folder) != -1) {
							ss = ss.substr( this.folder.length, ss.length - this.folder.length);							
							if(ss.substr(0,1) == '/') ss = ss.substr(1,ss.length-1);
						}			

						if(ss.substr(0,1)  != '.') {
							newflist.push({path:item, type:game.types.folder});
						}
					}.bind(this));
				}
				
					this.filelist = filesys.getFileList(project.path(this.folder));
					
					this.filelist.filter(function(item,index,arr) {
						this.types.each(function(tp){ 						
							if( filesys.pathext( item ) == tp.ext ) {
								newflist.push({path:item, type:tp});
							}
						}.bind(this));							
					}.bind(this));
				
				this.filelist = newflist;
				
				this.window.pages = [];
				this.window.page = 0;
								
				if(this.filelist.length) {	
				
					var cc = 0;
					var currentpage = [];
					this.filelist.each(function(item, index){												
						
						cc += 1;
						
						if(cc > (this.options.cols*this.options.rows)) {	cc = 0;
							this.window.pages.push(currentpage);
							currentpage = [];
						}
						
						currentpage.push( item );
						
					}.bind(this));
					
					if(currentpage.length) {						
						this.window.pages.push(currentpage);
					}
					
					this.window.page = 1;
					var ff = function(){ this.setPage( this.window.page ); }.bind(this);
					ff.delay(50);
					
				}
				
			},
			
			close : function() {
			
				this.items.each(function(item){
					item.hide();
				});
						
				this.window.cancelbutton.hide();
				this.window.pagebackbutton.hide();
				this.window.pagenextbutton.hide();
				this.window.hide();
			},
			
			handleSelect : function(f) {
				if(f.type == game.types.folder) {
					this.refresh( f.projectpath );
				} else 	if(f.type == game.types.parentfolder) {
					core.echo( 'changing up  to ' + f.projectpath + '/' );
					this.refresh( f.projectpath + '/' );
				} else {
					this.options.selectHandler( f );
					this.close();
				}
			},
			
			show : function( folder, types ) { 

				this.refresh(folder, types);
			
				this.window.show();
				this.window.cancelbutton.show();
				this.window.pagebackbutton.show();
				this.window.pagenextbutton.show();
															
			},
		});
