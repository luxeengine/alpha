package lab.core;

import lab.core.Core;

    //Import GL stuff from nme
import lab.gl.GL;
import lab.gl.GLBuffer;
import lab.gl.GLProgram; 
    
    //utils
import lab.utils.Float32Array;

    //geometry
import lab.geometry.Matrix3D;

class Phoenix {
        
    public var core : Core;
    public function new( _core:Core ) { core = _core; }

        //direct_renderer_handle for NME
    public var direct_renderer_handle : Dynamic;

    public function startup() {

            //Set up the OpenGL View
        direct_renderer_handle = nme_direct_renderer_create();
            //Add this to the main stage, so it will render
        nme_doc_add_child(core.stage_handle, direct_renderer_handle);
            //Set this handle to the real view with a render function
        nme_direct_renderer_set( direct_renderer_handle, on_render );

            init();

            //Done.
        core._debug(':: haxelab :: \t Phoenix Initialized.');
    }

    public function shutdown() {
        core._debug(':: haxelab :: \t Phoenix shut down.');
    }


    public function process() {
        
    }

    private var shaderProgram:GLProgram;
    private var vertexAttribute:Int;
    private var vertexBuffer:GLBuffer;

    private function createProgram ():Void {
        
        var vertexShaderSource = 
            
            "attribute vec3 vertexPosition;
            
            uniform mat4 modelViewMatrix;
            uniform mat4 projectionMatrix;
            
            void main(void) {
                gl_Position = projectionMatrix * modelViewMatrix * vec4(vertexPosition, 1.0);
            }";
        
        var vertexShader = GL.createShader (GL.VERTEX_SHADER);
        GL.shaderSource (vertexShader, vertexShaderSource);
        GL.compileShader (vertexShader);
        
        if (GL.getShaderParameter (vertexShader, GL.COMPILE_STATUS) == 0) {
            
            throw "Error compiling vertex shader";
            
        }
        
        var fragmentShaderSource = 
            
            "void main(void) {
                gl_FragColor = vec4(1.0, 1.0, 1.0, 1.0);
            }";
        
        var fragmentShader = GL.createShader (GL.FRAGMENT_SHADER);
        
        GL.shaderSource (fragmentShader, fragmentShaderSource);
        GL.compileShader (fragmentShader);
        
        if (GL.getShaderParameter (fragmentShader, GL.COMPILE_STATUS) == 0) {
            
            throw "Error compiling fragment shader";
            
        }
        
        shaderProgram = GL.createProgram ();
        GL.attachShader (shaderProgram, vertexShader);
        GL.attachShader (shaderProgram, fragmentShader);
        GL.linkProgram (shaderProgram);
        
        if (GL.getProgramParameter (shaderProgram, GL.LINK_STATUS) == 0) {
            
            throw "Unable to initialize the shader program.";
            
        }
        
        GL.useProgram (shaderProgram);
        vertexAttribute = GL.getAttribLocation (shaderProgram, "vertexPosition");
        GL.enableVertexAttribArray (vertexAttribute);
        
    }

    public function init() {
        createProgram ();
            
            var vertices = [
                
                100, 100, 0,
                -100, 100, 0,
                100, -100, 0,
                -100, -100, 0
                
            ];
            
            vertexBuffer = GL.createBuffer ();
            GL.bindBuffer (GL.ARRAY_BUFFER, vertexBuffer);  
            GL.bufferData (GL.ARRAY_BUFFER, new Float32Array (vertices), GL.STATIC_DRAW);

    }

    public function on_render( rect:Dynamic ) {

        GL.viewport (Std.int (rect.x), Std.int (rect.y), Std.int (rect.width), Std.int (rect.height));

            //Set the clear color
        GL.clearColor(0.6,0.1,0.1,1);
        GL.clear( GL.COLOR_BUFFER_BIT | GL.DEPTH_BUFFER_BIT  );
                
        var positionX = rect.width / 2;
        var positionY = rect.height / 2;
        
        var projectionMatrix = Matrix3D.createOrtho (0, rect.width, rect.height, 0, 1000, -1000);
        var modelViewMatrix = Matrix3D.create2D (positionX, positionY, 1, 0);
        
        GL.bindBuffer (GL.ARRAY_BUFFER, vertexBuffer);
        GL.vertexAttribPointer (vertexAttribute, 3, GL.FLOAT, false, 0, 0);
        
        var projectionMatrixUniform = GL.getUniformLocation (shaderProgram, "projectionMatrix");
        var modelViewMatrixUniform = GL.getUniformLocation (shaderProgram, "modelViewMatrix");
        
        GL.uniformMatrix3D (projectionMatrixUniform, false, projectionMatrix);
        GL.uniformMatrix3D (modelViewMatrixUniform, false, modelViewMatrix);
        
        GL.drawArrays (GL.TRIANGLE_STRIP, 0, 4);

        
    }


//nme functions
    private static var nme_doc_add_child            = Core.load("nme","nme_doc_add_child", 2);
    private static var nme_direct_renderer_create   = Core.load("nme","nme_direct_renderer_create", 0);
    private static var nme_direct_renderer_set      = Core.load("nme","nme_direct_renderer_set", 2);


} 

    