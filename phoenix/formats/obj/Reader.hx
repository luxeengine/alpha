package phoenix.formats.obj;

import phoenix.formats.obj.Data;

class Reader {
    var i : haxe.io.Input;

    var vertexIndices : Array<Int>;
    var uvIndices : Array<Int>;
    var normalIndices : Array<Int>;

    public function new(input) {
        i = input;
        i.bigEndian = true;
    }

    public function read() {
        
        var file_string : String = i.readAll().toString();
        var lines = file_string.split('\n');
        
        var data = parse(lines);

        return data;        
    }

    private function parse( lines : Array<String> )  {

        var data : phoenix.formats.obj.Data = {
            vertices : new Array<phoenix.formats.obj.Vertex>()
        };

        vertexIndices = new Array<Int>();
        normalIndices = new Array<Int>();
        uvIndices = new Array<Int>();

        var temp_verts : Array<phoenix.formats.obj.Vector> = new Array<phoenix.formats.obj.Vector>();
        var temp_uvs : Array<phoenix.formats.obj.UV> = new Array<phoenix.formats.obj.UV>();
        var temp_normals : Array<phoenix.formats.obj.Normal> = new Array<phoenix.formats.obj.Normal>();

        for(line in lines) {
            
            line = StringTools.trim(line);

            var type = line.split(' ')[0];

            switch(type) {
                case "v":
                    temp_verts.push( parse_vert(line) );
                case "vt":  
                    temp_uvs.push( parse_uv(line) );
                case "vn":
                    temp_normals.push( parse_normal(line) );
                case "f":
                    parse_face(line);
                case "s":

            }
        }

                    // For each vertex of each triangle
        for( i in 0 ... vertexIndices.length ) {

                // Get the indices of its attributes
                var vertexIndex : Int = vertexIndices[i];
                var uvIndex : Int = uvIndices[i];
                var normalIndex : Int = normalIndices[i];
                
                // Get the attributes thanks to the index
                var pos = temp_verts[ vertexIndex-1 ];
                var uv = (uvIndex != -1) ? temp_uvs[ uvIndex-1 ] : { u:0.0, v:0.0 };
                var normal = (normalIndex != -1) ? temp_normals[ normalIndex-1 ] : { x:0.0, y:0.0, z:0.0, w:0.0 };

                // trace('\t pos : ' + pos);
                // trace('\t uv : ' + uv);   
                // trace('\t normal : ' + normal);

                data.vertices.push({
                    pos : pos,
                    uv : uv,
                    normal : normal
                });
        }

        return data;
    }

    private function parse_vert(line:String) : phoenix.formats.obj.Vector {
            
            //note items[0] is the identifier
        var items = line.split(' ');

            //remove any loose extra spaces 
            //that the exporter may have added
        for(element in items) {
            if( element.length == 0) {
                items.remove(element);
            }
        } //for each element

        var v : phoenix.formats.obj.Vector = {
            x : Std.parseFloat( items[1] ),
            y : Std.parseFloat( items[2] ),
            z : Std.parseFloat( items[3] ),
            w : (items.length > 4) ? Std.parseFloat( items[4] ) : 1.0
        };

        return v;

    } //parse_vert

    private function parse_uv(line:String) : phoenix.formats.obj.UV {

            //note items[0] is the identifier
        var items = line.split(' ');

            //remove any loose extra spaces 
            //that the exporter may have added
        for(element in items) {
            if( element.length == 0) {
                items.remove(element);
            }
        } //for each element

        var uv : phoenix.formats.obj.UV = {
            u : Std.parseFloat( items[1] ),
            v : Std.parseFloat( items[2] )
        };

        return uv;
    }

    private function parse_normal(line:String) : phoenix.formats.obj.Normal {
        
            //note items[0] is the identifier
        var items = line.split(' ');

            //remove any loose extra spaces 
            //that the exporter may have added
        for(element in items) {
            if( element.length == 0) {
                items.remove(element);
            }
        } //for each element

        var n : phoenix.formats.obj.Normal = {
            x : Std.parseFloat( items[1] ),
            y : Std.parseFloat( items[2] ),
            z : Std.parseFloat( items[3] ),
            w : (items.length > 4) ? Std.parseFloat( items[4] ) : 1.0
        }

        return n;

    } //parse_normal

    private function parse_face(line:String) {

            //remove rogue endings from the line
        line = StringTools.trim(line);
            //split the parts up by spaces, f 1/1 2/2 3/3
        var items = line.split(' ');

           //remove any loose extra spaces 
            //that the exporter may have added
        for(element in items) {
            if( element.length == 0) {
                items.remove(element);
            }
        } //for each element

            //we want to remove the `f` item
        items.shift();

        if(items.length > 3) {
            throw "Can't parse faces that aren't triangulated from here (yet).";
        }

            //we need to allow extraneous items
            //in the f 1//2 type setup from the spec
        for(item in items) {
                //if there is a basic 1/2/3 setup 
            if(item.indexOf('//') == -1) {

                var indices = item.split('/');

                    //Vertex indices
                vertexIndices.push( Std.parseInt(indices[0]) );

                    //UV's 
                uvIndices.push( Std.parseInt(indices[1]) );

                    //it's possible no normals exist
                if(indices.length > 2) {
                    normalIndices.push( Std.parseInt(indices[2]) );
                } else {
                    normalIndices.push( -1 );
                }

            } else {

                //if in this case it should be 1//3,
                //meaning only normals and no uv coords                

                var indices = item.split('/');

                    //Vertex indices
                vertexIndices.push( Std.parseInt(indices[0]) );
                    //No UV coords given so we use -1 to specify
                    //that it's not a valid imported UV and default to 0,0
                uvIndices.push( -1 );

                    //it's possible no normals exist
                if(indices.length > 2) {
                    normalIndices.push( Std.parseInt(indices[2]) );
                } else {
                    normalIndices.push( -1 );
                }

            } // // is not found

        } //for each set of indices

        //     //split each index by /
        // var vert1 = items[1].split('/');
        // var vert2 = items[2].split('/');
        // var vert3 = items[3].split('/');

        

        // vertexIndices.push( Std.parseInt(vert1[0]) );
        // vertexIndices.push( Std.parseInt(vert2[0]) );
        // vertexIndices.push( Std.parseInt(vert3[0]) );

        // uvIndices.push( Std.parseInt(vert1[1]) );
        // uvIndices.push( Std.parseInt(vert2[1]) );
        // uvIndices.push( Std.parseInt(vert3[1]) );

        // normalIndices.push( Std.parseInt(vert1[2]) );
        // normalIndices.push( Std.parseInt(vert2[2]) );
        // normalIndices.push( Std.parseInt(vert3[2]) );

    }

}


