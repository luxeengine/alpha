(function() {

	var SpawnPointEntity = new Class({
		Extends : Entity,
		
		initialize : function() {
			this.parent();
			this.name = 'spawn';	
			
			this.properties = {

			}
		},		
		
		onPropertyEdit : function( name, value ) {			
			this[name] = value;
		},
		
		onCreate : function( item ) {
		
				this._onCreate(item);


				
		},
		
	});
	
	return { classType : SpawnPointEntity, name : 'spawn' };
})()