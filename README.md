#luxe

A cross platform game engine written in haxe   
**Note** : If you are using the older haxelab url,    
use `git remote set-url git@github.com:underscorediscovery/luxe.git` to change it to the new url

To get started : 

###Setup Haxe

 Install [Haxe 3](http://haxe.org/download)

###Setup NME build tools

 run `haxelib install nme` , it should be > 4.0.2   
 run `haxelib install openfl-tools`, it should be > 1.0.2    
 run `haxelib install actuate`   
 run `haxelib install format`   
    
 Then, make sure your build environment is setup, this will install xcode/visual studio, etc.
 
 run `haxelib run nme setup <platform>`,  where <platform> is your current os (mac, windows, linux)
 
###Get LiME

 1) get the [lime](https://github.com/underscorediscovery/LiME) repo from git   
 2) tell haxelib where to find `lime`, by using `haxelib dev /path/to/lime`   
 i.e :   

 ` cd ~/mydevfolder && mkdir lime `   
 ` git clone git@github.com:underscorediscovery/LiME.git`    
 ` cd lime `   
 ` haxelib dev lime ./ `   

###Get luxe   

1) get the [luxe](https://github.com/underscorediscovery/luxe) repo from git   
2) set the haxelib dev folder for luxe, like with lime       
 i.e :
 
 ` cd ~/mydevfolder && mkdir luxe `   
 ` git clone git@github.com:underscorediscovery/luxe.git`   
 ` cd luxe `    
 ` haxelib dev luxe ./ `   
 
##Build the test project, using `haxelib run luxe`
    
 `cd ~/mydevfolder/luxe/projects/simplest`   
 `haxelib run luxe test mac` or `haxelib run luxe test linux` or `haxelib run luxe test windows`

Note : You can alias `haxelib run luxe` to `luxe` using symlinks or a batch file in your PATH if you want to - this will be automated soon in a luxe installer.

###That should be it!
