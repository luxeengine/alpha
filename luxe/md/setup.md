[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[View all guides](guide.html)

----

## Setting up

---

<a id="step1" name="step1">
###Step 1: Make sure Haxe is installed
</a>
[ ![haxe](images/haxe.png) ](http://haxe.org)

<a href="http://haxe.org/"><h4>Install Haxe 3.2.0+</h4></a>
luxe uses a modern, high level programming language   
and cross platform toolkit called Haxe.

---

<a id="step2" name="step2">
###Step 2: Make sure git is correctly installed
</a>

[ ![github](images/github.png) ](https://github.com)

<a href="https://github.com/underscorediscovery/luxe"><h4>luxe is hosted on Github.com</h4></a>
To use the alpha of luxe, you must have git installed.   
If you don't have git installed, [there are some instructions below](#install-git).

---

<a id="step3" name="step3">
###Step 3: Install luxe
</a>

[ ![deps](images/deps.png) ](https://github.com/underscorediscovery/luxe)

<a href=""><h4>luxe has two dependencies</h4></a>

luxe uses [flow](https://github.com/underscorediscovery/flow) to build,   
and [snow](https://github.com/underscorediscovery/snow) to access the platforms.

---

**Using `haxelib git` to install**   
Once you have git installed, you can use haxelib to install the libraries.

Simply run the following commands:

`haxelib git flow https://github.com/underscorediscovery/flow.git`

`haxelib git snow https://github.com/underscorediscovery/snow.git`

`haxelib git luxe https://github.com/underscorediscovery/luxe.git`

---

<small>

**Optional: Manually cloning**   

If you clone the repositories manually, tell haxelib where to find the clone.

`haxelib dev <library> <path/to/library>`

</small>

---

##Test if setup is correct

The simplest way to test is to run a test case for the web target.   
To find out where haxelib put the luxe code, run `haxelib path luxe`.

To run the test:

- `cd /path/to/luxe/tests/features/draw/`
- `haxelib run flow run web`

You should see something similar to this open in your browser

![](images/guide.drawing.png)

---

##What's next?

Once everything is set up, there are further steps for working with luxe.

- You can and should set up [IDE/Editor support](#step5).
- Setup native platforms (mac/windows/linux/ios/android), [go to step 4](#step4).

Additionally,

- Always visit http://snowkit.org for the latest news and user posts.
- You can follow news on http://twitter.com/snowkitorg
- You can join the community chat http://snowkit.org/chat
- You can view the [user guides](guide.html)
- You can see the [“awesome-snowkit”](https://github.com/anissen/awesome-snowkit) respository for resources.
- [Additional help and information](http://snowkit.org/2014/10/29/quick-setup-guides-and-help/)

---

<a id="step4" name="step4">
###Step 4: Setup Native targets
</a>

**Step 4.1 - Install C++**   
To build the native targets, you must have c++ installed.

- Windows : [Visual C++ 2013](https://www.visualstudio.com/en-us/products/visual-studio-community-vs.aspx)   
- Linux : GCC/G++   
- Mac : [Xcode](https://developer.apple.com/xcode/downloads/) (and command line tools)   
- iOS : Xcode, [iOS SDK](https://developer.apple.com/ios/) (comes with xcode)
- Android : [Android SDK](http://developer.android.com/sdk/index.html), [Android NDK](https://developer.android.com/tools/sdk/ndk/index.html), [Continued setup](http://snowkit.org/2014/10/29/quick-setup-guides-and-help/#androidspecificsetup)

**Step 4.2 - Download the snow prebuilt binary**   

snow is the underlying framework that handles the platform specifics for luxe.

Since snow interacts with the platform, it has prebuilt c++ components.   
These prebuilt binaries are compiled by an automated build server,   
and _currently_, **need to be copied manually into your snow folder.**

Download the prebuilt files for your target platforms here:

#### http://build.luxeengine.com/snow

- Find out where snow is stored by running `haxelib path snow`.
- Copy the contents of the zip file into the `<snow root>/ndll/` folder.
- For history and details, [read this dev log](http://snowkit.org/2015/03/23/snowkit-dev-log-2-history/#buildkitestatusanddownloads).

It should look like this (note: mine includes all platforms inside the ndll folder,   
you only need the ones for the targets that you are using currently).

![](images/snowndllfolder.png)

---

<a id="step5" name="step5">
###Step 5: Editor Setup
</a>

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

<a id="install-git" name="install-git">&nbsp;</a>
## Appendix A: Installing git

**Windows**   
Pick **one** of these options :

1. Install [Github for Windows](https://windows.github.com/). This is easiest.
2. Install cli [msysgit](http://msysgit.github.io/). <small>Make sure git is in your PATH.</small>
3. Install [cmder](http://gooseberrycreative.com/cmder/). <small>The full download includes git.</small>

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

###[Continue to the user guides](guide.html)
###[Back to the index](index.html)

&nbsp;   
&nbsp;   
&nbsp;   
&nbsp;   
&nbsp;   

