package tests;

    //Simple test runner with simple logging
    //MIT License, based on https://github.com/visionmedia/mocha 

class H {

    public static function it(test,func) {
        trace('\tH.it :: ' + test);
        try{
            func();
        } catch(e:Dynamic) {
            trace('\t\t✘ ' + test);
            trace(e);
        }
    }

    public static function equal(value:Dynamic, expected:Dynamic) {
        if( value != expected ) {
            throw '\t\t✘ fail ' + value + ' == ' + expected;
        } else {
            trace('\t\t✓ pass ' + value + ' == ' + expected);
        }
    }
}