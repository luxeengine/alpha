[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[View all guides](guide.html)

----

## Setting up

---

####Make sure haxe is installed

<a id="find-haxe" name="find-haxe">
<h4>Install Haxe 3.1.3+</h4></a>
&nbsp;   
[ ![haxe](images/haxe.png) ](http://haxe.org)

Alternatively, [you can help test the new Haxe 3.2.0 release](http://snowkit.org/2015/03/16/haxe-3-2-0/).
&nbsp;   

---
&nbsp;   
####Make sure git is correctly installed

<a id="find-git" name="find-git">
<h4>Install Git</h4></a>

[ ![github](images/github.png) ](https://github.com)

To use the alpha of luxe, you must have git. 

**Windows**   
Pick one of these options :

1. Install [Github for Windows](https://windows.github.com/). This is easiest.
2. Install cli [msysgit](http://msysgit.github.io/). <smal>Make sure git is in your PATH.</small>

**Mac**   
Check if you have git already, by running `git --version` from `Terminal.app`.

1. Install from homebrew
  - Install [homebrew](http://brew.sh/) if you haven't   
  - From <code>Terminal.app</code> run `brew install git`

2. Install via Github for Mac
  - Install [Github for Mac](https://mac.github.com/)
  - Run the app, in the menu choose Preferences -> Advanced -> Install command line tools

**Linux**   
This varies wildly by distro, use your favourite package manager or install process.

For example, on ubuntu 12+ you could use `sudo apt-get install git-core`.

---
&nbsp;   
&nbsp;   
####Make sure flow, snow and luxe are installed
<a id="find-libs" name="find-libs">

[ ![deps](images/deps.png) ](http://luxeengine.com/)

&nbsp;   

[flow](https://github.com/underscorediscovery/flow) | [snow](https://github.com/underscorediscovery/snow) | [luxe](https://github.com/underscorediscovery/luxe)

&nbsp;   

This process is the same for all 3 libraries.   
This process is easiest using the github app for Windows/Mac.

For each of the dependencies the steps are the same :

1. Clone the repository code into a folder somewhere
2. Tell haxelib that this folder refers to the library

Note that this folder below is referred to as path/to/library/, which is not a real path, but where you have cloned the repo.

<h4>Installing the libraries</h4></a>

**Step one: Clone the repository**

1. Using the desktop app
    - Visit the repository link on github, in browser
    - click "Clone in desktop"
    - Find folder location by right click on repo in app

2. Using manual clone
    - `cd <path/to/library/>`
    - `git clone <repourl>`

3. Using haxelib git
    - `haxelib git <library> <repourl>`

**Step two: Tell haxelib where to find the library**

Only required for option 1. or 2.

`haxelib dev <library> <path/to/library>`

**Library links**

**flow** (haxelib name: `flow`)
- [visit flow on github](https://github.com/underscorediscovery/flow)
- repo url `https://github.com/underscorediscovery/flow.git`

**snow** (haxelib name: `snow`)
- [visit snow on github](https://github.com/underscorediscovery/snow)
- repo url `https://github.com/underscorediscovery/snow.git`

**luxe** (haxelib name: `luxe`)
- [visit luxe on github](https://github.com/underscorediscovery/luxe)
- repo url `https://github.com/underscorediscovery/luxe.git`

---

##Test if setup is correct

The simplest way to test is to 

- `cd /path/to/luxe/tests/features/draw/`
- `haxelib run flow run web`

You should see something similar to this open in your browser

![](images/guide.drawing.png)
&nbsp;
&nbsp;

<a name="native"></a>

##Native targets

To build windows/mac/linux builds, you need to have c++ installed.

- Windows : Visual C++ 2013 ([free](https://www.visualstudio.com/en-us/products/visual-studio-community-vs.aspx))
- Linux : gcc/g++   
- Mac : Xcode (and command line tools)   


**Additionally,**   
You need to download the latest prebuilt binaries and drop them in your ndll/ folder.

[Read this blog post](http://snowkit.org/2015/03/23/snowkit-dev-log-2-history/#buildkitestatusanddownloads) for more details.

Download the prebuilt files for your target platforms here:

#### http://build.luxeengine.com/snow

&nbsp;
&nbsp;

## Additional help and information

Please visit http://snowkit.org for all the latest updates and news, as all news is posted here.

You can also follow on http://twitter.com/snowkitorg, or join http://snowkit.org/chat



##Editor setup

---

###Sublime text

When using the sublime text plugin provided by the build tools, you get project management, building and running, and full code completion within sublime text.

[Read the sublime text setup](https://underscorediscovery.github.io/flow/guide/sublimetext.html) docs.

![](images/plugins/sublime.png)

###Atom

Building, code completion, error linting, go to definition and more.

http://atom.io support is hosted by atom package manager.

For details and instructions, visit the links below.
You need both flow and haxe packages for using luxe.

http://atom.io/packages/haxe
http://atom.io/packages/flow

![](images/plugins/atom.png)

###Flash develop

When using the flash develop template provided, you also get project management, building and running, and full code completion.

![](images/plugins/5.png)

The FD template is located at [snowkit-fd](https://github.com/Chman/Snowkit-FD),   
and here is a direct [Download link](https://github.com/Chman/Snowkit-FD/blob/master/SnowkitTemplate.fdz?raw=true)

**Be sure to read the setup guide!**

[Read the flash develop setup](https://underscorediscovery.github.io/flow/guide/flashdevelop.html) docs.


---

###[Continue to the user guides](guide.html)
###[Back to the index](index.html)

&nbsp;   
&nbsp;   
&nbsp;   
&nbsp;   
&nbsp;   

