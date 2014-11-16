package transform;

import mohxa.Mohxa;

import luxe.utils.Maths;

class Transforms extends Mohxa {

    public function new() {

        super();

        describe('Transforms', function(){

            var t1 : luxe.Transform;
            var tparent : luxe.Transform;

            before(function(){
                log('creating transforms...');
                t1 = new luxe.Transform();
                t1.name = 'transform';
                tparent = new luxe.Transform();
                tparent.name = 'parent';
                t1.world.auto_decompose = true;
                tparent.world.auto_decompose = true;
            });

                describe('Setup', function(){

                    it('should not have any null components', function(){

                        notequal( t1, null, 'transform != null' );
                        notequal( t1.local, null, 'local != null' );
                        notequal( t1.world, null, 'world != null' );

                        notequal( t1.local.pos, null, 'local pos != null' );
                        notequal( t1.local.rotation, null, 'local rotation != null' );
                        notequal( t1.local.scale, null, 'local scale != null' );

                        notequal( t1.world.pos, null, 'world pos != null' );
                        notequal( t1.world.rotation, null, 'world rotation != null' );
                        notequal( t1.world.scale, null, 'world scale != null' );

                    }); //it

                }); //describe transform setup

                describe('local<->world propagation without parent', function(){

                    it('should update the world values when local values change, without a parent', function(){

                        t1.pos = new luxe.Vector(10,10,10);
                        t1.rotation = new luxe.Quaternion().setFromEuler(new luxe.Vector(0,90,0).radians());
                        t1.scale = new luxe.Vector(2,2,2);

                        log('transform pos ' + t1.pos);
                        log('transform rotation ' + t1.rotation);
                        log('transform scale ' + t1.scale);

                        log('transform world pos ' + t1.world.pos);
                        log('transform world rotation ' + t1.world.rotation);
                        log('transform world scale ' + t1.world.scale);

                            //watch out for round errors, especially on neko

                        equalfloat( t1.world.pos.x, t1.pos.x, 'world.pos.x = pos.x' );
                        equalfloat( t1.world.pos.y, t1.pos.y, 'world.pos.y = pos.y' );
                        equalfloat( t1.world.pos.z, t1.pos.z, 'world.pos.z = pos.z' );

                        equalfloat( t1.world.rotation.x, t1.rotation.x, 'world.rotation.x = rotation.x' );
                        equalfloat( t1.world.rotation.y, t1.rotation.y, 'world.rotation.y = rotation.y' );
                        equalfloat( t1.world.rotation.z, t1.rotation.z, 'world.rotation.z = rotation.z' );
                        equalfloat( t1.world.rotation.w, t1.rotation.w, 'world.rotation.w = rotation.w' );

                        equalfloat( t1.world.scale.x, t1.scale.x, 'world.scale.x = scale.x' );
                        equalfloat( t1.world.scale.y, t1.scale.y, 'world.scale.y = scale.y' );
                        equalfloat( t1.world.scale.z, t1.scale.z, 'world.scale.z = scale.z' );

                    }); //it

                }); //local<->world propagation without parent

                describe('local<->world propagation with parent', function(){

                    it('should update the position relative to parent, without scale/rotation', function() {

                        tparent.pos = new luxe.Vector(100,100,100);
                        log('parent pos set to 0,0,0');
                        t1.parent = tparent;
                        log('parent assigned');

                        equalfloat(t1.world.pos.x, 110, 'world.pos.x = by parent (110)');
                        equalfloat(t1.world.pos.y, 110, 'world.pos.y = by parent (110)');
                        equalfloat(t1.world.pos.z, 110, 'world.pos.z = by parent (110)');

                    });


                    it('should update the position relative to parent, with scale', function() {

                        log('parent scale set to 2,2,2');

                        tparent.scale = new luxe.Vector(2,2,2);

                        equalfloat(t1.world.pos.x, 120, 'world.pos.x = by parent scale (120)');
                        equalfloat(t1.world.pos.y, 120, 'world.pos.y = by parent scale (120)');
                        equalfloat(t1.world.pos.z, 120, 'world.pos.z = by parent scale (120)');

                    });

                    it('should update the position relative to parent, with rotation', function() {

                        log('parent rotation set to 0,90,0');

                        tparent.rotation = new luxe.Quaternion().setFromEuler(new luxe.Vector(0,90,0).radians());

                        equalfloat(t1.world.pos.x, 120, 'world.pos.x = by parent rotation (120)');
                        equalfloat(t1.world.pos.y, 120, 'world.pos.y = by parent rotation (120)');
                        equalfloat(t1.world.pos.z, 80, 'world.pos.z = by parent rotation (80)');

                    });

                }); //local<->world propagation with parent


                describe('Listeners called when local is changed', function(){

                    var pos_callback = false;
                    var rot_callback = false;
                    var sca_callback = false;

                    t1.listen_pos(function(v){
                        log('pos changed ' + v);
                        pos_callback = true;
                    });

                    t1.listen_rotation(function(r){
                        log('rotation changed ' + r);
                        rot_callback = true;
                    });

                    t1.listen_scale(function(s){
                        log('scale changed ' + s);
                        sca_callback = true;
                    });

                    log('resetting local transforms for callbacks to happen');

                    t1.pos = new luxe.Vector();
                    t1.rotation = new luxe.Quaternion();
                    t1.scale = new luxe.Vector(1,1,1);

                    it('should have called the callbacks', function(){
                        equal(pos_callback, true, 'pos callback');
                        equal(rot_callback, true, 'rotation callback');
                        equal(sca_callback, true, 'scale callback');
                    });

                    after(function(){
                        log('resetting parent transform rotation to new quaternion');
                        tparent.rotation = new luxe.Quaternion();
                    });

                }); //Listeners when local is changed

                describe('Sub Components should update the transform', function(){

                    t1.pos.x = 5;
                    t1.pos.x += 5;
                    t1.pos.y += 10;
                    t1.pos.z += 10;

                    log('setting parent scale to 1,2,1 using sub components');

                    tparent.scale.x = 1;
                    tparent.scale.z = 1;

                    it('should reflect changes in the transform on sub component changes', function(){

                        equalfloat(t1.world.pos.x, 110, 'world pos x updated (110)');
                        equalfloat(t1.world.pos.y, 120, 'world pos y updated (120)');
                        equalfloat(t1.world.pos.z, 110, 'world pos z updated (110)');

                    });

                }); //Sub Components should update the transform


            after(function(){
                log('cleaning transforms up...');
                t1 = null;
                tparent = null;
            });

        }); //describe transforms

        run();

    } //new

} //Transforms