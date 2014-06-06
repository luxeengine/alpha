package luxe;

class Log {

        //default to log
    public static var _level : Int = 1;

    macro public static function level( __level:Int ) : haxe.macro.Expr {

        trace("/ luxe / set log level to " + _level );

        _level = __level;

        return macro null;

    } //level

        //This macro uses the defined log level value to reject code that 
        //shouldn't even exist at runtime , like low level debug information 
        //and logging by injecting or not injecting code 
    macro public static function log( value:Dynamic ) : haxe.macro.Expr {

        if(_level > 0) {
            return macro @:pos(haxe.macro.Context.currentPos()) trace('/ i / ' + $value);
        } 

        return macro null;

    } //log

    macro public static function _debug( value:Dynamic ) {
        
        if(_level > 1) {
            return macro @:pos(haxe.macro.Context.currentPos()) trace('/ d / ' + $value);
        }

        return macro null;

    } //_debug

    macro public static function _verbose( value:Dynamic ) {

        if(_level > 2) {
            return macro @:pos(haxe.macro.Context.currentPos()) trace('/ v / ' + $value);
        }

        return macro null;

    } //_verbose

}