package luxe.tween.actuators;


class PropertyDetails<T> {
    
    
    public var change:Float;
    public var isField:Bool;
    public var propertyName:String;
    public var start:Float;
	public var target:T;
    
    
	public function new (target:T, propertyName:String, start:Float, change:Float, isField:Bool = true):Void {
        
        this.target = target;
        this.propertyName = propertyName;
        this.start = start;
        this.change = change;
        this.isField = isField;
        
    }
    
    
}
