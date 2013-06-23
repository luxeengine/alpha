package phoenix;

class AbstractGarbageCollector {

	public var collect_rate : Int = 10;
	public var sleep_time : Float = 0.05;

	public function stop() {
	}

	public function start() {
	}
	public function lock() {
	}
	public function unlock() {
	}

	public function collect_function(){
		//this was threaded,so
		//sleep(sleep_time);
		
		clean();
	}

	public function clean(){};
}