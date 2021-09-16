<a href="/"><img style="width:10em; height:10em;" src="./content/images/2017/10/luxe.logo.png"/> </a>

**Please note** the instructions below are for the old deprecated luxe alpha.    

---

# step 1. Install Haxe

#### Install the latest stable Haxe release, 3.2.4  
luxe requires Haxe 3.2.0+, and works with the latest stable release of Haxe.

[**You can download and install it here**](http://haxe.org/download/version/3.4.2/)   

![](./content/images/2016/08/haxe.png" style="margin:0; width:3em; border-radius:0)

---

# step 2. Install git

---

To use the luxe alpha, you must have git installed. **luxe is hosted on [Github](https://github.com/)**.
**If you aren't familiar with git, try the [Github Desktop](https://desktop.github.com/" target="_blank) client.**   
<small>The desktop client can install the command line tools if you need them.</small>   

![](./content/images/2016/08/github.png" style="margin:0; width:5em; border-radius:0)

---

# step 3. Install luxe

---

Installing luxe is currently done via a simple automated tool called [snowfall](https://snowkit.org/2016/02/17/snowfall/).
You install snowfall by running the following commands in a command line. 
These two commands will install luxe and all it's dependencies. 

`haxelib install snowfall`   
`haxelib run snowfall update luxe`

Once that completes, you can **test the setup** with:

`haxelib run snowfall test luxe`

For convenience you can **install command shortcuts**:

`haxelib run snowfall shortcuts`

<small>Now you can use `snowfall` and `flow` as a command without `haxelib run` in front.</small>

![](./content/images/2016/08/icon_text_dark_small.png" style="margin:0; width:5em; border-radius:0)

---

# Where to next?

---

**If you need just the web platform target, you are done!**   
Native platform targets require c++, and some require configuration. See below.

- You can [set up an IDE / Editor](/setup-an-ide) to work with
- View the [user guide](/guide) for getting started
- Consider getting involved in the [community](/#community)
- Explore “[awesome-snowkit](https://github.com/anissen/awesome-snowkit)” for games, examples and more

---

## Step 4. Native platform targets

All native platform targets use `hxcpp`, the c++ backend for Haxe.
The known to be stable version of hxcpp is `3.4.64`.


`haxelib install hxcpp 3.4.64`

---

### Pick a platform target 

[Mac](#mac) • [iOS](#ios) • [Android](#android) • [Linux](#linux) • [Windows](#windows)

---

<a name="mac"></a>
#### I want to build for Mac

- **You can only build for Mac from a Mac.**
- Install [Xcode](https://developer.apple.com/xcode/downloads/)
  - Xcode includes the command line tools, SDK's, and more

<a name="ios"></a>
#### I want to build for iOS

- **You can only build for iOS from a Mac.**
- Install [Xcode](https://developer.apple.com/xcode/downloads/)
  - Xcode includes the simulators, SDK's and so on
- To build for iOS, Xcode is used.
   - in your project folder, run `flow build ios`
   - an Xcode project is generated in `ios.project/`
   - open this project in Xcode and use it
   - default is debug scheme (slower!), use release for testing
   - once generated, the project is yours
     - it will not be overwritten unless forced
     - it will not be updated by flow in any way
     - This allows you to use the Xcode tools and features in full
     - Set your project icons, splash etc directly in their UI

<a name="android"></a>
#### I want to build for Android

- **You can only build for Android from Windows, Mac or Linux.**
- Install [Android Studio](https://developer.android.com/studio/index.html)
- Install all the necessary SDK's via their tools, note the NDK is required.
- Tell hxcpp where to find the NDK
   - open `<user directory>/.hxcpp_config.xml`
   - inside the vars node, add or edit this node 
   - <small>`<set name="ANDROID_NDK_ROOT" value="/path/to/android-ndk-r10e"/>`</small>
   - The ndk versions r10~ are known to be compatible but latest should work
- To build for Android, an Android Studio project is used.
  - in your project folder, run `flow build android`
  - an Android Studio project is generated in `android.project/`
  - open this project in Android Studio, and use it!
  - Android Studio runs flow for you, via gradle (flow.gradle)
  - once generated, the project is yours
     - it will not be overwritten unless forced
     - it will not be updated by flow in any way
     - This allows you to use the Android Studio tools and features in full
     - Set your project and builds and releases in their tools

<a name="linux"></a>
#### I want to build for Linux

- **You can only build for Linux from Linux.**
- The following dev packages are required to be installed
  - `libgl1-mesa-dev`
  - `libglu1-mesa-dev`
  - `libopenal-dev`
  - for ubuntu or similar, this should suffice: 
     - `sudo apt-get install libgl1-mesa-dev libglu1-mesa-dev libopenal-dev`

<a name="windows"></a>
#### I want to build for Windows

- **You can only build for Windows from Windows.**
- OpenAL currently needs to be installed: https://www.openal.org/downloads/
- Install [Visual C++](https://www.visualstudio.com/en-us/products/visual-studio-community-vs.aspx)
  - 2015 is fine, 2013 should work but
  - VS can get confused by multiple installs and mess itself up
  - Uninstall all versions you aren't using can help
  - If you STILL run into errors, ask for help in the community

---

# Where to find help

If you get stuck with setup or something isn't listed, please feel free to ask for help.

- [Ask the community!](/#community)
- [Ask on the support repo](https://github.com/luxeengine/support/)
