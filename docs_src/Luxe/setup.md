[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[View all guides](guide.html)

----

## Setting up

### How do I install luxe?
---

CURRENTLY - because of pre release status :

You only get luxe from the [git repository](http://github.com/underscorediscovery/luxe).   

The steps are really simple :

<a name="requirements"> </a>
## What do I need to get started?
---

###You need Haxe 3.0 or higher.

[ ![haxe](images/haxe.png) ](http://haxe.org/download)
####[Install haxe first](http://haxe.org/download).

<a name="install"> </a>
## Install the lime framework
---

`haxelib` is a command line tool installed with Haxe automatically, and acts as a package manager for installing and sharing haxe libraries.   

To install luxe from haxelib, open a Terminal/Command line and type the following : 

`haxelib install lime`   
`haxelib run lime setup`   

This will create a command called `lime` which you use to build your projects,   
and continue the set up process for you.

It should be noted that if you are using **Windows**, you should be using a sane cmd.exe alternative, one that includes git etc. [Get a great cmd replacement here](http://bliker.github.io/cmder/).

## Get the luxe repo from git
---

You can manually use git to fetch the code from the [git repository](http://github.com/underscorediscovery/luxe), or you can use the excellent [Windows](http://windows.github.com/) and [Mac](http://mac.github.com/) which are highly recommended.

You might want to clone the repo somewhere easily accessible, as the example projects, tests and samples are all in the repository folder right now.

##Tell haxelib where to find luxe
---

First - make sure haxelib is up to date by running `haxelib selfupdate`, which has instructions for you to follow.

Once you have the repo locally, you need to know where it is.    
You can find this by right clicking in the github app or wherever you cloned the repo to.

`haxelib dev luxe /path/to/luxe/repo`

##Tell lime to setup luxe dependencies
---

`haxelib install luxe`

##Test a simple build of a luxe project
---

To build a luxe project, you also use the lime command. To test that things are set up correctly, you can run `lime test html5` from the _/path/to/luxe/repo/_samples/simplest folder and you should see if a webpage with numbers on screen load up. If so, you are done!


##Native targets
--- 

Lastly, if you want to compile to native binaries like Mac app or Windows exe files, you can use lime to install any other requirements for your platform.   
_You only need to run the setup for platforms you are on/using_. If you already have any of the dependencies installed, just say no to the prompts :)

`lime setup windows`   
`lime setup mac`   
`lime setup linux`   
`lime setup android`   
`lime setup ios`   

## What else?
---

Nothing! 

Currently the following targets are official and supported in luxe :

`lime test html5`   
`lime test windows`   
`lime test mac`   
`lime test linux`   
`lime test android`   
`lime test ios`   


## Projects, Tests
---

You can have a look inside of the `projects/` and `tests/` folders for plenty of projects to look at, as well as the guide to get started.

## IDE's and code complete
---

###For [Sublime Text](http://sublimetext.com/3) : 

- get [package control](https://sublime.wbond.net/installation#st3)
- install the Haxe package, you do this by pressing 
- `ctrl/cmd + shift + p` --> `Package Control: Install Package` --> `Haxe`)

To work within a project folder in sublime : 

- open luxe project FOLDER in the sublime window, should show up in the side bar
- open the luxe project file (project.luxe.xml) 
- `ctrl/cmd + shift + p --> type NME and select Set Syntax: NME Build File`
- `ctrl/cmd + shift + b --> select C++ - Test`
- `CTRL enter --> runs project build`

###For [FlashDevelop](http://www.flashdevelop.org/)

- look inside `setup/flashdevelop`
- read the instructions there

<!-- You can test if everything is setup ok, using a template project :

`luxe create empty MyTestProject`   
`cd MyTestProject`   

and then once inside the project folder :   

`luxe test html5` to open the project in your browser.

You can test native binaries by running : 

`luxe test mac` or `luxe test linux` or `luxe test windows` -->


##Get started by reading the guide or viewing more samples
---

###[View guide](guide.html)

&nbsp;   
---
&nbsp;   
&nbsp;   
&nbsp;   
&nbsp;   
&nbsp;   

