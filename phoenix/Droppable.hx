package phoenix;

class Droppable {
	public var references : Int = 0;
	public var dropped : Bool = false;

	public function drop() {
		dropped = true;
	}
}