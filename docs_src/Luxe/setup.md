
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[View all guides](guide.html)

----

## Setting up

### How do I install luxe?
---

Luxe is distributed via `haxelib` - a package manager for haxe libraries that is installed automatically with haxe. There are plans in the roadmap to make the installation process even easier.   

You can also get luxe from the [git repository](http://github.com/underscorediscovery/luxe) ( jump to the [git install guide for luxe?](#fromgit) ).

<a name="requirements"> </a>
## What do I need to get started?
---

###You need Haxe 3.0 or higher.

[ ![haxe](images/haxe.png) ](http://haxe.org/download)
####[Install haxe first](http://haxe.org/download).

<a name="install"> </a>
## Installing from haxelib
---

To install luxe from haxelib, open a Terminal/Command line and type the following : 

`haxelib install lime`   
`haxelib install lime-tools`   
`haxelib install luxe`   

Now, we tell luxe to setup :

`haxelib run luxe setup`

This will create a command called `luxe` which you use to build your projects,   
and continue the set up process for you.

Finally, you can use luxe to install any other requirements for your platform.   
_You only need to run the setup for platforms you are on/using_.

`luxe setup windows`   
`luxe setup mac`   
`luxe setup linux`   
`luxe setup android`   
`luxe setup ios`   

## What else?

Nothing! 

You can test if everything is setup ok, using a template project :

`luxe create empty MyTestProject`   
`cd MyTestProject`   

and then once inside the project folder :   

`luxe test html5` to open the project in your browser.

You can test native binaries by running : 

`luxe test mac` or `luxe test linux` or `luxe test windows`

--- 

##Get started by reading the guide or viewing more samples

###[View the sample guide](samples.html)
###[View all guides](guide.html)

&nbsp;   
---
&nbsp;   

<a name="fromgit"> </a>
###Additional info - Installing from git
---

To install from git, you have two options :    

- Clone the repo from git to a folder, and tell `haxelib dev` where to find it. You can store the repo anywhere, this way.  

- Use `haxelib git` command to install the git repo into your haxelib folder. The location defaults are listed below.    

**Using _haxelib dev_ command**   

> haxelib dev is a simple command to point a library, by name, to a path.    

`haxelib dev luxe /path/to/luxe/folder`

**Using _haxelib git_ command**   

> haxelib git will fetch a library from git and store it by name, into your haxelib path. For windows this is _C:\HaxeToolkit\haxe\lib\luxe_ and on unix/mac _/usr/lib/haxe/lib/_.   

`haxelib git luxe https://github.com/underscorediscovery/luxe.git`

&nbsp;   
&nbsp;   
&nbsp;   

