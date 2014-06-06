package luxe;

import haxe.io.Path;
import haxe.macro.Context;
import haxe.macro.Expr;

class Log {

        //default to log
    public static var _level : Int = 1;

    public static var _log_width : Int = 16;

    macro public static function level( __level:Int ) : haxe.macro.Expr {

        trace("/ luxe / set log level to " + __level );

        _level = __level;

        return macro null;

    } //level

    macro public static function width( _width:Int ) : haxe.macro.Expr {

        trace("/ luxe / set log width to " + _width );

        _log_width = _width;

        return macro null;

    } //width

        //This macro uses the defined log level value to reject code that 
        //shouldn't even exist at runtime , like low level debug information 
        //and logging by injecting or not injecting code 
    macro public static function log( value:Dynamic ) : Expr {

        var _file = Path.withoutDirectory(_get_log_file());
        var _context = Path.withoutExtension(_file).toLowerCase();
        var _spaces = _get_spacing(_file);

        for(meta in Context.getLocalClass().get().meta.get()) {
            if(meta.name == ':log_as') {
                var _str = switch(meta.params[0].expr) {
                    case EConst(CString(str)): _context = str;
                    default: throw 'type should be string constant like "name" for log_as meta flag';
                }
            }
        } //for each meta

        if(_level > 0) {
            return macro @:pos(Context.currentPos()) trace('${_spaces}i / $_context / ' + $value);
        } 

        return macro null;

    } //log

    macro public static function _debug( value:Dynamic ) : Expr {
        
        var _file = Path.withoutDirectory(_get_log_file());
        var _context = Path.withoutExtension(_file).toLowerCase();
        var _spaces = _get_spacing(_file);
        
        for(meta in Context.getLocalClass().get().meta.get()) {
            if(meta.name == ':log_as') {
                var _str = switch(meta.params[0].expr) {
                    case EConst(CString(str)): _context = str;
                    default: throw 'type should be string constant like "name" for log_as meta flag';
                }
            }
        } //for each meta

        if(_level > 1) {
            return macro @:pos(Context.currentPos()) trace('${_spaces}d / $_context / ' + $value);
        }

        return macro null;

    } //_debug

    macro public static function _verbose( value:Dynamic ) : Expr {

        var _file = Path.withoutDirectory(_get_log_file());
        var _context = Path.withoutExtension(_file).toLowerCase();
        var _spaces = _get_spacing(_file);
        
        for(meta in Context.getLocalClass().get().meta.get()) {
            if(meta.name == ':log_as') {
                var _str = switch(meta.params[0].expr) {
                    case EConst(CString(str)): _context = str;
                    default: throw 'type should be string constant like "name" for log_as meta flag';
                }
            }
        } //for each meta

        if(_level > 2) {
            return macro @:pos(Context.currentPos()) trace('${_spaces}v / $_context / ' + $value);
        }

        return macro null;

    } //_verbose

    macro public static function _verboser( value:Dynamic ) : Expr {

        var _file = Path.withoutDirectory(_get_log_file());
        var _context = Path.withoutExtension(_file).toLowerCase();
        var _spaces = _get_spacing(_file);
        
        for(meta in Context.getLocalClass().get().meta.get()) {
            if(meta.name == ':log_as') {
                var _str = switch(meta.params[0].expr) {
                    case EConst(CString(str)): _context = str;
                    default: throw 'type should be string constant like "name" for log_as meta flag';
                }
            }
        } //for each meta

        if(_level > 3) {
            return macro @:pos(Context.currentPos()) trace('${_spaces}V / $_context / ' + $value);
        }

        return macro null;

    } //_verboser


//Internal Helpers


    static function _get_spacing(_file:String ) {

        var _spaces = '';

            //the magic number here is File.hx[:1234] for the trace listener log spacing
        var _trace_length = _file.length + 4;
        var _diff : Int = _log_width - _trace_length;
        if(_diff > 0) {
            for(i in 0 ... _diff) {
                _spaces += ' ';
            }
        }

        return _spaces;

    } //_get_spacing

    macro static function _get_log_file() {
        return macro Context.getPosInfos(Context.currentPos()).file;        
    } //get_log_context

} // Log