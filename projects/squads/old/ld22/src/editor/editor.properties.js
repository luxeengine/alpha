editor.addproperty = function() {
	
		var p = editor.gui.addname.getText();
		var v = editor.gui.addvalue.getText();
				
		if(editor.selected[0].entity) {
			if(!editor.selected[0].entity.instance.properties) editor.selected[0].entity.instance.properties = {};
			
					var f = parseFloat(v);
					if( !isNaN(f) ) {
						v = f;
					}
					
					if(v == 'true') {
						v = true;
					} else if(v == 'false') {
						v = false;
					}
			
			editor.selected[0].entity.instance.properties[p] = v;			
			editor.gui.props.addItem(p, v);
			editor.gui.addname.setText('');
			editor.gui.addvalue.setText('');
			
		}

	};
	
	editor.creategui = function() {
	
		editor.gui = {};
		editor.createpropertyedit();
		
		editor.resizeev = events.connect('onWindowResize', editor.onResize.bind(editor));
		
	};
	
	editor.onResize = function() {
		
			editor.gui.window.setBounds(rect(phoenix.resolution.x - 378, phoenix.resolution.y - 230, 355, 200));
			
		
	};
	
	editor.createpropertyedit = function() {
	
		editor.gui.window = new Window( 'Property Window', rect(phoenix.resolution.x - 378,  phoenix.resolution.y - 230, 355, 200), false, false, false );	
		editor.gui.window.close();
		var b = rect(phoenix.resolution.x - 378,  phoenix.resolution.y - 230, 355, 200);
		events.connect('onMouseMove', function(e) {
			var p = vec2(e);
			if(b.contains(p)) {
				editor.gui.hover = true;
			} else {
				editor.gui.hover = false;
			}
		});
		
		editor.gui.scroll = new ScrollArea( editor.gui.window, rect(5, 60, 330, 100) );
			editor.gui.props = new PropertyGrid( editor.gui.scroll, rect(0, 0, 310, 900) );
			editor.gui.props.connect('remove', function(e) {
				if(editor.selected[0].entity) {
					delete editor.selected[0].entity.instance.properties[e.name];
				} else if(editor.selected[0].isGroup) {
					
				}
			});
			
			editor.gui.props.connect('change', function(e) {
					v = e.value;
					if(e.name.substr(0,1) != '[') {
						var f = parseFloat(v);
						if( !isNaN(f) ) {
							v = f;
						}
					}
					
					if(v == 'true') {
						v = true;
					} else if(v == 'false') {
						v = false;
					}
					
					if(!editor.selected.length) {
						editor.gui.window.close();
						return;
					}
					if(editor.selected[0].entity) {						
						editor.selected[0].entity.instance.properties[e.name] = v;						
						editor.selected[0].entity.onPropertyEdit(e.name, v);
					} else {
						var ii = editor.selected[0];
						if(typeOf(ii[e.name]) == 'number') {
							ii[e.name] = v;
						} else if(typeOf(ii[e.name]) == 'string') {
							ii[e.name] = v;
						} else {
							core.echo( e.name + ' is changing ');
							var fsp = e.name.indexOf(' ');
							if(fsp != -1) {
								var nt = e.name.substr(0, fsp);
								e.name = e.name.substr(fsp+1, e.name.length - fsp - 1);
								nt = nt.replace('[',''); nt = nt.replace(']','');
								if(nt == 'vec2') {
									var c = v.split(' ');
									editor.selected[0][e.name] = vec2(parseFloat(c[0]),parseFloat(c[1]));					
								} else if(nt == 'rect') {
									var c = v.split(' ');
									editor.selected[0][e.name] = rect(parseFloat(c[0]),parseFloat(c[1]),parseFloat(c[2]),parseFloat(c[3]));								
								} else if(nt == 'color') {
									var c = v.split(' ');
									editor.selected[0][e.name] = color(parseFloat(c[0]),parseFloat(c[1]),parseFloat(c[2]),parseFloat(c[3]));
								} else if(nt == 'obj') {
									core.echo( e.name + ' changing ' );
									try {
										editor.selected[0][e.name] = JSON.decode(v);
										core.echo('valid json : ' + v);
										core.print(editor.selected[0][e.name]);
									} catch(e) {
										core.echo('invalid json');
									}
								}
								
							} else {
								//cant find it? 
							}
							//var stt = ii[e.name].stringType;
							//if(stt) {									
							//} else {
								
							//}							
						}
						
					}

			});
			editor.gui.props.setSplitPos( 150 );
			editor.gui.addname = new Textbox( editor.gui.window, 'property', rect(5,5, 285, 20) );
			editor.gui.addvalue = new Textbox( editor.gui.window, 'value', rect(5,30, 285, 20) );
			editor.gui.addbutton = new Button( editor.gui.window, 'add', rect( 295, 30, 40, 20 ) );
			editor.gui.addbutton.connect('click', editor.addproperty);
	};

	editor.showProperties = function( item ) {		
		editor.gui.window.show();
		//editor.gui.window.setBounds( rect(phoenix.resolution.x - 378, 410, 355, 200) );
		editor.gui.props.clear();
			if(item.entity) {
				if(item.entity.instance.properties) {
					for(var pp in item.entity.instance.properties) {
						var pv = item.entity.instance.properties[pp];
						if(typeOf(pv) != 'function') {
							editor.gui.props.addItem( pp, pv );
						}
					}
				}
			} else {
				for(var pp in item) {
					if(item.hasOwnProperty(pp)) {
						var pv = item[pp];
						if(typeOf(pv) != 'function' && pp.substr(0,1) != '_') {
							if(typeOf(pv) == 'object') {
								if(item[pp].stringType == 'Vector') {
									editor.gui.props.addItem( '[vec2] '+pp, pv.x + ' ' + pv.y );
								} else if(item[pp].stringType == 'Rect') {
									editor.gui.props.addItem( '[rect] '+pp, pv.x + ' ' + pv.y + ' ' + pv.w + ' ' + pv.h );
								} else if(item[pp].stringType == 'Color') {
									editor.gui.props.addItem( '[color] '+pp, pv.r + ' ' + pv.g + ' ' + pv.b + ' ' + pv.a );
								} else if(pp == 'flags') {
									editor.gui.props.addItem( '[obj] '+pp, JSON.encode(pv) );
								} else {
									//core.echo(pp + ' ' + item[pp].stringType );
									editor.gui.props.addItem( pp, pv );	
								}
							} else {
								editor.gui.props.addItem( pp, pv );
							}							
						}
					}
				}
			}			
		
	};	