#haxelab

A cross platform game engine written in haxe

To get started : 

###Setup Haxe

 Install [Haxe 3](http://haxe.org/download)

###Setup NME build tools

 run `haxelib install nme` , it should be > 4.0.2   
 run `haxelib install openfl-tools`, it should be > 1.0.2    
 run `haxelib run nme setup`, it will create the `nme` command

###Get LiME

 git clone [lime](https://github.com/underscorediscovery/LiME)   
    set the haxelib dev folder for lime to the clone path : i.e   
 ` cd ~/dev/lime `   
 ` haxelib dev lime ./ `

###Get haxelab

 git clone [haxelab](https://github.com/underscorediscovery/haxelab)   
    set the haxelib dev folder for haxelab, like above       
 ` cd ~/dev/haxelab `   
 ` haxelib dev haxelab ./ `

##Build the test project
    
 `cd projects/empty/`   
 `nme test mac` or `nme test linux` or `nme test windows`


###That should be it!
