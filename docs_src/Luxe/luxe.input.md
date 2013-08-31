
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[Back to api](api.html)

[Mouse API](#Mouse)   
[Keys API](#Keys)   
[Gamepad API](#Gamepad)   


<a name="Mouse" >
    <a href="#Mouse"> <h3>Mouse API</h3> </a>
</a>


    
These are used inside of the `onmousemove` and `onmousedown`, and passed in as `MouseEvent`:
You can implement the following listeners in your game class : 

    public function onmousedown(event)  { } 
    public function onmouseup(event)    { } 
    public function onmousemove(event)  { } 

#### examples

    public function onmousedown( event ) {
        
        if( event.button == MouseButton.left ) {            
        }

    } //onmousedown

#### Typedefs and enumerations
    
    enum MouseState {
        down;
        move;
        up;
    }

    enum MouseButton {
        move;
        left;
        middle;
        right;
        wheel_up;
        wheel_down;
    }

    typedef MouseEvent = { 

        var state       : MouseState;
        var flags       : Int;
        var button      : MouseButton;
        var x           : Float;
        var y           : Float;
        var deltaX      : Float;
        var deltaY      : Float;
        var shift_down  : Bool;
        var ctrl_down   : Bool;
        var alt_down    : Bool;
        var meta_down   : Bool;

    }


<a name="Keys" >
    <a href="#Keys"> <h3>Keys API</h3> </a>
</a>

    
Values accessed via Luxe.input.keys.*   
These are used inside of the `onkeydown` and `onkeyup`, and passed in as `KeyEvent`:
You can implement the following listeners in your game class : 

    public function onkeydown(event)    { } 
    public function onkeyup(event)      { } 

#### examples

    public function onkeyup( event ) {
        
            //quit the game when we press escape
        if( event.value == Input.Keys.escape ) {
            Luxe.shutdown();
        }

    } //onkeyup

#### Values

    tab         
    enter   
    meta    
    shift   
    leftctrl 
    leftalt  
    capslock 
    escape   
    space   

    left    
    up      
    right       
    down    

    key_0 
    key_1 
    key_2 
    key_3 
    key_4 
    key_5 
    key_6 
    key_7 
    key_8 
    key_9 

    key_A 
    key_B 
    key_C 
    key_D 
    key_E 
    key_F 
    key_G 
    key_H 
    key_I 
    key_J 
    key_K 
    key_L 
    key_M 
    key_N 
    key_O 
    key_P 
    key_Q 
    key_R 
    key_S 
    key_T 
    key_U 
    key_V 
    key_W 
    key_X 
    key_Y 
    key_Z 

    equals  
    minus   
    tilde   


<a name="Gamepad" >
    <a href="#Gamepad"> <h3>Gamepad API</h3> </a>
</a>


** Gamepad api is in flux and will be documented more soon **

Values accessed via Luxe.input.Gamepad.*
These are used inside of the `onjoyaxismove` and others, and passed in as `GamepadEvent`:
You can implement the following listeners in your game class : 

    public function onjoyaxismove(e)    { }
    public function onjoyballmove(e)    { }
    public function onjoyhatmove(e)     { }    
    public function onjoybuttondown(e)  { }    
    public function onjoybuttonup(e)    { }

#### example

    public function onjoyaxismove( event ) {
        
        if( event.value == Input.Gamepad.axis0 ) {
            //move accordingly
        }

    } //joyaxismove

#### Values

    button0
    button1
    button2
    button3
    button4
    button5
    button6
    button7
    button8
    button9
    button10
    button11
    button12
    button13
    button14
    button15

    axis0
    axis1
    axis2
    axis3
    axis4
    axis5
    axis6
    axis7

    hat0
    hat1
    hat2
    hat3
    hat4
    hat5
    hat6
    hat7

