
#luxe
##pre release road map



###pre use goals
		
#####installation tools

- make an installer?

#####documentation and guides

- installation and troubleshooting
- feature workflow, figure it out, implement it
- find a good way to automate code signature pulls and run parity check with docs for warnings when doing docs

#####building and CI
- make sure that the build chains handle luxe commands
- make sure project files can be called non nmml
- make sure we have a stable setup of teamcity, running builds for nme.ndll, haxebullet.ndll and other extensions
- setup configurations for nme, luxe, and make lime works

#####branding and site
- make a website and community site for the engine
- integrate accounts early so we can implement rewards and stuff

### Goal Engine Features

####samples
- at least a sample for every major class, all unique assets
- at least two full sample games (simplish ones)

####tests
- more entity tests, in various configurations
- more code coverage 

####physics 
- tidy up ammo bindings using @:native and externs
- expose a flag to select the physics provider
- implement 2d and 3d separations into the systems level
- implement 2d colliders and shapes
- add nape support
- add box2d support 

##modules

####modules and extensions
- figure out good workflow for extensions 
- figure out if we need/can do modules in a require fashion

#####tiles and tilesheets module
- support for tmx (added already), to test: isometric   
- support for transforms (i.e point to world and vice versa)

####general
- browse classes and code from lab projects and see what we can add as modules and extensions, and what should be built in


###later features
- code generator for c++ code, like binding box2d to an ndll
