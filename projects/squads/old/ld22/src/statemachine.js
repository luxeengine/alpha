// This class is used internally by the state machine.
var State = new Class({
	initialize : function(enterState, updateState, exitState){
		this._enterState = enterState;
		this._updateState = updateState;
		this._exitState = exitState;
	}
});

// A state machine.
var StateMachine = new Class({
	initialize : function(){		
		this._stateDictionary = {}; 
		this._currentState = null;
	},
	
	addState : function(stateID, enterState, updateState, exitState) { //stateID can by string, int or whatever
		this._stateDictionary[stateID] = new State(enterState, updateState, exitState);
	},
	
	transitionTo : function(stateID) {
		if (stateID == null) {
			return;
		}
		
		if(this._stateDictionary == null) {
			return;
		}
		
		
		
		if(this._currentState != null) {
			if(this._currentState == stateID) {
				return;
			}
			
			var exitState = this._stateDictionary[this._currentState];
			
			if(exitState != null && exitState._exitState != null) {
				exitState._exitState();
			}
		}
		
		this._currentState = stateID;		
		//core.echo("...Entering state:  " + stateID);
		
		var enterState = this._stateDictionary[this._currentState];
		
		if(enterState != null && enterState._enterState != null) {
			enterState._enterState();
		}	
	},
	
	update :function(dt) {

		if(this._currentState == null) {
			return;
		}
		
		var updateState = this._stateDictionary[this._currentState];
		
		if(updateState == null || updateState._updateState == null) {
			return;
		}		
			
		updateState._updateState(dt);
	},
});