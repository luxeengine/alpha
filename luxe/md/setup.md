[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[View all guides](guide.html)

----

## Setting up

### luxe setup helper
---

Download and run the setup helper for your platform.    
**Currently** this does not install anything, simply ensures you are correctly setup.   
You continue to test the setup at each stage of installation.

It also includes some samples and a link to the documentation.
In future, it will check for updates, and install as many requirements as feasible.


<a href=""> <img title="Mac" alt="Mac" src="images/mac64.png" class="platform-icon-64"/> mac </a> <br/>
<a href=""> <img title="Linux" alt="Linux" src="images/linux64.png" class="platform-icon-64"/> linux </a> <br/>
<a href=""> <img title="Windows" alt="Windows" src="images/windows64.png" class="platform-icon-64"/> windows </a>

##What next?

---

###[Continue to the user guides](guide.html)
###[Back to the index](index.html)

&nbsp;   
&nbsp;   
&nbsp;   
&nbsp;   

---

###Troubleshooting

**These sections only apply if the installer brings you here**

---

&nbsp;   
&nbsp;   
####Make sure haxe is installed

<a id="find-haxe" name="find-haxe">
<h4>Install Haxe 3.1.3+</h4></a>
&nbsp;   
[ ![haxe](images/haxe.png) ](http://haxe.org)

---
&nbsp;   
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


&nbsp;
&nbsp;

###[Continue to the user guides](guide.html)
###[Back to the index](index.html)

&nbsp;   
&nbsp;   
&nbsp;   
&nbsp;   
&nbsp;   

