## luxe simple platformer example

This example is to demonstrate a few concepts in simple form.

This example covers the following concepts:

### Tilemaps
- Loading a tilemap from Tiled
    + Using the layer information from Tiled to
        * Use image layers (background)
        * Use object layers (portals, spawn, exit)
- Tilemap general helpers
    + Using `bounds_fitted` to create collision shapes
    + Using `geometry_for_layer` to control geometry properties

### luxe.Physics
- Using luxe.Physics.PhysicsEngine
    + Useful to update your movement code consistently

### luxe.collision
- Using the collision queries directly
- Handling the collision result easily
- Using tags for collision information

### luxe.Camera
- Using a fixed world size to handle auto scaling

