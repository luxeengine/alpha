&nbsp;   
<div class="commit_info">

commit [009fe5e7c9](https://github.com/underscorediscovery/luxe/commit/009fe5e7c9dbcb807d632a4757e147b7531d1266)   
author: underscorediscovery   
date: Wed Jun 11 2014 06:46:19 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Components; Updating components for newest refactor</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [ec016cc68c](https://github.com/underscorediscovery/luxe/commit/ec016cc68cc31ecdda424ce626b6ca505b4bf786)   
author: underscorediscovery   
date: Wed Jun 11 2014 06:45:50 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>:: Major change :: luxe.components.Components.Component ---> luxe.Component; :: major change :: renaming default_camera, default_font, default_batcher to renderer.camera, renderer.font, renderer.batcher</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [e3cf09954d](https://github.com/underscorediscovery/luxe/commit/e3cf09954d86c2dda034d4357c9543dbf8798617)   
author: underscorediscovery   
date: Tue Jun 10 2014 02:14:36 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tween; updates to actuate 1.7.5, fix tweening snap bug found by @whuop</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [77641adf33](https://github.com/underscorediscovery/luxe/commit/77641adf3307d9f3ffdc177b64a3aa8ad63c4686)   
author: underscorediscovery   
date: Mon Jun 09 2014 20:19:54 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Scene; Entity; fixing bug where id was used instead of name for the scene list</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [b194cf410f](https://github.com/underscorediscovery/luxe/commit/b194cf410f20955defd969c16d1090dc524b7669)   
author: underscorediscovery   
date: Mon Jun 09 2014 06:23:49 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>CompositeGeometry; removing other listener causing slow down</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [f248f7cf03](https://github.com/underscorediscovery/luxe/commit/f248f7cf039d85f1cb3ee2c07051500145f6655d)   
author: underscorediscovery   
date: Mon Jun 09 2014 06:06:24 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>CompositeGeometry; fixing text bugs for #98 so long</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [62d169d717](https://github.com/underscorediscovery/luxe/commit/62d169d717876a174aaa9f1a70798b82cf955c10)   
author: underscorediscovery   
date: Mon Jun 09 2014 05:58:47 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>CompositeGeometry; fixing extra logging</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [d3de306df5](https://github.com/underscorediscovery/luxe/commit/d3de306df5b74c3869843383acbf6d4461f0e6ae)   
author: underscorediscovery   
date: Mon Jun 09 2014 05:50:47 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>CompositeGeometry; fixing compile error</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [6c1777c8a9](https://github.com/underscorediscovery/luxe/commit/6c1777c8a980d71fd5b89c9fb7191a1a5eb79653)   
author: underscorediscovery   
date: Mon Jun 09 2014 05:42:59 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Text; WIP fixes for a transform disparity issue due to composite geometry</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [c5afd8e313](https://github.com/underscorediscovery/luxe/commit/c5afd8e313f189e21e8f7b84c363feca09c97416)   
author: underscorediscovery   
date: Mon Jun 09 2014 00:50:49 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>General; adding ui button texture back for now</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [4302577e0c](https://github.com/underscorediscovery/luxe/commit/4302577e0c81c212f273fe1c8fe441d0b0397a41)   
author: underscorediscovery   
date: Mon Jun 09 2014 00:50:12 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Log; adding filter and exclude functionality to narrow down logging for debug purposes</li><li>For example,</li><li><haxeflag name="--macro" value="luxe.Log.filter('visual, entity)”/></li><li><haxeflag name="--macro" value="luxe.Log.exclude(‘entity)”/></li><li><haxeflag name="--macro" value="luxe.Log.level(3)"/></li><li>This would show values from visual only. without the exclude line, it</li><li>would show only logs from both. Again, this is fine for performance as</li><li>this happens at compile time and is not included in the output if not</li><li>needed.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [9f3d4a0994](https://github.com/underscorediscovery/luxe/commit/9f3d4a0994eac4d380149b1833b7fa3d4a1ef674)   
author: underscorediscovery   
date: Sun Jun 08 2014 08:53:36 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Component; enforcing rules via macro, and adding create() function callback, called immediately on creation of the component, like the constructor would normally be</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [0e6ee53355](https://github.com/underscorediscovery/luxe/commit/0e6ee533558e8498efd8e1c229aa55ff4a3667bb)   
author: underscorediscovery   
date: Sat Jun 07 2014 08:56:35 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Visual; fixing bug in scale when creating sprites with scale</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [9a63f39db0](https://github.com/underscorediscovery/luxe/commit/9a63f39db0398b39066951e85898f8f4c0fc58bb)   
author: underscorediscovery   
date: Sat Jun 07 2014 08:15:25 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; Updating changes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [2a6f09d239](https://github.com/underscorediscovery/luxe/commit/2a6f09d23925f14276401d50d1557782288c89d9)   
author: underscorediscovery   
date: Sat Jun 07 2014 08:12:43 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Debug; fix #97 trace view not updating when open</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [1306dcf48f](https://github.com/underscorediscovery/luxe/commit/1306dcf48fc6705d6a69fb00ae263cc08b881a7d)   
author: underscorediscovery   
date: Sat Jun 07 2014 08:01:15 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Transform;  Entity; Visual; changing how transforms are managed in entity stack with geometry. instead of manually updating the geometry the geometry is childed to the entity, so its transform remains in tact. This also fixes #96</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [ef4ab34fb7](https://github.com/underscorediscovery/luxe/commit/ef4ab34fb762fdbf5954661c1e9796e7d1f33c8f)   
author: underscorediscovery   
date: Sat Jun 07 2014 06:26:39 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; updating changes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [3804746357](https://github.com/underscorediscovery/luxe/commit/3804746357050a929b0643a4a43fc65d78981ad5)   
author: underscorediscovery   
date: Sat Jun 07 2014 06:26:31 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; updating docs and changes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [73175256c3](https://github.com/underscorediscovery/luxe/commit/73175256c30e2961d44adad9bc3db3fd9d517c55)   
author: underscorediscovery   
date: Sat Jun 07 2014 05:50:16 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Collision; update to latest hxcollision repo and clear up differences between the library and the luxe implementation for future updates back and forth</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [fd71b74f15](https://github.com/underscorediscovery/luxe/commit/fd71b74f151ad04c98d83a0b7eca6cdae1448285)   
author: underscorediscovery   
date: Sat Jun 07 2014 05:49:13 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>MAJOR CHANGE : Matrix4 renamed to Matrix. vector.applyMatrix4(m) renamed to .transform(m).</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [0b160d325b](https://github.com/underscorediscovery/luxe/commit/0b160d325b502a95a19af5a8f22795a30be5d7af)   
author: underscorediscovery   
date: Sat Jun 07 2014 01:54:01 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Batcher; Geometry; Adding vert count and geometry limits with errors fixes #84</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [f0f400f706](https://github.com/underscorediscovery/luxe/commit/f0f400f70610a749edda50693a79ba4caa6ad4c0)   
author: underscorediscovery   
date: Sat Jun 07 2014 01:53:03 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Physics; adding flag to disable debug drawing in samples and making sure it clears the geometry</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [e5f0f745a1](https://github.com/underscorediscovery/luxe/commit/e5f0f745a19c0002f7c7944b9b4c7b7f52de6ede)   
author: underscorediscovery   
date: Fri Jun 06 2014 23:12:47 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>HTML5; fixing builds breaking when a ttf exists in the assets folder</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [bb9e002b71](https://github.com/underscorediscovery/luxe/commit/bb9e002b7113feb795edc24b83db0b39c98d96c3)   
author: underscorediscovery   
date: Fri Jun 06 2014 19:04:39 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; fixing changes links being broken to the repo</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [3d70f5f524](https://github.com/underscorediscovery/luxe/commit/3d70f5f52427bb203099a9945ebba694dcad3d73)   
author: underscorediscovery   
date: Fri Jun 06 2014 19:01:14 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; updating changes + docs</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [16d30f1129](https://github.com/underscorediscovery/luxe/commit/16d30f1129f411dc295886b52394a80d300a4752)   
author: underscorediscovery   
date: Fri Jun 06 2014 19:00:38 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>SpriteAnimation; Fixing logging not compiling</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [ddb736e74b](https://github.com/underscorediscovery/luxe/commit/ddb736e74babc32c3e791e07969ee8df87746c55)   
author: underscorediscovery   
date: Fri Jun 06 2014 18:53:51 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Renderer; fixing inconsistent logging on html5</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [b8edec82c4](https://github.com/underscorediscovery/luxe/commit/b8edec82c41b09588238a15e3da92ee20bc4bc1b)   
author: underscorediscovery   
date: Fri Jun 06 2014 18:50:13 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>BuildVersion; Fixing html5 builds, incorrect shielding is all</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [90528e4694](https://github.com/underscorediscovery/luxe/commit/90528e469491944ab6437063ee60d126119037c3)   
author: underscorediscovery   
date: Fri Jun 06 2014 18:21:57 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Html5; fixing macro causing build failure</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [cafb7e3807](https://github.com/underscorediscovery/luxe/commit/cafb7e380714811ca0717090c3c4285dfb5fc122)   
author: underscorediscovery   
date: Fri Jun 06 2014 18:13:44 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Log; cleanup of logging elsewhere #92</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [5ed2ef5306](https://github.com/underscorediscovery/luxe/commit/5ed2ef5306a381d67f80875daaebfced8db4dacc)   
author: underscorediscovery   
date: Fri Jun 06 2014 17:53:30 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Log; added log spacing, context and cleaned up lots of logging. see first comment for more info</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [76f2d21483](https://github.com/underscorediscovery/luxe/commit/76f2d21483715ab1266d8994831ce031b1d092dd)   
author: underscorediscovery   
date: Fri Jun 06 2014 07:16:40 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Log; for #92 - adding central logging macro for encapsulating all logging, and strip log code entirely (no string allocs, no empty function calls) when log level is set accordingly. To set the log level add <haxeflag name="--macro" value="luxe.Log.level(1)"/> to your project file. 1 = info, 2 = debug, 3 = verbose (these values might be changed slightly as this change has not been migrated to the core in full yet)</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [54cc932ddb](https://github.com/underscorediscovery/luxe/commit/54cc932ddb8b55b4104ece67ebb19e2d6300b50d)   
author: underscorediscovery   
date: Fri Jun 06 2014 02:11:48 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Luxe; adding a build macro to get the latest git commit version of a build for the build version, like 1.0.0-alpha.1+effe61dc6a where the last bit is the master commit reference at the time of build</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [effe61dc6a](https://github.com/underscorediscovery/luxe/commit/effe61dc6af0ac3466b8eac641d2f36a9be8d936)   
author: underscorediscovery   
date: Fri Jun 06 2014 00:47:45 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; Update</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [443094a8c3](https://github.com/underscorediscovery/luxe/commit/443094a8c3ab7018baa5839f531d1f11de453285)   
author: underscorediscovery   
date: Fri Jun 06 2014 00:43:02 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Physics; Fixing debug draw breaking doc gen</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [b2ec5bc182](https://github.com/underscorediscovery/luxe/commit/b2ec5bc182c0b9dbe5526decede8098c28d6e5b4)   
author: underscorediscovery   
date: Fri Jun 06 2014 00:39:26 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; adding changes generator back separate from scriber</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [421e1a13bc](https://github.com/underscorediscovery/luxe/commit/421e1a13bcadd0fe070e2dd057cecee2cf1230cf)   
author: underscorediscovery   
date: Fri Jun 06 2014 00:24:39 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Core; Introducing versioning information for runtime (Luxe.version and Luxe.build). version holds the release, build holds release+build-meta</li><li>Defaults; all defaults (fonts, shaders, UI etc) are now external resources embedded at compile time by haxe.Resource (see include.xml). They are stored in luxe/defaults/ and phoenix/defaults by type</li><li>Debug; Adding a version in the debug console and top right in the debug window</li><li>Debug; tweaking layout slightly, this will need to all be redone nicely anyway</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [e3fd6aa9d1](https://github.com/underscorediscovery/luxe/commit/e3fd6aa9d1c94c55433b8c703c5bca5190e75073)   
author: underscorediscovery   
date: Thu Jun 05 2014 15:42:25 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Draw; texture - Adding uv options. This fixes #93. Other options are available via the returned geometry for now</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [5fcc07b64d](https://github.com/underscorediscovery/luxe/commit/5fcc07b64d65c899d4674f59d4ebb34eef2c56d9)   
author: underscorediscovery   
date: Thu Jun 05 2014 15:36:14 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Draw; adding Luxe.draw.texture({ pos, size, texture }) for drawing images using draw api. for #93</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [cf2bee4d55](https://github.com/underscorediscovery/luxe/commit/cf2bee4d551626a6926f4ea660223f5904e9af05)   
author: underscorediscovery   
date: Thu Jun 05 2014 15:06:14 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Geometry; more safe guard against "similar" geometry breaking the binary search tree</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [8c7dcfb4e6](https://github.com/underscorediscovery/luxe/commit/8c7dcfb4e6c9a72abf42c3944e26f9e04a9dbe30)   
author: underscorediscovery   
date: Thu Jun 05 2014 14:29:12 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>General; encapsulating all engine calls to Luxe.time instead of haxe.Timer.stamp() as this is not actually part of the haxe API and is an implementation detail of luxe (which will be replaced soon in lumen even)</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [c7c080add2](https://github.com/underscorediscovery/luxe/commit/c7c080add29330f33726d37f5e7ee79771d9d19e)   
author: underscorediscovery   
date: Thu Jun 05 2014 14:19:20 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>HTML5; for #95 - Removing noise slowing down console on browsers with low resolution timing like safari</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [670bb04957](https://github.com/underscorediscovery/luxe/commit/670bb049573628c81062c11aa88fd6009364ebf0)   
author: underscorediscovery   
date: Thu Jun 05 2014 13:54:35 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>HTML5; fixing bugs where equal timestamps from browser cause a crash. This patch is temporary and a new error will be opened for this problem. On browsers that support performance.now this will work as expected</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [57162fe8f3](https://github.com/underscorediscovery/luxe/commit/57162fe8f36e9238bb1c5ccf819fe969b9818ca4)   
author: underscorediscovery   
date: Thu Jun 05 2014 05:56:37 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Camera; moving away from projection options junk and adding .fov, .near, .far, .aspect to immediately reflect the changes</li><li>Camera; changing to cache all matrices until dirty, and fixing targetting look at code. fixes #82</li><li>FlyCamera; fixing transform code to match newest camera features, allowing follow to work alongside</li><li>Camera; newer transforms earlier fix #80</li><li>Tests; Three - adding = / - keys changing fov, press F to toggle follow the cube</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [488bee25c4](https://github.com/underscorediscovery/luxe/commit/488bee25c421f462767bdede6c2d436f745b15c9)   
author: underscorediscovery   
date: Thu Jun 05 2014 05:49:58 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Transform; cleaning up legacy commented code</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [34fd67cf13](https://github.com/underscorediscovery/luxe/commit/34fd67cf137e8942b2e0609ae44c414f608a7ae9)   
author: underscorediscovery   
date: Thu Jun 05 2014 05:49:20 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Matrix; make clearer left/right/up/down/backward/forward</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [8eda64eb77](https://github.com/underscorediscovery/luxe/commit/8eda64eb7711b0a0fbbf29d62f851bff79acd0f2)   
author: underscorediscovery   
date: Thu Jun 05 2014 05:27:15 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Matrix; fixing incorrect order of subtraction for the look at matrix</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [6804e72272](https://github.com/underscorediscovery/luxe/commit/6804e722724d47165e3954b421ea8214f6a91976)   
author: underscorediscovery   
date: Thu Jun 05 2014 01:23:55 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Test; making draw better looking</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [305b916aa4](https://github.com/underscorediscovery/luxe/commit/305b916aa4d6cc11225268903458f83b02072720)   
author: underscorediscovery   
date: Wed Jun 04 2014 23:56:08 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Transforms; fix #83 - making parents notify clean state, in turn making children dirty. Changing to listen* functions instead of singular listeners for events.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [64305cb481](https://github.com/underscorediscovery/luxe/commit/64305cb481c222cb5920421f19df47440145a2f6)   
author: underscorediscovery   
date: Wed Jun 04 2014 23:53:04 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Squads; fixing depth for bullets</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [3c05de008a](https://github.com/underscorediscovery/luxe/commit/3c05de008acaa054f64191c70b4665a818e70d50)   
author: underscorediscovery   
date: Wed Jun 04 2014 23:05:09 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tests; nape - updated to be clean and to match latest physics code</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [e9c5acf857](https://github.com/underscorediscovery/luxe/commit/e9c5acf857edff854b427718a0a118f20fc82e31)   
author: underscorediscovery   
date: Wed Jun 04 2014 23:04:47 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tests; three - added a key to add cubes, and updated to latest physics debug draw etc.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [bf6d64af4d](https://github.com/underscorediscovery/luxe/commit/bf6d64af4da1c8534ae36a22518b6b5453fc3f58)   
author: underscorediscovery   
date: Wed Jun 04 2014 23:04:12 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Physics; paused is now a setter/getter. Added gravity getter/setter. Added DebugDraw classes for nape and bullet to be generic, and they automatically handle it. Use Luxe.physics.nape.draw = false to not draw debug view.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [34e820920c](https://github.com/underscorediscovery/luxe/commit/34e820920c5c402c4ffa84eeb8bbd73c18edab74)   
author: underscorediscovery   
date: Wed Jun 04 2014 23:01:38 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Debug; more parts of the disabled debug view</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [95b9841063](https://github.com/underscorediscovery/luxe/commit/95b984106392e3e15d2cd561dafd3b97227ddede)   
author: underscorediscovery   
date: Wed Jun 04 2014 22:33:25 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Entity; improving logging format</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [70ca1d544d](https://github.com/underscorediscovery/luxe/commit/70ca1d544dd04a3a38896b2f5f34520dbd2cf1a8)   
author: underscorediscovery   
date: Wed Jun 04 2014 22:32:52 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Debug; console can be disabled entirely (including default font) with -Dno_debug_console . Note that this will change to match conformance for other luxe flags later, this was a temporary test.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [9b688a0097](https://github.com/underscorediscovery/luxe/commit/9b688a00975048d919f4d8762a34841a21f1e9e8)   
author: underscorediscovery   
date: Wed Jun 04 2014 22:31:57 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Scene; Fixing bug where entities were added to the scene twice by mistake! fixing naming of start/reset. Improving logging output a bit.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [bed5c478a2](https://github.com/underscorediscovery/luxe/commit/bed5c478a2531b897e4d4805085c71ae5ab4285b)   
author: underscorediscovery   
date: Wed Jun 04 2014 22:30:05 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>FlyCamera; adding shift for move faster</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [05921ed9f4](https://github.com/underscorediscovery/luxe/commit/05921ed9f4813cda26cc4ff164a17b1d1dcdb63b)   
author: underscorediscovery   
date: Wed Jun 04 2014 22:29:44 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Camera; fixing bugs in shake not being applied when position is changed by a subclass</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [e04b2f9bc8](https://github.com/underscorediscovery/luxe/commit/e04b2f9bc83d5a7ee0db8da3bd1e2a86702a774f)   
author: underscorediscovery   
date: Wed Jun 04 2014 17:34:58 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>General; Adding keep for Game and Core, which should hold reference to critical sections of luxe for -dce full, testing on some of the tests this brings the output size considerably down for html5, and should fix #91</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [087c456d18](https://github.com/underscorediscovery/luxe/commit/087c456d183d31c7c4209f338aabc31b5717d6f8)   
author: underscorediscovery   
date: Wed Jun 04 2014 17:32:07 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Templates; removing templates here in favour of lime templates for html5 builds (like cpp)</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [afda2b1b67](https://github.com/underscorediscovery/luxe/commit/afda2b1b675a9d21f1cec5f336662246ac7a9d95)   
author: underscorediscovery   
date: Wed Jun 04 2014 16:00:03 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Utils; Geometry; forgot comments mid sentence</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [e84219af48](https://github.com/underscorediscovery/luxe/commit/e84219af485b5ab3cc70069d45d041d60eef35a7)   
author: underscorediscovery   
date: Wed Jun 04 2014 15:21:58 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Utils; Changing point_in_geometry to include transform</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [a193d6f4a6](https://github.com/underscorediscovery/luxe/commit/a193d6f4a66059902efe4f15ea26dde9bdee1896)   
author: underscorediscovery   
date: Wed Jun 04 2014 14:28:14 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Utils; adding point_in_geometry helper for assumption based point in poly check</li><li>Tests; Nape; fixing sample rendering to match newer geometry types. Now it draws with one draw call for the debug viewer</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [d62cfdd424](https://github.com/underscorediscovery/luxe/commit/d62cfdd424dbb180acb87ab9be78eeed64353e34)   
author: underscorediscovery   
date: Wed Jun 04 2014 05:23:20 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Geometry; fixing inconsistency with type vs primitive_type on geometry options</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [028a46ef54](https://github.com/underscorediscovery/luxe/commit/028a46ef54858ffab37d8de62820067b8940a1aa)   
author: underscorediscovery   
date: Wed Jun 04 2014 05:14:49 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Geometry; options are not required</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [487ed33271](https://github.com/underscorediscovery/luxe/commit/487ed33271af7eea3163d7ef4dde8c90a11e4940)   
author: underscorediscovery   
date: Wed Jun 04 2014 04:45:52 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Debug; fixing values for visible count and moving the lists around for textures going out of view temporarily</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [73b984bc47](https://github.com/underscorediscovery/luxe/commit/73b984bc47d7571b6c59d33559c4b415d0461ee6)   
author: underscorediscovery   
date: Wed Jun 04 2014 04:27:43 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Geometry; Ring, Circle, Arc, Rectangle - switching to batchable geometry types for these. ngons will still need to be swapped out</li><li>Vertex; TextureCoordSet; adding clone functions</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [fd912b28dc](https://github.com/underscorediscovery/luxe/commit/fd912b28dc5e787a9b6e271d6c5056dc005589c8)   
author: underscorediscovery   
date: Wed Jun 04 2014 01:55:28 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Geometry; Lines by default are now GL.LINES and are batched as expected. Significant performance increase for drawing them now obviously. fixes #85</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [f48fefca84](https://github.com/underscorediscovery/luxe/commit/f48fefca8415ddcbb47512c86d7fa4744e445c36)   
author: underscorediscovery   
date: Tue Jun 03 2014 21:48:55 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Texture; adding build submission, needs testing but fixes #88</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [a609ee5c8b](https://github.com/underscorediscovery/luxe/commit/a609ee5c8ba21478c4e4c04198eb629f57dad872)   
author: underscorediscovery   
date: Tue Jun 03 2014 18:39:23 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Cleanup; Updating todo consistency across the code base. :todo: == higher priority, :todo:#00: is a github issue number, and :todo : <- with a space is lower priority</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [3a14e92680](https://github.com/underscorediscovery/luxe/commit/3a14e92680dcc9946854fba5491916ee97e3a061)   
author: underscorediscovery   
date: Tue Jun 03 2014 18:16:35 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Vertex; changing order of new arguments to make more sense by usage</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [0562e5761b](https://github.com/underscorediscovery/luxe/commit/0562e5761b996d1e7410c791e6318f3a478f150e)   
author: underscorediscovery   
date: Tue Jun 03 2014 17:45:34 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tests; more read me formatting YEP</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [2e319152e1](https://github.com/underscorediscovery/luxe/commit/2e319152e1dd85721ff8dc1201e7d6e6b5970571)   
author: underscorediscovery   
date: Tue Jun 03 2014 17:43:42 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tests; MOAR MOARDAHGLJH</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [3dd8e942e6](https://github.com/underscorediscovery/luxe/commit/3dd8e942e600827fd7809754c1ab613578a3c217)   
author: underscorediscovery   
date: Tue Jun 03 2014 17:42:32 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tests; MOAR format fixes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [0b4b22ad92](https://github.com/underscorediscovery/luxe/commit/0b4b22ad92b8e4a8daefc2666fb7d99a475186db)   
author: underscorediscovery   
date: Tue Jun 03 2014 17:41:39 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tests; fixing formatting</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [71c2a278cb](https://github.com/underscorediscovery/luxe/commit/71c2a278cb135d1c8f3c0e52706993105b778f30)   
author: underscorediscovery   
date: Tue Jun 03 2014 17:38:28 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tests; Sorting tests according to their state and adding a read me about what the deal is</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [2da3de0b53](https://github.com/underscorediscovery/luxe/commit/2da3de0b535404b506b96420b6c82bad7051b012)   
author: underscorediscovery   
date: Tue Jun 03 2014 17:23:12 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Camera; projectVector / unprojectVector -> project/unproject</li><li>Camera; cleanup of matrices float32arrays being cached for #82</li><li>Camera; shared view matrix code for #82</li><li>Camera; cached inverse matrices for #82</li><li>Camera; default states and options for cull/depth test - fixes #87</li><li>Camera; assumptions about ortho are removed now - fixes #81</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [bbcaa20f9b](https://github.com/underscorediscovery/luxe/commit/bbcaa20f9bf9b0a531d9636f464459fc391dca67)   
author: underscorediscovery   
date: Tue Jun 03 2014 15:23:00 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>::MASSIVE REFACTOR:: possibly breaking changes, read the first comment on this commit description and info!</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [25a439f3f1](https://github.com/underscorediscovery/luxe/commit/25a439f3f134de60d05f125af80d3109c20dea88)   
author: underscorediscovery   
date: Tue Jun 03 2014 15:20:52 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Merge branch 'transforms'</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [da8e9d7ec0](https://github.com/underscorediscovery/luxe/commit/da8e9d7ec00ab791c39a6d6f4b650986c9a046dc)   
author: Kristian Brodal   
date: Tue Jun 03 2014 10:14:00 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tools; Now possible to close the polygon. Does not store closed state in save at the moment.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [208c079833](https://github.com/underscorediscovery/luxe/commit/208c079833eaec02ce6c605e3cdd3a1ada928fe0)   
author: Kristian Brodal   
date: Tue Jun 03 2014 08:46:42 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tools; Added texture pivot for all 8 directions of the texture quad and center.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [459230ac0c](https://github.com/underscorediscovery/luxe/commit/459230ac0c999fd8efc3aee42b0927b2ed963eb1)   
author: underscorediscovery   
date: Tue Jun 03 2014 05:40:12 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tools; polygon tool - added simple grid + position to display, added load+save fixes, added some safety, and cleanup,</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [a58f2f885b](https://github.com/underscorediscovery/luxe/commit/a58f2f885bbdfa14f50e0aec94053092d6e1a427)   
author: underscorediscovery   
date: Tue Jun 03 2014 05:37:58 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tools; adding simple save/load helper functions, exposing script, and missing mouse wheel callbacks. adding simple message display on toolbar for now . defaulting to refresh plugins + select plugin 0 if any for convenience</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [c6590be213](https://github.com/underscorediscovery/luxe/commit/c6590be213b099b3867f4a18951784b47f4c5616)   
author: underscorediscovery   
date: Tue Jun 03 2014 05:34:43 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Transforms refactoring continues, everything appears to be working correctly now \o/ full commit log will go in with the merge to master once all tests have been (made) and run against the new code</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [3289d01018](https://github.com/underscorediscovery/luxe/commit/3289d01018886ed0bd295d4d73a9fa9dd09ce9a9)   
author: underscorediscovery   
date: Tue Jun 03 2014 00:19:45 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Core; making it so that mouse values aren't cached causing user code to require .clone() to avoid references being clung to</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [dc6b9a7f13](https://github.com/underscorediscovery/luxe/commit/dc6b9a7f1315c6b761d5cc029b81e8333406587c)   
author: underscorediscovery   
date: Tue Jun 03 2014 00:19:13 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Transforms; finally working for camera + geometry as a whole</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [85508cc1d8](https://github.com/underscorediscovery/luxe/commit/85508cc1d838eae18fab7bbbd9b2b7678ed84c5b)   
author: Kristian Brodal   
date: Mon Jun 02 2014 17:01:44 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tools; Vert positions now relative to loaded texture position.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [0019c04a34](https://github.com/underscorediscovery/luxe/commit/0019c04a34c23dd3be16fbd6351d02f82336b691)   
author: underscorediscovery   
date: Mon Jun 02 2014 16:53:51 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Transforms; Updating to latest code, camera transforms are working as expected using the new transform origin value for their centre but geometry is broken using this transform class, so still investigating the best way forward</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [6d2b2e3814](https://github.com/underscorediscovery/luxe/commit/6d2b2e381474fdb94579663a5ce3880dd307aa75)   
author: Kristian Brodal   
date: Sun Jun 01 2014 20:05:03 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tools; Added save to file functionality.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [1ce5a4a50d](https://github.com/underscorediscovery/luxe/commit/1ce5a4a50db392c24170525bcb8252d09bcd88c5)   
author: Kristian Brodal   
date: Sun Jun 01 2014 16:44:00 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tools; Tried serializing polygon data to JSON. Not working as expected.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [9b7d9453b8](https://github.com/underscorediscovery/luxe/commit/9b7d9453b8270e4435118d220a39d4a8e84478cc)   
author: Kristian Brodal   
date: Sat May 31 2014 22:19:33 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tools; Added loading texture to polygon tool.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [2ecda687c9](https://github.com/underscorediscovery/luxe/commit/2ecda687c98b2f497159f5664dcc166e01b95cc0)   
author: underscorediscovery   
date: Sat May 31 2014 20:06:17 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tests; updating to match latest transform code</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [60fb425132](https://github.com/underscorediscovery/luxe/commit/60fb4251326a76c23704bc10499da51d6baeaeeb)   
author: underscorediscovery   
date: Sat May 31 2014 20:02:56 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Transforms; Complete redo of new transform stack to make more sense with some unit tests (see first comment for current test output)</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [707bd3f421](https://github.com/underscorediscovery/luxe/commit/707bd3f421bc880bd16ad70eca8e470f28f4fe4e)   
author: underscorediscovery   
date: Sat May 31 2014 14:19:42 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Utils; Making relative path a tad more useful on windows</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [9085b90dc3](https://github.com/underscorediscovery/luxe/commit/9085b90dc3af134d3370d6174daa0ff7cf0c206d)   
author: underscorediscovery   
date: Sat May 31 2014 14:15:12 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Utils; Making relative path a tad more useful on windows</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [8dd0c01149](https://github.com/underscorediscovery/luxe/commit/8dd0c01149002e3a2038dd333923fb4fb3057eab)   
author: underscorediscovery   
date: Sat May 31 2014 12:09:57 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tools; switching to haxe style error messages on hscript compiler error</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [a7f9498b1a](https://github.com/underscorediscovery/luxe/commit/a7f9498b1a1d6f6b691d09ae0e2a4543d0d58524)   
author: underscorediscovery   
date: Sat May 31 2014 12:09:38 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Revert "Tools; switching to haxe style error messages on hscript compiler error"</li><li>This reverts commit b05add89012304ed791f3de5ed84eca3b7e8bf1b.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [c849731ed9](https://github.com/underscorediscovery/luxe/commit/c849731ed95bd99d33b90a7a9074795bb744769c)   
author: underscorediscovery   
date: Sat May 31 2014 12:09:10 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tools; switching to haxe style error messages on hscript compiler error</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [04c4b3d9bf](https://github.com/underscorediscovery/luxe/commit/04c4b3d9bf83a0396d58a39dc00cfdd0f6a9f693)   
author: underscorediscovery   
date: Sat May 31 2014 12:07:16 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tools; updating to include a newer more verbose version of hscript for error messages</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [966518e8e4](https://github.com/underscorediscovery/luxe/commit/966518e8e4c1535947bb91ae9d777bf7374da331)   
author: Kristian Brodal   
date: Sat May 31 2014 11:19:11 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tools; Added placing, moving and removing of polygon verts.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [002e3c707e](https://github.com/underscorediscovery/luxe/commit/002e3c707eca639463be146f89ce45e74628d6fd)   
author: Kristian Brodal   
date: Fri May 30 2014 20:21:11 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Merge branch 'master' of https://github.com/underscorediscovery/luxe</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [0f6b66d4ac](https://github.com/underscorediscovery/luxe/commit/0f6b66d4ac35b39a90aab6a2f2aa6ff6d1cf0985)   
author: Kristian Brodal   
date: Fri May 30 2014 20:20:58 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tools; Possible to place vertices in polygon tool now. Still needs a lot of more work.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [50c69adb06](https://github.com/underscorediscovery/luxe/commit/50c69adb06d22815dd3246deef5d13e993afd83b)   
author: underscorediscovery   
date: Fri May 30 2014 18:02:07 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Utils; adding path_is_relative</li><li>Texture; adding ability to load absolute paths</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [4cd3fed54a](https://github.com/underscorediscovery/luxe/commit/4cd3fed54a831aeae584f53c176cadba76e52456)   
author: Kristian Brodal   
date: Fri May 30 2014 16:59:05 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tools; Added on_update() for plugins. Started working on polygon tool.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [09635a8f99](https://github.com/underscorediscovery/luxe/commit/09635a8f99b41ceb0a55873e9e5cc9ea71f6bc57)   
author: underscorediscovery   
date: Fri May 30 2014 13:17:35 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tools; readding missing folder</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [cfefbaa6f2](https://github.com/underscorediscovery/luxe/commit/cfefbaa6f28e89d774d544e84f3d5dd027feea4e)   
author: underscorediscovery   
date: Fri May 30 2014 13:16:57 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>fixing duplicate folders</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [ca83a8d175](https://github.com/underscorediscovery/luxe/commit/ca83a8d17590d20a3f1e6768cb50be53321e255c)   
author: underscorediscovery   
date: Fri May 30 2014 11:51:34 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Merge branch 'master' into transforms</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [b19fe29e86](https://github.com/underscorediscovery/luxe/commit/b19fe29e86bf70b113848c1d67af152cd92d3dcc)   
author: underscorediscovery   
date: Fri May 30 2014 11:50:38 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tools; minor tweaks, committing so i can swap branches</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [f19e358778](https://github.com/underscorediscovery/luxe/commit/f19e358778cd167549502fb44efe584bd9fe531a)   
author: underscorediscovery   
date: Thu May 29 2014 16:57:38 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tools; more testing</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [16112d6cc1](https://github.com/underscorediscovery/luxe/commit/16112d6cc1a53283f56238cd4b8485a72c0010cf)   
author: underscorediscovery   
date: Thu May 29 2014 11:34:08 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tests; updating texture packer to use JSON loader</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [dc194d3b7d](https://github.com/underscorediscovery/luxe/commit/dc194d3b7d01cac5ca9631a9938214a05b6708b5)   
author: underscorediscovery   
date: Thu May 29 2014 11:33:18 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>API; adding loadJSON helper for quicker loading of JSON</li><li>Resource; Adding JSON type</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [b03c84d8ba](https://github.com/underscorediscovery/luxe/commit/b03c84d8bad4c877474561b715ee00ad4b0918da)   
author: underscorediscovery   
date: Thu May 29 2014 11:26:42 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tools; started work on generic scripted tool interface</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [069667887e](https://github.com/underscorediscovery/luxe/commit/069667887eeb3a39750a8b93242d6fe80c825a09)   
author: underscorediscovery   
date: Thu May 29 2014 11:25:54 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>TexturePacker; adding uv, size and origin values to the Frames, and making helpers for getting the information about a specific frame from the data</li><li>var data : TexturePackerData = TexturePackerJSON.parse( json_source );</li><li>var sprite = new Sprite({</li><li>                name : “idle”,</li><li>                texture : texture,</li><li>                pos : Luxe.screen.mid,</li><li>                origin : data.frame('player_2_up_idle').origin,</li><li>                size : data.frame('player_2_up_idle').size,</li><li>                uv : data.frame('player_2_up_idle').uv</li><li>            });</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [1e12344d72](https://github.com/underscorediscovery/luxe/commit/1e12344d7294c28c61e82c3c108f44ba501ecf09)   
author: underscorediscovery   
date: Thu May 29 2014 10:58:16 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>TexturePacker; fixing naming for parse_by_name</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [0f5fb6df64](https://github.com/underscorediscovery/luxe/commit/0f5fb6df646c68c73b4087b0deaca3f2dc0f5f03)   
author: underscorediscovery   
date: Thu May 29 2014 10:38:59 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>TexturePacker; allowing import by named animations for splitting up animations easily</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [a3b5b155ad](https://github.com/underscorediscovery/luxe/commit/a3b5b155adca6c08683eeb672a6b1ec2fdf77b82)   
author: underscorediscovery   
date: Thu May 29 2014 10:38:33 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Utils; fixing naming convention on arrayToBytes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [89345e255e](https://github.com/underscorediscovery/luxe/commit/89345e255ea82a5ee3e7e3499c9273ab7706a0e8)   
author: underscorediscovery   
date: Wed May 28 2014 07:10:38 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Cleaning up messy tools code for starting a proper base line for tools</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [0c8a99f8d4](https://github.com/underscorediscovery/luxe/commit/0c8a99f8d4a0b13b52602b73c874f62d414b417c)   
author: underscorediscovery   
date: Tue May 27 2014 09:02:08 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>update build for latest MI and making it not crash on everything</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [7c135a6932](https://github.com/underscorediscovery/luxe/commit/7c135a69326a49cc1718fcd29fab2f9b08a06c3f)   
author: underscorediscovery   
date: Tue May 27 2014 07:42:35 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>adding doc updates and generator flags</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [02f2108576](https://github.com/underscorediscovery/luxe/commit/02f21085761f435568b528bd8e81bc668480cc34)   
author: underscorediscovery   
date: Tue May 27 2014 07:42:22 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>fixing doc generation and updating docs for latest code</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [b38b8fb3ce](https://github.com/underscorediscovery/luxe/commit/b38b8fb3ce17befaafcd133bff3be483be1f8fd1)   
author: underscorediscovery   
date: Thu May 22 2014 12:16:49 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Updating docs to latest scribe+documentation generation versions</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [ce3c15f03e](https://github.com/underscorediscovery/luxe/commit/ce3c15f03e558b6a93e5584119b6d525e17b8fc4)   
author: underscorediscovery   
date: Thu May 22 2014 09:24:05 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>updating docs</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [c820e5c36c](https://github.com/underscorediscovery/luxe/commit/c820e5c36cf4bad10e5cdab4d809855d40508db1)   
author: underscorediscovery   
date: Thu May 22 2014 08:39:18 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>updating docs with newer documentation features</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [b32098fb98](https://github.com/underscorediscovery/luxe/commit/b32098fb9821c88bf41f1503b968176e669947cd)   
author: underscorediscovery   
date: Thu May 22 2014 01:18:58 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>updating docs</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [148e3b5cbe](https://github.com/underscorediscovery/luxe/commit/148e3b5cbef35ba0d0963b842f4c22abb8af9b67)   
author: underscorediscovery   
date: Thu May 22 2014 01:17:11 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>hiding private classes in generator</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [f795b705c1](https://github.com/underscorediscovery/luxe/commit/f795b705c1237beb5ee9cfbea9256b70e0097422)   
author: underscorediscovery   
date: Thu May 22 2014 00:46:29 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>embedding highlight.js with haxe support so that there is no dependence on pygments</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [0b80cfa09d](https://github.com/underscorediscovery/luxe/commit/0b80cfa09d03cd78469db021a1e68b4adff8b656)   
author: underscorediscovery   
date: Wed May 21 2014 23:11:06 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Continued documentation fixes and updates</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [156a93566d](https://github.com/underscorediscovery/luxe/commit/156a93566d5b90afb6818493b566b33359272ff5)   
author: underscorediscovery   
date: Wed May 21 2014 22:49:58 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>adding samples back to the doc builds</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [59588c57da](https://github.com/underscorediscovery/luxe/commit/59588c57dad37fd3d380400583fadb661298e07d)   
author: underscorediscovery   
date: Wed May 21 2014 22:49:37 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>adding samples back to the doc builds</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [e7251da526](https://github.com/underscorediscovery/luxe/commit/e7251da5268f099b093e7481f7ac6dc329e23b66)   
author: underscorediscovery   
date: Wed May 21 2014 22:36:41 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; updating docs</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [c5750eb937](https://github.com/underscorediscovery/luxe/commit/c5750eb937da1163c77d4c347f9320849e6d7990)   
author: underscorediscovery   
date: Wed May 21 2014 22:34:07 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Cleaning up and adding new cleaner documentation implementation</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [cdff1ea180](https://github.com/underscorediscovery/luxe/commit/cdff1ea180700ac812cb61348839679874874671)   
author: underscorediscovery   
date: Wed May 21 2014 22:30:55 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>tidy</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [654af26c50](https://github.com/underscorediscovery/luxe/commit/654af26c5085d483ad67a60f21ae1163291fc654)   
author: underscorediscovery   
date: Wed May 21 2014 22:30:55 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>cleanup rogue spacing</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [9df7db810e](https://github.com/underscorediscovery/luxe/commit/9df7db810e333f6db9735aabce6135307dc8c2d5)   
author: underscorediscovery   
date: Tue May 13 2014 16:25:54 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>fixing compile errors on windows for html5...somehow.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [bda3ec7822](https://github.com/underscorediscovery/luxe/commit/bda3ec7822ac32f2a72c841feaa71a44f8e0e99d)   
author: underscorediscovery   
date: Wed Apr 30 2014 09:11:54 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Batcher; increasing base vert count from 16k to 65k</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [9b4aea448a](https://github.com/underscorediscovery/luxe/commit/9b4aea448ad062d4e6f44afad950fc5cceb73f56)   
author: underscorediscovery   
date: Wed Apr 30 2014 09:11:19 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Starting work again on latest master version of transforms</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [07249845e1](https://github.com/underscorediscovery/luxe/commit/07249845e15ba8a044f6c19976394bb10f79aabe)   
author: underscorediscovery   
date: Wed Apr 30 2014 09:11:19 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>SpriteAnimation; fixing bugs with image frame animations</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [4567d36962](https://github.com/underscorediscovery/luxe/commit/4567d3696261d589ec08d9ee2efff25aad3cbedf)   
author: underscorediscovery   
date: Tue Apr 29 2014 00:05:36 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>SpriteAnimation; fixing bugs with image frame animations</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [e866d02a10](https://github.com/underscorediscovery/luxe/commit/e866d02a1082317799e67f2a9bcd579e64a749b2)   
author: underscorediscovery   
date: Sat Apr 26 2014 02:04:00 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>testing branch</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [b17e1b13c4](https://github.com/underscorediscovery/luxe/commit/b17e1b13c4977d8547dcd86d5f632203bc93d9a0)   
author: underscorediscovery   
date: Sat Apr 26 2014 01:53:39 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tests; Adding new test for transforms but this isn't usable yet</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [3943ba457d](https://github.com/underscorediscovery/luxe/commit/3943ba457d770ac2b02d40b371934f28910274fb)   
author: underscorediscovery   
date: Sat Apr 12 2014 22:09:14 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>DebugView; Hid the wrong thing by default for now</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [43907bab0d](https://github.com/underscorediscovery/luxe/commit/43907bab0d704652261feb6d9554714b5f36ed9e)   
author: underscorediscovery   
date: Sat Apr 12 2014 22:09:00 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; update changes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [2b7162fbfa](https://github.com/underscorediscovery/luxe/commit/2b7162fbfa4e737fbfdce90220bfd229b8c0dbe3)   
author: underscorediscovery   
date: Sat Apr 12 2014 22:04:42 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>::: POTENTIALLY BREAKING/CONFUSING CHANGE :::</li><li>TL;DR; any use of "enabled" -> "visible" (unless on a Batcher, batcher.enabled is correct, geometry.enabled is not)</li><li>Any use of "enabled" on geometry or text etc anywhere has been changed to "visible". The context in which it was used was visibility, Batcher uses it correctly where processing is ignored on disabled batchers. Any visibility related flags and values have been made consistent across the board. Sorry if this causes some minor code changes but it's unavoidable pre 1.0 :> Search your code for "enabled" and if you see any that aren't your own or on a batcher it's likely meant to be .visible instead.</li><li>General; part of #77, cleanup enabled -> visible</li><li>Matrix4; decompose was using an Array<Dynamic> as a return, now typed and proper, added "getPosition" as a convenience but this is inconsistent a bit still.. still deciding on this file.</li><li>BBST; left/right default to null for dynamic platforms that don't populate this for clarity/debugging</li><li>DebugView; profiler now has "offsets" that allow you to ignore profiles in other profiles. For example, the core.render loop includes the very debug view showing you that, which, when expensive, is masking the game rendering profile quite badly causing it to seem way worse. This basically says core.render is core.render - debugview. Profiler view also now has hidden views, that will track but not draw (like when tracking portions of the render stage that aren't relevant to the game, like debug views).</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [13cd106461](https://github.com/underscorediscovery/luxe/commit/13cd106461fb9eff92e4fce56ae86b87140bfb90)   
author: underscorediscovery   
date: Sat Apr 12 2014 04:09:19 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Physics; nape; found the units in the docs, noting it here</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [e0c18edfb7](https://github.com/underscorediscovery/luxe/commit/e0c18edfb75d493ea5cc4f2a9dd953288895950d)   
author: underscorediscovery   
date: Sat Apr 12 2014 04:07:32 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Physics; nape test, adding 4 walls, mouse drag joint, reset key (R), jump</li><li>Physics; nape; exposing iteration flags and setting default gravity to</li><li>980 (not sure what units this is)</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [fc93f8b657](https://github.com/underscorediscovery/luxe/commit/fc93f8b657e4b72b579fd4b574450be27351935b)   
author: underscorediscovery   
date: Sat Apr 12 2014 00:58:14 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; update changes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [1bdfada008](https://github.com/underscorediscovery/luxe/commit/1bdfada008cbab4263c6c006f1b4b80517a9896c)   
author: underscorediscovery   
date: Sat Apr 12 2014 00:35:33 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fonts; cleaning up filtering for minification, and solving webgl/ES complaining about invalid mag filter (doesn't support mipmaps on mag! http://stackoverflow.com/a/12318929/305975)</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [fdc2ef5429](https://github.com/underscorediscovery/luxe/commit/fdc2ef5429940e4741786ea9719585e2fef13492)   
author: underscorediscovery   
date: Sat Apr 12 2014 00:34:19 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Physics; Nape; Adding custom debug draw, wip, and making demo interactive (press left/right arrow)</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [b99d597d99](https://github.com/underscorediscovery/luxe/commit/b99d597d99aeef98bd0806f3d47bb688e2239fc0)   
author: underscorediscovery   
date: Fri Apr 11 2014 18:42:43 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Physics; Adding prelim Nape support, working ok but no visual connection yet</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [e26036ff04](https://github.com/underscorediscovery/luxe/commit/e26036ff04c6ef9f9c86e5e08ac634762a057e88)   
author: underscorediscovery   
date: Fri Apr 11 2014 17:58:19 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Physics; not sure why this is saying it isn't committed...</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [476d77b905](https://github.com/underscorediscovery/luxe/commit/476d77b905127d1cfccbf95e29cbbebbe4900d2f)   
author: underscorediscovery   
date: Fri Apr 11 2014 17:57:55 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Physics; cleanup and adding multiple engine bindings for #67</li><li>Added ramping to three/ demo (press E to ramp time)</li><li>Added a multi physics handler that will facilitate using any or all 3</li><li>of the physics engines together (they will not interact, obviously).</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [7eecd7ec94](https://github.com/underscorediscovery/luxe/commit/7eecd7ec94675f7d08aec014862cd065c52e16b6)   
author: underscorediscovery   
date: Fri Apr 11 2014 15:06:34 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>General; continued cleanup for #77</li><li>Nineslice options typed</li><li>Particle emitter templates typed</li><li>Tilemap visual options typed</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [900afb02e4](https://github.com/underscorediscovery/luxe/commit/900afb02e48d46c954d1da3676a693ffccd9109d)   
author: underscorediscovery   
date: Fri Apr 11 2014 14:23:29 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>General; continue on #77</li><li>Removed Rigidbody Dynamic construct info</li><li>Debug inspector options typed</li><li>Stats debug view values typed</li><li>Input Gamepad events typed</li><li>ColorOptions added for colour tweens</li><li>BitmapFont pages info typed</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [925dcf5c6d](https://github.com/underscorediscovery/luxe/commit/925dcf5c6d7a9e6e8f46f9352ca41eaa2d68e679)   
author: underscorediscovery   
date: Fri Apr 11 2014 13:53:47 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>General; continued cleanup for #77</li><li>Batcher shader uniforms, shader class types and locations, render state</li><li>flags typed</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [a08510c7e7](https://github.com/underscorediscovery/luxe/commit/a08510c7e7e757e0fd5b873b5119378afab82af1)   
author: underscorediscovery   
date: Fri Apr 11 2014 12:46:31 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>fixing extra flag</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [562ec6de13](https://github.com/underscorediscovery/luxe/commit/562ec6de1303d454d0ee696660699ab1eae2043c)   
author: underscorediscovery   
date: Fri Apr 11 2014 05:51:18 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; updating changes, previous commit related to #77</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [c80bea9db0](https://github.com/underscorediscovery/luxe/commit/c80bea9db03fd6c48f2e9268416cf06eb0621145)   
author: underscorediscovery   
date: Fri Apr 11 2014 05:50:01 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Input; add typed, removing dynamic</li><li>Texture; general cleanup and fixing get/set pixel types (255 vs 1.0 color types) and dynamic usage</li><li>Camera; removing dynamics and adding CameraOptions</li><li>Components; get is now typed, and get_any is added, for the array type results</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [aa2728801a](https://github.com/underscorediscovery/luxe/commit/aa2728801ac3c16b40237a2a93c5e190cc82b40c)   
author: underscorediscovery   
date: Fri Apr 11 2014 02:59:42 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Batcher; Geometry; Adding missing lines primitive (lol)</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [93537b2ecb](https://github.com/underscorediscovery/luxe/commit/93537b2ecb38df11a574f2a13a5a2fb4f5cf7ffd)   
author: underscorediscovery   
date: Thu Apr 10 2014 18:39:22 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Obj; readying importer for more than triangulated faces</li><li>Tests; fixing 3d tests requiring depth-buffer</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [98f414ba66](https://github.com/underscorediscovery/luxe/commit/98f414ba661696f07ac12cf211be578da1c6a9aa)   
author: underscorediscovery   
date: Thu Apr 10 2014 14:04:34 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; update changes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [a504f1f581](https://github.com/underscorediscovery/luxe/commit/a504f1f5810c8627a60be9e15aa8b375108acffd)   
author: underscorediscovery   
date: Thu Apr 10 2014 14:04:09 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>OBJ : Making parser more robust, where new lines or empty elements caused breakdown</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [68f9c309fa](https://github.com/underscorediscovery/luxe/commit/68f9c309fade5c1e9ee0ea30060815f59e428780)   
author: underscorediscovery   
date: Thu Apr 10 2014 05:39:44 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>General; continued cleanup for #77</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [3cfc2437c0](https://github.com/underscorediscovery/luxe/commit/3cfc2437c0f8c889930b57e475f8cc8d8b35e567)   
author: underscorediscovery   
date: Thu Apr 10 2014 05:12:25 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>General; continued cleanup for #77</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [1e5939a763](https://github.com/underscorediscovery/luxe/commit/1e5939a763d8e46bb61ae823646c7b8e72cd0e1a)   
author: underscorediscovery   
date: Thu Apr 10 2014 02:52:27 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>General; cleanup for #77, removing Dynamic in favour of typing things</li><li>Input; InputEvent now includes name and an InputState.up/down flag for checking those things on generic handlers, like squads did</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [6d0fe6eaed](https://github.com/underscorediscovery/luxe/commit/6d0fe6eaedc8b027e404a4485b93d5614b8de09c)   
author: underscorediscovery   
date: Thu Apr 10 2014 02:04:10 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Debug; fixing debug window showing dt as - using a separator</li><li>Text; fixing text default visibility not being respected, solves debug views overlapping</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [704c7ce19b](https://github.com/underscorediscovery/luxe/commit/704c7ce19b3988e221b10c4253ee2df449aafd59)   
author: underscorediscovery   
date: Thu Apr 10 2014 01:25:58 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>General; cleaning up code and starting with consistency passes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [5059df5b38](https://github.com/underscorediscovery/luxe/commit/5059df5b38488d44c7903c89ef746b1c9d3fdf2d)   
author: underscorediscovery   
date: Wed Apr 09 2014 23:14:01 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Merge branch 'master' of https://github.com/underscorediscovery/luxe</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [ae515c3864](https://github.com/underscorediscovery/luxe/commit/ae515c386447605b59f9fcc2ee8eb9243f3e0b29)   
author: underscorediscovery   
date: Wed Apr 09 2014 23:09:32 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Revert "BitmapFont; fixing failing to load fonts on windows, due to different new lines. Handling it with StringTools ensures cross platform"</li><li>This reverts commit d7d2a317f45567aacdab573d03662ea49e0e5f62.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [b10754dda2](https://github.com/underscorediscovery/luxe/commit/b10754dda25911c629d2c094ec035396972ec23b)   
author: underscorediscovery   
date: Wed Apr 09 2014 20:24:03 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Debug; removing batcher debug view, it's slow and not used for end users right now</li><li>SuitStory; updating tilt shift with explanations and info</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [2db49d951d](https://github.com/underscorediscovery/luxe/commit/2db49d951db9c24a8013dbe4ce038b8ba01347fa)   
author: underscorediscovery   
date: Wed Apr 09 2014 17:30:22 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; update changes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [d196fbcde1](https://github.com/underscorediscovery/luxe/commit/d196fbcde1297a054f4cbc1a69c2defc1f87edb5)   
author: underscorediscovery   
date: Wed Apr 09 2014 17:29:57 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Debug; fixing potential crash on batcher debug view with no geometry</li><li>Debug; adding titles to each view using .name, so that blank views still show as switching</li><li>Debug; cleaning up old threading code for now, that was experimental</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [fb9607c423](https://github.com/underscorediscovery/luxe/commit/fb9607c423140e130e43635a9d373ed373f6b537)   
author: underscorediscovery   
date: Mon Apr 07 2014 13:25:53 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; setup guide has a typo</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [af5336709b](https://github.com/underscorediscovery/luxe/commit/af5336709b5c5d7d8fa7e77b534699602bd9fef8)   
author: underscorediscovery   
date: Mon Apr 07 2014 13:25:21 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Squads; removing old import</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [4ce49dece5](https://github.com/underscorediscovery/luxe/commit/4ce49dece5eb32ecde1c100cb2147faf4a38d02c)   
author: underscorediscovery   
date: Mon Apr 07 2014 13:24:48 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>obj; fixing parse error from exporters that add a rogue space at the end</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [2d16e82928](https://github.com/underscorediscovery/luxe/commit/2d16e82928c9cc3e68b1dc7266f4179fdf09a31d)   
author: underscorediscovery   
date: Wed Mar 12 2014 00:52:28 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; update changes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [07038b2866](https://github.com/underscorediscovery/luxe/commit/07038b2866470a06a180348e8fc637ad7c2e7726)   
author: underscorediscovery   
date: Wed Mar 12 2014 00:50:31 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tilemaps; adding refresh from edited tilemap  (changing tile.id will refresh the visual uv's)</li><li>Tilemaps; added remove_tile api as well as setting a tile to 0 id will remove it (geometry as well)</li><li>Tilemaps; geometry is only drawn when id != 0, so clearing id's drop geom and vice versa, non 0 creates geom</li><li>Tilemaps; closes #61, for 1.0</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [fe274972f7](https://github.com/underscorediscovery/luxe/commit/fe274972f7cda6986a45bba526a45feb0a4ecf03)   
author: underscorediscovery   
date: Wed Mar 12 2014 00:50:31 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; update changes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [4a5c5ca9b6](https://github.com/underscorediscovery/luxe/commit/4a5c5ca9b673c6036b08f36c23be0d2898bb07b8)   
author: Thomas Hourdel   
date: Mon Mar 10 2014 21:24:55 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Matrix4; fixed make2D</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [d1398a4d2b](https://github.com/underscorediscovery/luxe/commit/d1398a4d2b29368ad97a6b98f102daf10a23ce5e)   
author: Thomas Hourdel   
date: Mon Mar 10 2014 16:32:05 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Vector; added the missing euler orders in setEulerFromRotationMatrix and setEulerFromQuaternion</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [d44087fde1](https://github.com/underscorediscovery/luxe/commit/d44087fde1ebcf1c67da2297b0ffe6810853ef66)   
author: underscorediscovery   
date: Fri Feb 28 2014 13:50:56 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Rectangle; added overlap(_other:Rectangle) test helper, and general cleanup (fix #73)</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [5450369a99](https://github.com/underscorediscovery/luxe/commit/5450369a9914efaa2460eae64c3de1781c26a9e5)   
author: underscorediscovery   
date: Fri Feb 28 2014 13:38:12 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Collision; removing custom math classes from hxcollision legacy, fix #74</li><li>Collision; updated current code to use luxe Matrix and Vector</li><li>Collision; shape drawer has a color and immediate option</li><li>Tests; Collision; ported hxcollision test case over to luxe quick for testing</li><li>Vector; added lengthsq, angle2D, truncate and set_length</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [ce28165e3d](https://github.com/underscorediscovery/luxe/commit/ce28165e3d2ee9cad9a4771b9659c01436747e17)   
author: underscorediscovery   
date: Fri Feb 28 2014 12:11:41 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; update changes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [911945d161](https://github.com/underscorediscovery/luxe/commit/911945d161fdee8f3abab6c31185ac448407e570)   
author: underscorediscovery   
date: Fri Feb 28 2014 12:10:13 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Sprite; adding exact hit test `point_inside_exact` which is more costly than the AABB one but takes into account rotation, scale, size and origin . see `test_sprite` for an example</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [b5126f6d80](https://github.com/underscorediscovery/luxe/commit/b5126f6d802fe8633094fd28862e87f40bdf9ed9)   
author: underscorediscovery   
date: Fri Feb 28 2014 01:11:42 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Vector; added toDegrees and toRadians helpers</li><li>Quaternion; adding add and dot functions and cleanup</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [f27a009864](https://github.com/underscorediscovery/luxe/commit/f27a009864d0a2247bae1230c711740ae50a49c0)   
author: underscorediscovery   
date: Thu Feb 27 2014 11:39:54 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; update changes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [7999810bcf](https://github.com/underscorediscovery/luxe/commit/7999810bcf277690a7da1087af3f3e5afba280b8)   
author: underscorediscovery   
date: Thu Feb 27 2014 11:39:32 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; removing email from changes page for now</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [da48b8ad2e](https://github.com/underscorediscovery/luxe/commit/da48b8ad2e9a183cbf967754c048da9ffac17695)   
author: underscorediscovery   
date: Thu Feb 27 2014 11:39:13 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Quaternion; adding dot and scale functionality</li><li>Matrix4; adding M11 - M44 getter/setters for convenience accessing the elements directly</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [fc30c615f1](https://github.com/underscorediscovery/luxe/commit/fc30c615f12d43e9ef5991e90006d6f3480385d8)   
author: Thomas Hourdel   
date: Wed Feb 26 2014 20:00:33 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Matrix4; removing print function and adding toString so it can be traced</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [35d02263ab](https://github.com/underscorediscovery/luxe/commit/35d02263ab721d354ab51e6c77442cec837ce74d)   
author: Thomas Hourdel   
date: Wed Feb 26 2014 19:21:48 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Setup; fixing haxelib import order in the FlashDevelop template</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [5e0c8d7dc1](https://github.com/underscorediscovery/luxe/commit/5e0c8d7dc1762f23f412a97f854180a3f6a09121)   
author: underscorediscovery   
date: Wed Feb 26 2014 14:55:41 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Camera; applying name and no_scene options to the entity above it,</li><li>still need to optionize these as types</li><li>Scene; adding scene.entitycount value for testing how many entities in</li><li>the scene</li><li>Text; extending Text from Visual, so that it is an entity and can</li><li>accept components etc</li><li>Text; all internal text items given names and not added to the default</li><li>scene</li><li>CompositeGeometry; adding dirty flag to propogate to geometries inside</li><li>it</li><li>Tests; Text - added a text with a component, and added a custom font</li><li>for demonstration</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [e10f14c173](https://github.com/underscorediscovery/luxe/commit/e10f14c173a15081b7664bee7cee666d00da349e)   
author: underscorediscovery   
date: Tue Feb 25 2014 22:04:43 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; Update Changes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [8517330132](https://github.com/underscorediscovery/luxe/commit/8517330132b0c4b37ad308534ee9ea55cbfe4508)   
author: underscorediscovery   
date: Tue Feb 25 2014 22:04:14 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>structural: trying a remove that doesn't have a contains() check</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [b51a6e6ffb](https://github.com/underscorediscovery/luxe/commit/b51a6e6ffb7f7234af30fa8a247d1f582f43f8a5)   
author: underscorediscovery   
date: Tue Feb 25 2014 22:03:25 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Batcher; undoing change to dropped geometry not submitting due to not-removed geometry</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [b304ec81c8](https://github.com/underscorediscovery/luxe/commit/b304ec81c80e459e27a4902c4e860a36917c8aaa)   
author: underscorediscovery   
date: Tue Feb 25 2014 12:33:30 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Texture; Adding min/mag filter as separable</li><li>Texture; Adding filter types for mip linear/nearest</li><li>BitmapFont; defaulting to mipmaps and better filtering when scaling</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [4cbd28f466](https://github.com/underscorediscovery/luxe/commit/4cbd28f46617ec8255f2047e3e514163d26fd10a)   
author: underscorediscovery   
date: Mon Feb 24 2014 21:09:48 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>html5; fixing build error on weird type</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [2bd9587a18](https://github.com/underscorediscovery/luxe/commit/2bd9587a183b086df4d6a225876e087312979769)   
author: underscorediscovery   
date: Mon Feb 24 2014 13:34:04 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>BitmapFont; fixing windows new line bug in font loading. Using StringTools ensures cross platformnessness</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [182dfb6ab0](https://github.com/underscorediscovery/luxe/commit/182dfb6ab00943a2e3cd51d3b6a0b5bd1108de38)   
author: underscorediscovery   
date: Mon Feb 24 2014 13:31:26 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>BitmapFont; fixing failing to load fonts on windows, due to different new lines. Handling it with StringTools ensures cross platform</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [8656db0d4f](https://github.com/underscorediscovery/luxe/commit/8656db0d4fbf89340ebdaf2b27569f2e14ea4265)   
author: underscorediscovery   
date: Mon Feb 24 2014 12:16:49 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; latest</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [94b2be5484](https://github.com/underscorediscovery/luxe/commit/94b2be548488f198695dd08c36516f249d0764bc)   
author: underscorediscovery   
date: Mon Feb 24 2014 03:28:56 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Debug; more prelim batcher debug view</li><li>Batcher; more comprehensive sort comparisons, should cover all texture spreading bugs and crazy removal antics</li><li>Batcher; some messy debug stuff, but critical for confirming correctness</li><li>Batcher; NOTE if you were using groups, these temporarily have been removed and their features will be back shortly in better form</li><li>Entity; fixing plausible crash on _debug line again</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [f18089a6d5](https://github.com/underscorediscovery/luxe/commit/f18089a6d5d9245d0d75d724fda20993cc3a9d10)   
author: underscorediscovery   
date: Thu Feb 20 2014 15:48:07 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Entity; renaming inconsistent posLocal etc to pos_local etc</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [65a4c3c29f](https://github.com/underscorediscovery/luxe/commit/65a4c3c29f6f1cdde21335c88dadfd6592dbae94)   
author: underscorediscovery   
date: Thu Feb 20 2014 15:43:14 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Entity; fixing incorrect multiply type</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [c9bfee5e59](https://github.com/underscorediscovery/luxe/commit/c9bfee5e59126da576079c75ee5ed61fcde99243)   
author: underscorediscovery   
date: Thu Feb 20 2014 15:42:43 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Entity; renaming all relative vagary to "local", so posRelative becomes posLocal for example</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [d6c7b4c29a](https://github.com/underscorediscovery/luxe/commit/d6c7b4c29ae6e6456b1c4cc28f09ad7a7509e282)   
author: underscorediscovery   
date: Thu Feb 20 2014 15:40:35 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Entity; fixing dumb scale logic</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [dc3ab8878f](https://github.com/underscorediscovery/luxe/commit/dc3ab8878f96e050be6db13e81ecc2cef1f54fde)   
author: underscorediscovery   
date: Thu Feb 20 2014 15:08:42 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Entity; fixing dumb crash on new parent constructor code</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [3729cae672](https://github.com/underscorediscovery/luxe/commit/3729cae67277c4187934838c418d4180841a6dcd)   
author: underscorediscovery   
date: Thu Feb 20 2014 14:56:12 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Entity; adding parent in constructor, and fixing silly crash in set_parent</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [86c87765bd](https://github.com/underscorediscovery/luxe/commit/86c87765bdae6b579b7c4be3539c4dfe68f6ba08)   
author: underscorediscovery   
date: Thu Feb 20 2014 11:29:10 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>States; consistency and clarity in function parameters</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [5b08aefe6a](https://github.com/underscorediscovery/luxe/commit/5b08aefe6ab65b32e5e41601143c1e1b6c46a44f)   
author: Sven Bergström   
date: Thu Feb 20 2014 08:11:19 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>fixing typo in path</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [5825fb33fe](https://github.com/underscorediscovery/luxe/commit/5825fb33fe94157dbb9591d69f9e51f6b0f3f634)   
author: underscorediscovery   
date: Thu Feb 20 2014 07:37:43 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Debug; adding initial batcher debug view panel, nothing there yet</li><li>Utils; adding initial stack trace string return, but it's unclear how to get the names of Method()</li><li>Batcher; fixing issue where dead dropped geometry can infect state</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [1a3b7f1062](https://github.com/underscorediscovery/luxe/commit/1a3b7f10627fd3bb8df06e1aac561f53effa3fa9)   
author: underscorediscovery   
date: Thu Feb 13 2014 05:16:59 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; continued cleanup</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [0dd2c50f28](https://github.com/underscorediscovery/luxe/commit/0dd2c50f28931156302fdb53a66f094dd59eeff6)   
author: underscorediscovery   
date: Thu Feb 13 2014 04:36:02 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Resource; moving to luxe package, and cleaning up core types like droppable (not really used atm)</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [dea8ed4d36](https://github.com/underscorediscovery/luxe/commit/dea8ed4d36a167113ff2c114d6534007371800a7)   
author: underscorediscovery   
date: Thu Feb 13 2014 04:35:29 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; updating implementation to include generated output directly from scribe, and read descriptions from code etc.</li><li>Still quite a bit to do, like I want all inherited class data embedded</li><li>in the page not hidden on a click away etc.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [bb592c4d24](https://github.com/underscorediscovery/luxe/commit/bb592c4d24062bdd2e7a79b38d3453f06373e77e)   
author: underscorediscovery   
date: Tue Feb 11 2014 23:50:08 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; update changes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [8e4f992ed5](https://github.com/underscorediscovery/luxe/commit/8e4f992ed50e7c000164783df1024018089e8991)   
author: underscorediscovery   
date: Tue Feb 11 2014 23:49:31 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Particles; fixing bug where init_with wasn't used for emitter components</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [5c0db225ee](https://github.com/underscorediscovery/luxe/commit/5c0db225ee66e402264e34422274593e37294ec9)   
author: underscorediscovery   
date: Tue Feb 11 2014 23:49:11 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>SpriteAnimation; fixing crash on image frame sets in html5, not having an image set yet</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [af44c5a9b7](https://github.com/underscorediscovery/luxe/commit/af44c5a9b78e2403ba791e06ca62649c05281e81)   
author: underscorediscovery   
date: Tue Feb 11 2014 23:48:56 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Mouse; Updating all tests and projects and features to use onmousewheel</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [c95b7b9f5b](https://github.com/underscorediscovery/luxe/commit/c95b7b9f5b8e82b4119705dbee29c874dd2bd8fb)   
author: underscorediscovery   
date: Tue Feb 11 2014 21:31:07 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tests; build file change for html5 build only atm</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [23cbab9357](https://github.com/underscorediscovery/luxe/commit/23cbab9357a9ac8da6e8e3f58c2a6dbe7f536ada)   
author: underscorediscovery   
date: Tue Feb 11 2014 21:30:20 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tests; making sure all builds stay running</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [69e082c959](https://github.com/underscorediscovery/luxe/commit/69e082c959eab86126707eabd9ceb55f26ef866a)   
author: underscorediscovery   
date: Tue Feb 11 2014 21:29:54 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tilemap; Squads; fixing loadText new text resources stuff</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [cfbf9f12fb](https://github.com/underscorediscovery/luxe/commit/cfbf9f12fb7532bed8f96bb131d7bdda69283b8b)   
author: underscorediscovery   
date: Tue Feb 11 2014 15:58:20 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; update changes, setup guide, and index page</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [59fe6cf411](https://github.com/underscorediscovery/luxe/commit/59fe6cf4114b14051f35ce21ed534b9f88a66fa2)   
author: underscorediscovery   
date: Tue Feb 11 2014 15:57:35 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Parcel; shielding html5 throwing cpp errors in Parcel.hx</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [067e55aad2](https://github.com/underscorediscovery/luxe/commit/067e55aad2064c7cc0110fd4b8b807a363791abf)   
author: underscorediscovery   
date: Mon Feb 10 2014 06:31:38 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>API : loadTexture, adding flag for bytes api</li><li>Parcel : Adding threaded loading but texture uploads to the GPU will still be main thread and way more blocking than the loading itself... but its smoother, loads a bit quicker etc</li><li>Parcel : fix #69</li><li>ParcelProgress : Allowing custom alpha for the background</li><li>Parcel; adding from json loading fix #68</li><li>Core; adding main thread requests but again, textures submitted to the cpu are the delay not the loading.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [b06991bf3b](https://github.com/underscorediscovery/luxe/commit/b06991bf3b228f34e0fa5c02673bf4e0cc9bdd58)   
author: underscorediscovery   
date: Mon Feb 10 2014 00:05:13 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; update changes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [8f3ba02b43](https://github.com/underscorediscovery/luxe/commit/8f3ba02b43914a3f4c0fc765487dedbb519c6ee8)   
author: underscorediscovery   
date: Sun Feb 09 2014 23:55:58 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Resources; adding TextResource, SoundResource, DataResource, and adjusting the API toward consistency</li><li>Parcels; adding parcel api to Luxe, see test_parcels, still some other things to do</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [4fc08f2fff](https://github.com/underscorediscovery/luxe/commit/4fc08f2fff3cc121db9a28413433f4c86f6c36cc)   
author: underscorediscovery   
date: Sun Feb 09 2014 17:01:15 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>BitmapFont; adding some fixed precision for the scaling for now</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [2cc7672b44](https://github.com/underscorediscovery/luxe/commit/2cc7672b44147933d541798b913a181e300ed457)   
author: underscorediscovery   
date: Sun Feb 09 2014 17:00:57 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Letter5; fixing dumb crash</li><li>Screen; guard against null</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [f7666eba13](https://github.com/underscorediscovery/luxe/commit/f7666eba137d2995cbbc98ca200046b2017b3ebf)   
author: underscorediscovery   
date: Sun Feb 09 2014 16:47:43 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Letter5; continuing port and update</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [a3f4210cf5](https://github.com/underscorediscovery/luxe/commit/a3f4210cf55e46f66e5ce3ac4c1d9586aeed601d)   
author: underscorediscovery   
date: Sun Feb 09 2014 16:42:37 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Debug; cleanup</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [7016ec289e](https://github.com/underscorediscovery/luxe/commit/7016ec289e9f0a7db4577ab82e592f7728420c3b)   
author: underscorediscovery   
date: Sun Feb 09 2014 16:34:23 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>API; cleanup of api functions</li><li>Screen; Cursor; moved the cursor functionality into Luxe.screen.cursor</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [2e5563c395](https://github.com/underscorediscovery/luxe/commit/2e5563c395a211000a19b501a4d69b84741b43b9)   
author: underscorediscovery   
date: Sat Feb 08 2014 22:38:02 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Utils; Maths; adding a within_range( value, start, end ) function for convenience</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [9e178f6620](https://github.com/underscorediscovery/luxe/commit/9e178f6620a5ddf023194756f457dee2e56bcc76)   
author: underscorediscovery   
date: Sat Feb 08 2014 07:32:12 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Letter5; working on finishing this up, cleaning up states and adding new UI and stuff.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [432df7ee1c](https://github.com/underscorediscovery/luxe/commit/432df7ee1ce69e1b5d189fa5b33c5726cff65703)   
author: underscorediscovery   
date: Sat Feb 08 2014 07:02:09 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Debug; FlyCamera; fixing mouse lock on native after testing against latest SDL, still some things to resolve but this code is fine here.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [e8296b947c](https://github.com/underscorediscovery/luxe/commit/e8296b947ca26bf8221ccbcdfe29de8158ef8952)   
author: underscorediscovery   
date: Sat Feb 08 2014 05:29:03 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Entity; Visual; commit d113797358 made changes to origin and scale, but that broke scaling , so reverting the change because otherwise things wont apply well elsewhere.</li><li>Color; Adding flags to refresh hsv/hsl when changing rgb on a ColorHSL/ColorHSV, such that a ColorHSV/HSL can be tweened using rgb as well.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [c792dfad6a](https://github.com/underscorediscovery/luxe/commit/c792dfad6ac29b37098b8dcb22abae635bf10b9b)   
author: underscorediscovery   
date: Fri Feb 07 2014 03:42:00 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>BitmapFont; fix bugs in parsing .fnt files that don't have a newline in pages.. used a smarter approach, working great with shoebox</li><li>Tests; font updated font to a new one from ShoeBox http://renderhjs.net/shoebox/, working well</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [0b9017f3c1](https://github.com/underscorediscovery/luxe/commit/0b9017f3c1de70bedf9528cfc4b6db4c0eefcf5c)   
author: underscorediscovery   
date: Thu Feb 06 2014 17:50:37 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>tools bug; related to how the template system works in lime-tools, this allows luxe projects to work with current sublime plugin, as well as with the latest tools. If you have a project, make sure luxe include in project.luxe.xml is after the lime one, this mitigates the inclusion order errors</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [c85a5b043e](https://github.com/underscorediscovery/luxe/commit/c85a5b043e0fab8d9c10e05bf2e04fd58373dd34)   
author: underscorediscovery   
date: Wed Feb 05 2014 12:53:59 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Scene; shielding all entity access with null checks so the game doesn't crash, because this shouldn't happen - but still digging into how this came about using a test case from @bennuk</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [faa0d405ba](https://github.com/underscorediscovery/luxe/commit/faa0d405ba9643e04a727d87b49ccfdeadad37c8)   
author: underscorediscovery   
date: Mon Feb 03 2014 20:41:23 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Parcel; cleaning up more and committing so i can push</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [1a3580deb3](https://github.com/underscorediscovery/luxe/commit/1a3580deb3e168f0ee136615b7565d92814df23c)   
author: underscorediscovery   
date: Mon Feb 03 2014 20:40:58 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Input; fixing bug where onkeydown was called in place of keyup, thanks @bennuk</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [fc61f25e36](https://github.com/underscorediscovery/luxe/commit/fc61f25e365f30aed6f5a347eb92a1669a8c5abb)   
author: underscorediscovery   
date: Mon Feb 03 2014 02:36:10 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Core; Cleanup of string allocations every frame for hidden _debug</li><li>values, and removed a bunch of less useful profiles (build with</li><li>-Dluxe_fullprofile if you need these for core debugging)</li><li>Visual; options add changed to no_batcher_add, to match all no_*</li><li>options across luxe.</li><li>Visual; size listeners for sub components</li><li>Tests; luxemark tweaking values and fixing endless loops on native</li><li>without threads.</li><li>Parcles; adding initial parcel implementation for textures, along with</li><li>a progress bar helper, still wip but saving the work for the day.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [fadd706a47](https://github.com/underscorediscovery/luxe/commit/fadd706a47da7ecda6ae5d591ffe0fbf8652e8be)   
author: underscorediscovery   
date: Sat Feb 01 2014 19:09:31 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Draw; fixed missing return on ngon</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [352abe9bdc](https://github.com/underscorediscovery/luxe/commit/352abe9bdc91df3d8620ed0deba75d02905a61c9)   
author: underscorediscovery   
date: Sat Feb 01 2014 05:47:06 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Setup; Adding FlashDevelop editor Project Template for windows users that want to use FD with luxe. see instructions.txt</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [dd5404dab4](https://github.com/underscorediscovery/luxe/commit/dd5404dab47cb02a59e9d9b322b474a948602f3a)   
author: underscorediscovery   
date: Thu Jan 30 2014 04:16:43 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tilemaps; added remove_tileset and remove_layer , as well as tileset(name) functions, for editing tilemaps. This should fix #39.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [42bce22690](https://github.com/underscorediscovery/luxe/commit/42bce2269052c68f0563a8fe5f11d23209600e72)   
author: underscorediscovery   
date: Thu Jan 30 2014 04:09:46 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tilemaps; Fixing stupid undo mistakes in Tilemap class.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [de13f9d23e](https://github.com/underscorediscovery/luxe/commit/de13f9d23eacc2db8d43d2e701a975d406b08496)   
author: underscorediscovery   
date: Thu Jan 30 2014 04:02:52 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tilemaps; Isometric; added conversion to and from world tile coords inside the Tilemap class directly</li><li>Tilemaps; Added worldpos_to_map conversion helper in Tilemap, and fixing rounding for cell numbers</li><li>Tilemaps; Fixed inside() function being dumb about negative values...</li><li>Tilemaps; Isometric; visual grid display added for debug purposes etc. Lots toward #39</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [ca35d79e16](https://github.com/underscorediscovery/luxe/commit/ca35d79e16661e4e196590226df9aa4f438358dc)   
author: underscorediscovery   
date: Thu Jan 30 2014 00:34:38 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Audio; api missing on_complete, adding it</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [280a998046](https://github.com/underscorediscovery/luxe/commit/280a998046eced7f71cddb662ebec121875b0901)   
author: underscorediscovery   
date: Thu Jan 30 2014 00:32:39 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; update changes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [6d2db94a8b](https://github.com/underscorediscovery/luxe/commit/6d2db94a8b5ea43d264db0ebd72af67bf82ff3ef)   
author: underscorediscovery   
date: Thu Jan 30 2014 00:32:23 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Audio; cleanup return types and clarity in the api flags</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [c66de8dc94](https://github.com/underscorediscovery/luxe/commit/c66de8dc94231b20e33fb184144565c382eed999)   
author: underscorediscovery   
date: Wed Jan 29 2014 23:38:58 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Audio; remap api to latest lime. REQUIRES latest lime repo code for now...</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [5a174c3e1a](https://github.com/underscorediscovery/luxe/commit/5a174c3e1a4e9b933f4460d081c8bc1a21de169d)   
author: underscorediscovery   
date: Wed Jan 29 2014 23:33:50 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tilemaps; making ortho code consistent with code from whuop</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [e6f08cc685](https://github.com/underscorediscovery/luxe/commit/e6f08cc685168d8f42cb9ac8693e3f010fe8fa6d)   
author: Kristian Brodal   
date: Wed Jan 29 2014 23:17:59 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tilemaps; Added conversion for tile -> isometric and isometric -> tile. Should work, after offset has been accounted for.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [6e63dba356](https://github.com/underscorediscovery/luxe/commit/6e63dba35645d6c0628abe03527f9d58a1d6f89b)   
author: underscorediscovery   
date: Wed Jan 29 2014 22:26:24 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tilemap; fixing html5 loading of json types, and fixing isometric being broken by layer / opacity being non existent in the tiles descriptions</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [d0fa280a13](https://github.com/underscorediscovery/luxe/commit/d0fa280a135abcb439caab81cf35e429212f3e16)   
author: underscorediscovery   
date: Wed Jan 29 2014 16:48:58 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; update changes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [862aa96c6b](https://github.com/underscorediscovery/luxe/commit/862aa96c6bba9f4831ecb1e347bb61460b366bff)   
author: underscorediscovery   
date: Wed Jan 29 2014 16:48:32 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>RenderState; adding lineWidth to reduce redundant calls</li><li>Builder; html5 minify flag added</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [36985c97b9](https://github.com/underscorediscovery/luxe/commit/36985c97b98ed1b8981dac225a2e0c1aea01ffcb)   
author: underscorediscovery   
date: Wed Jan 29 2014 16:40:57 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Sprite; adding flipx, flipy to the constructor options</li><li>Sprite; making centered, flipx and flipy consistent whether you set it in the constructor or after</li><li>Sprite; Fix #59</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [bfb74afb90](https://github.com/underscorediscovery/luxe/commit/bfb74afb9070aabe8dedd5826785d1ccb5908ede)   
author: underscorediscovery   
date: Tue Jan 28 2014 03:56:40 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; update changes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [b1dd48488a](https://github.com/underscorediscovery/luxe/commit/b1dd48488a2f0257662be6c2caff44dd491de2c6)   
author: underscorediscovery   
date: Tue Jan 28 2014 03:56:24 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Templates; fixing html5 templates for latest lime/luxe</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [eb0d2c45f2](https://github.com/underscorediscovery/luxe/commit/eb0d2c45f21b859edbee3f5829e885ad23124994)   
author: underscorediscovery   
date: Tue Jan 28 2014 03:14:53 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Template; Lime; LimeConfig is now typed for better clarity and such.</li><li>Base64; shielding for neko builds to fix neko stuff for now. :tofix:</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [2ba55f5812](https://github.com/underscorediscovery/luxe/commit/2ba55f581214416ef9d4efd9809eeaaef1bbd424)   
author: underscorediscovery   
date: Tue Jan 28 2014 03:13:41 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; update changes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [152b15c5ae](https://github.com/underscorediscovery/luxe/commit/152b15c5aee36a521a9b01d514207be3357115c1)   
author: underscorediscovery   
date: Mon Jan 27 2014 23:28:53 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Rectangle; Adding change listeners for sub components</li><li>Sprite; making sure uv isn't null, and making sure it gets the correct values from the texture on load</li><li>Sprite; adding sub texture uv listeners so sprite.uv.x += 5 can work in pixels</li><li>Tests; sprite uv test</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [3a44f4619f](https://github.com/underscorediscovery/luxe/commit/3a44f4619fff68b3164dc95f3a34814749173081)   
author: underscorediscovery   
date: Sun Jan 26 2014 22:05:13 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; update changes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [d76bee6ca5](https://github.com/underscorediscovery/luxe/commit/d76bee6ca5315817382efbedc3d5ee36b594003e)   
author: underscorediscovery   
date: Sun Jan 26 2014 22:04:53 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tests;  timescale; adding gamepad support for html5/native tests. working good so far</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [f12e6e25d5](https://github.com/underscorediscovery/luxe/commit/f12e6e25d59a0e803c67a92abbfb13849dc486d6)   
author: underscorediscovery   
date: Sun Jan 26 2014 21:53:47 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Input; better gamepad support from SDL and for the new html5 gamepad code in lime</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [0c57fc6335](https://github.com/underscorediscovery/luxe/commit/0c57fc6335a7a21d5265a21ea0a3b048367e8393)   
author: underscorediscovery   
date: Sun Jan 26 2014 19:42:21 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Core; mouse wheel changes to onmousewheel -> instead of mouse up</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [11c5779889](https://github.com/underscorediscovery/luxe/commit/11c5779889e5085e223f6cff9d6f98c5efb9e98d)   
author: underscorediscovery   
date: Sun Jan 26 2014 19:41:00 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Camera; cleaning up old references</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [872114e7dd](https://github.com/underscorediscovery/luxe/commit/872114e7dd5a5e2ddbda5205a0a8dff62964fe01)   
author: underscorediscovery   
date: Sun Jan 26 2014 06:14:08 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; update changes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [d9df216210](https://github.com/underscorediscovery/luxe/commit/d9df216210373d5710b8f3388d564636dba62987)   
author: underscorediscovery   
date: Sun Jan 26 2014 06:13:46 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>html5; cleaning up build output, moving ammo to haxebullet repo and removing this random debug stuff</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [913d48c684](https://github.com/underscorediscovery/luxe/commit/913d48c68421f681462c9d9a2617c182cef8850c)   
author: underscorediscovery   
date: Sun Jan 26 2014 03:34:25 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Input; shield unusable input for now from lime repo</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [3dcce8e475](https://github.com/underscorediscovery/luxe/commit/3dcce8e4754164c84be04af513b1e13adf41386e)   
author: underscorediscovery   
date: Sat Jan 25 2014 23:11:17 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tests; audio switching to different assets for now</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [5a9d1005bb](https://github.com/underscorediscovery/luxe/commit/5a9d1005bb90009b2bf2ef5bfff9e3a16dc41be4)   
author: underscorediscovery   
date: Sat Jan 25 2014 23:04:06 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>html5; templates; cleanup of the output folders putting the libs in lib/</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [d70a2577e7](https://github.com/underscorediscovery/luxe/commit/d70a2577e7166f3acd586fe930f87110f7191a07)   
author: underscorediscovery   
date: Sat Jan 25 2014 21:43:07 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; update changes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [22b0ae372b](https://github.com/underscorediscovery/luxe/commit/22b0ae372b13bbd0cddca8886b96b3ebe358d9ad)   
author: underscorediscovery   
date: Sat Jan 25 2014 21:38:31 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tilemaps; spacing / margin loading and display is working as expected.</li><li>Tilemaps; changed all type constructors to options method, for consistency</li><li>Tilemaps; TiledMaps, visiblity / opacity options for layers</li><li>Tiledmap; Ortho, adding grid display for debugging</li><li>More info : https://github.com/underscorediscovery/luxe/issues/39</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [73b9a9f409](https://github.com/underscorediscovery/luxe/commit/73b9a9f40930b22ac1ed3c68fe45ec56b7bdeba6)   
author: underscorediscovery   
date: Sat Jan 25 2014 18:03:11 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; update changes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [7ce33b0f69](https://github.com/underscorediscovery/luxe/commit/7ce33b0f69a123e9d7e2cf2ffb10acee7ad1aec4)   
author: underscorediscovery   
date: Sat Jan 25 2014 18:02:36 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Input; pressed/released/down lazy input methods added - fix #41 - REQUIRES an update to lime repo, or wait till next lime update</li><li>Tests; test_keystate for the above input</li><li>Api; Added Luxe.showConsole(true/false) as a shortcut for Luxe.core.show_console</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [80364a6669](https://github.com/underscorediscovery/luxe/commit/80364a66696a28e7726760bcd4ea2aea82b60b74)   
author: underscorediscovery   
date: Sat Jan 25 2014 01:16:54 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Animation; add public setter for speed, so speed can be changed from outside</li><li>Animation; added add_from_json_object for already parsed json (like the importers)</li><li>Animation; texture packer importer -> luxe sprite animation is complete, but lacks a feature to split frames into unique animations (something Animation needs on it's own... such that it's a separate issue)</li><li>Animation; Fix #55</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [2e12d1cf48](https://github.com/underscorediscovery/luxe/commit/2e12d1cf48c761a391789db425d5e3e1029e7185)   
author: underscorediscovery   
date: Sat Jan 25 2014 00:41:50 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Camera; Fix view_matrix being out of date in between frame updates (i.e input events), Fix #56 thanks @BigZaphod</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [9ccd1a3fdc](https://github.com/underscorediscovery/luxe/commit/9ccd1a3fdc8b7a151c08f5c988a5bdce08030e00)   
author: underscorediscovery   
date: Fri Jan 24 2014 23:16:56 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Guide; shader guide had weird formatting on the numbers</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [c7edc1a726](https://github.com/underscorediscovery/luxe/commit/c7edc1a7264065402f1bba2a8db75d07af9bb987)   
author: underscorediscovery   
date: Fri Jan 24 2014 23:16:39 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Animation; Sub frame animations complete! Now animations needn't be full frame size, they can be sourced from different sizes and the sprite will work out the details</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [1553291fac](https://github.com/underscorediscovery/luxe/commit/1553291facac53e23ce88a48cff3fb2e05a720cb)   
author: underscorediscovery   
date: Fri Jan 24 2014 14:24:26 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; update changes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [bdd7c71c7d](https://github.com/underscorediscovery/luxe/commit/bdd7c71c7de46477ea7319cf8dceb70e3442cb62)   
author: underscorediscovery   
date: Fri Jan 24 2014 13:51:19 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tests; cleaning up rogue changes to test</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [fb5d058ef2](https://github.com/underscorediscovery/luxe/commit/fb5d058ef2324b8896dec8be2fc2eda21b1a9b01)   
author: underscorediscovery   
date: Fri Jan 24 2014 13:48:43 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Visual; fixing bug where size only became non-null on texture load, which causes crashes when accessing it before then (thanks @shockham)</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [3ebc29ff05](https://github.com/underscorediscovery/luxe/commit/3ebc29ff0566baafb5783d53317b65719d6a9cfc)   
author: underscorediscovery   
date: Fri Jan 24 2014 12:48:04 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding thumbs.db to ignore</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [746cd1438f](https://github.com/underscorediscovery/luxe/commit/746cd1438f531b53859ed240e21447c1eef3e476)   
author: underscorediscovery   
date: Fri Jan 24 2014 12:45:10 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Rings; update components with init_with changes to match latest code</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [f1652e4689](https://github.com/underscorediscovery/luxe/commit/f1652e46897a7ed540b6bf19061837442d296743)   
author: underscorediscovery   
date: Fri Jan 24 2014 12:16:29 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tests; component state, testing size of sprite</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [e9f51e8ab8](https://github.com/underscorediscovery/luxe/commit/e9f51e8ab8ba4091f0d4476192f2a7ad77546560)   
author: underscorediscovery   
date: Fri Jan 24 2014 12:01:47 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Setup; Adding setup requirement libraries</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [2d187a7be4](https://github.com/underscorediscovery/luxe/commit/2d187a7be457b2b3cb8fac2883e27cf5ee83afc3)   
author: underscorediscovery   
date: Fri Jan 24 2014 12:01:47 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Entity; Visual; Sprite; moving pos and scale setting to the root type, and fixing inconsistency issues with scale and origin being a reference</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [2208c22f44](https://github.com/underscorediscovery/luxe/commit/2208c22f44407bb29be1d90a05ae346653632d5d)   
author: Sven Bergström   
date: Fri Jan 24 2014 11:58:14 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Update haxelib.json</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [1e0253a1bb](https://github.com/underscorediscovery/luxe/commit/1e0253a1bbf03215b8a566cd26da210db124058c)   
author: underscorediscovery   
date: Thu Jan 23 2014 04:41:59 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>SpriteAnimation; per frame image source position first pass, maintains parity with previous implementation but there is a question of how to handle the actual sprite size changes when the source size changes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [a3b63bfd64](https://github.com/underscorediscovery/luxe/commit/a3b63bfd6474598fc0dd2c0514b36ec97e69345b)   
author: underscorediscovery   
date: Thu Jan 23 2014 03:08:32 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Camera; adding cached matrices for generating the viewmatrix, which completes rotation, scale, zoom and centre and position to be correct, see the tests for complete examples.</li><li>Tests; camera adding crosshairs to the mouse position, updating for latest camera code and making drag to rotate a little more consistent (still a bit stupid though, it works to test)</li><li>Fix #40 https://github.com/underscorediscovery/luxe/issues/40</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [038bcb3edd](https://github.com/underscorediscovery/luxe/commit/038bcb3edde707c039b92dd2f7ce775d5bcb37e6)   
author: underscorediscovery   
date: Thu Jan 23 2014 03:03:46 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Matrix; compose_with_origin added but note it allocates new matrices, best to cache these like phoenix.Camera does</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [a709f48241](https://github.com/underscorediscovery/luxe/commit/a709f48241c617f0cf90b36505ed304cae2f53ce)   
author: underscorediscovery   
date: Thu Jan 23 2014 03:02:28 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Camera; adding rotation cache and converting to radians before passing to camera for correct values</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [2312dc8d4e](https://github.com/underscorediscovery/luxe/commit/2312dc8d4e889a0e0747ddb65af84b9f3c631db6)   
author: underscorediscovery   
date: Wed Jan 22 2014 22:29:33 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>TexturePacker; import data from both JSON formats, still need to wrap it to luxe but per-frame sizes are not supported in luxe animation system just yet so.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [b6ffb66448](https://github.com/underscorediscovery/luxe/commit/b6ffb66448d3c004c995490e91509154e11faed2)   
author: underscorediscovery   
date: Wed Jan 22 2014 16:29:53 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; update changes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [fce446c233](https://github.com/underscorediscovery/luxe/commit/fce446c233eefc30d6e2e18e719003e1ae04ba1d)   
author: underscorediscovery   
date: Wed Jan 22 2014 16:29:39 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>SpriteAnimation; remove_event and remove_events added for control over frame events from the api</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [485078fd47](https://github.com/underscorediscovery/luxe/commit/485078fd47b3273a7450d75588572c22af7b8730)   
author: underscorediscovery   
date: Wed Jan 22 2014 16:06:29 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>SpriteAnimation; adding event api for adding events after the fact (still need remove)</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [b00f8c3e17](https://github.com/underscorediscovery/luxe/commit/b00f8c3e17973c4d706f25c33478d448514e89a4)   
author: underscorediscovery   
date: Wed Jan 22 2014 14:42:53 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>SpriteAnimation; Parsing events from specified json, and firing them on frame contact. Right now it hooks directly to image frame, so an image frame on hold will fire every tick of the animation fps (which makes sense) but maybe other options other than image frame should be considered, like an id:tag in the frame set or something.</li><li>Tests; SpriteAnimation; adding footstep sound on walk frames to test events</li><li>Fix #37</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [0660071651](https://github.com/underscorediscovery/luxe/commit/06600716511a94c4e06dbe95efe280babb20b653)   
author: underscorediscovery   
date: Wed Jan 22 2014 14:17:30 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Entity; Fixing silly logic for adding to scene in _init, where _init is called from the scene.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [84f8651a75](https://github.com/underscorediscovery/luxe/commit/84f8651a75d1f7bec4530ab9e6ec34ff782b3795)   
author: underscorediscovery   
date: Wed Jan 22 2014 02:32:37 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; changes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [c0ea1abbfe](https://github.com/underscorediscovery/luxe/commit/c0ea1abbfe2ff7c048787b202fee857be27ca95b)   
author: underscorediscovery   
date: Wed Jan 22 2014 02:32:08 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Entity; Moving scene management flags into entity level and not in visual, and making sure that scene remains unspecified if no scene is set or requested</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [e6eb6be533](https://github.com/underscorediscovery/luxe/commit/e6eb6be53340c03a8208a6c9c8ff8b7f563da623)   
author: underscorediscovery   
date: Wed Jan 22 2014 01:29:51 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Components; Parity with States and Entity and so on with the data -> becoming { init_with : data } for consistency</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [5d7306463a](https://github.com/underscorediscovery/luxe/commit/5d7306463a369b909ab47ff6fdb1ed25c25659d3)   
author: underscorediscovery   
date: Wed Jan 22 2014 01:08:55 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>States; Consistency with Entity and options for { init_with:data } instead of data</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [e8d5942a24](https://github.com/underscorediscovery/luxe/commit/e8d5942a2416216eb689e70a740e008b49212aed)   
author: underscorediscovery   
date: Wed Jan 22 2014 00:31:57 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Entity; Sprite; Visual; moving options to unique files to avoid "Loop found in cascading signatures definitions. Please change order/import" errors on import orders</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [78fe66263a](https://github.com/underscorediscovery/luxe/commit/78fe66263a3ae5f1c4b50fc01508291e456b237c)   
author: underscorediscovery   
date: Wed Jan 22 2014 00:26:59 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Squads; tidying up code a bit</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [45bb3a8011](https://github.com/underscorediscovery/luxe/commit/45bb3a801184e3f7fe43c789adec7dac3863699a)   
author: underscorediscovery   
date: Tue Jan 21 2014 21:36:16 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; update changes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [9d99fe4e44](https://github.com/underscorediscovery/luxe/commit/9d99fe4e44ac53b8d5c95faa7ce1a972317856a7)   
author: underscorediscovery   
date: Tue Jan 21 2014 21:35:37 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Entity; Visual; Sprite; Collapsing the init options into a better structure, such that options can be stored, and init data can be passed to the base entity as well as descendants using { init_with:data } (and this is typed on both sides)</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [98b824f041](https://github.com/underscorediscovery/luxe/commit/98b824f0412f16e41814dfae6ecd16ed6e95c863)   
author: underscorediscovery   
date: Tue Jan 21 2014 21:32:14 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; first attempt at a more complex regex for parsing the Class names to Links but it's gonna need a whole different approach..</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [a000315547](https://github.com/underscorediscovery/luxe/commit/a00031554790f897acb121c8d6dbaf2e3b51b568)   
author: underscorediscovery   
date: Tue Jan 21 2014 21:30:32 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Scene; create function printing more useful debug info</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [111c191dc7](https://github.com/underscorediscovery/luxe/commit/111c191dc72f97cb0b2c3d354cbc32c823295544)   
author: underscorediscovery   
date: Tue Jan 21 2014 21:30:00 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Rings; fix depth of enemy bullets</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [c7a9c1487a](https://github.com/underscorediscovery/luxe/commit/c7a9c1487a4d6e7de42e415c7b21d9d839926f79)   
author: underscorediscovery   
date: Tue Jan 21 2014 04:02:52 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>API; Luxe; Luxe.time is now a shortcut for haxe.Timer.stamp()</li><li>Timer; Luxe.time was renamed to Luxe.timer, for schedules</li><li>Fix #52</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [4e0ef11650](https://github.com/underscorediscovery/luxe/commit/4e0ef11650ddb114f7f66f51bc09d30a91277eae)   
author: underscorediscovery   
date: Tue Jan 21 2014 03:46:02 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>CircleGeometry; Adding rx and ry options to draw ellipses, makes ring/circle able to be ellipses</li><li>Tests; draw; adding some ellipses</li><li>Fix #43</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [a5dab1da9a](https://github.com/underscorediscovery/luxe/commit/a5dab1da9a4fed6f2517890caed985b4d27030e0)   
author: underscorediscovery   
date: Tue Jan 21 2014 03:32:00 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>RingGeometry; Fixing removal of a needed vertex, it makes the side flat, didn't notice.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [c1d1e07cc1](https://github.com/underscorediscovery/luxe/commit/c1d1e07cc19fd402dc23448769ef63719969758e)   
author: underscorediscovery   
date: Tue Jan 21 2014 03:16:20 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Draw; Adding ngon drawing routine with solid, angle, sides, radius options. See test_draw.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [127fae4fad](https://github.com/underscorediscovery/luxe/commit/127fae4fad3cbf4e2fbbbd8f647729b071021160)   
author: underscorediscovery   
date: Tue Jan 21 2014 02:11:45 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Input; Prelim code for pressed/released/down bools</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [cebf2e9eec](https://github.com/underscorediscovery/luxe/commit/cebf2e9eec1abc65e5f7cee91a212c3e11df81ba)   
author: underscorediscovery   
date: Mon Jan 20 2014 22:39:57 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>html5; Texture cross policy fallback is neater for now (not sure that the texture is even needed to taint cross origin... but whatever)</li><li>html5; shutdown clears the screen to luxe orange as a clear indicator. This will need to be an event you can handle yourself somehow...</li><li>html5; fix #48</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [ef6cdf1d4c](https://github.com/underscorediscovery/luxe/commit/ef6cdf1d4c81eafe925b5acf0fd4caf9f1727404)   
author: underscorediscovery   
date: Mon Jan 20 2014 21:59:41 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Batcher; Fixing sorting being incorrect when two different types of primitive types are being sorted weirdly, Fix #54</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [620d544d61](https://github.com/underscorediscovery/luxe/commit/620d544d615bb581a36f8e40b8eaf949319305a2)   
author: underscorediscovery   
date: Mon Jan 20 2014 21:55:25 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Draw; Some useful debug info on the .id value of geometry</li><li>Entity; Adding the init functionality like Component, such that Luxe.scene.create can pass typed init data</li><li>Scene; adding create(type,name, initdata)</li><li>Visual; name based on name + visual</li><li>Geometry; id assign on passed in</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [4c00181c1c](https://github.com/underscorediscovery/luxe/commit/4c00181c1c2acb04094a3e7182ee5fee76489593)   
author: underscorediscovery   
date: Mon Jan 20 2014 19:40:58 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tests; depth; Adding colors to make it clearer that they are ordered</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [99511cd248](https://github.com/underscorediscovery/luxe/commit/99511cd24894d03c53dca4a73f0f3c36c4cc7fdf)   
author: underscorediscovery   
date: Mon Jan 20 2014 18:11:05 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; update changes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [ec9b35dda8](https://github.com/underscorediscovery/luxe/commit/ec9b35dda8fdcbd3c9e7cfa9bb8fe9de83219f24)   
author: underscorediscovery   
date: Mon Jan 20 2014 18:07:47 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Visual; removing size warning for now, this is meant to be a component of the image sprites without images but that's changed with visual/sprite separation.</li><li>Entity; fix bug where destroying an entity didn't remove it from it's parent, so it tried to update past being destroyed. Should Fix #44 (again).</li><li>Scene; some shielding against null entities existing in the scene, and trying to remove entities that don't belong to the scene in question, and a toString() to be more interesting to trace()</li><li>Visual; changed from default luxe scene to the given scene, so that it would work as intended when more scenes are layered on each other</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [33a6337b89](https://github.com/underscorediscovery/luxe/commit/33a6337b89b96179a2a83c1ff71dbdd7c23afdeb)   
author: underscorediscovery   
date: Mon Jan 20 2014 08:54:01 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; changes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [6d43d42d90](https://github.com/underscorediscovery/luxe/commit/6d43d42d900b341b8f61b001dcc07f2e4390f127)   
author: underscorediscovery   
date: Mon Jan 20 2014 08:52:27 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Debug; Switching avg/current to current/avg, makes more sense</li><li>Particles; removing null setter causing null entities in scene (particles need a touch of work still anyway)</li><li>Scene; adding a gaurd against null entities on destroy</li><li>Sprite; Large important refactor, sprite is now inherited from Visual, visual will handle the geometry wrapping, sprite will handle the "image sprite" logistics (encapsulated better)</li><li>Visual; First pass of visual, still has a touch of sprite stuff (size specifically and some odd timing things to resolve without it). This will also allow more defaults than just quad to exist as a flag type, like new Visual({ geometry_type:GeometryType.ring }) or circle etc.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [de3cac2e9f](https://github.com/underscorediscovery/luxe/commit/de3cac2e9fa7e5ddcaac1e741ccfe0151cd4f971)   
author: underscorediscovery   
date: Mon Jan 20 2014 07:46:39 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Camera; Fix #50 , update position to the view when tweening</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [f555a90845](https://github.com/underscorediscovery/luxe/commit/f555a90845752b66cdab1f598c7785edaa0a3cfe)   
author: underscorediscovery   
date: Mon Jan 20 2014 05:52:41 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; Updating docs</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [bd1baf1b29](https://github.com/underscorediscovery/luxe/commit/bd1baf1b2968e9774ce1ece90e73cbd35d86aede)   
author: underscorediscovery   
date: Mon Jan 20 2014 05:50:58 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>RingGeometry; Tightening up circle implementation for reuse as ellipse and making it more flexible</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [2f3a01acef](https://github.com/underscorediscovery/luxe/commit/2f3a01acef8878032451bd83520ad55b3394da77)   
author: underscorediscovery   
date: Mon Jan 20 2014 05:49:26 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Entity; `entity.destroy` handles proper destruction, implement `destroyed` for the handler of when that happens in your own components.</li><li>Refactor; Entity; Component; `destroyed` instead of `destroy` for the handlers, `start` is renamed to `reset` because start is vague and unclear.</li><li>Component; `removed` event for when a component is being removed. This still needs some consistency, like remove vs destroy</li><li>Refactor; States; `enable` is now `enabled`, `disable` is now `disabled` and do_disable is called disable.</li><li>Tests; builder; For generating builds of projects and tests. See builds.json, used for building html5 tests and keeping builds running with latest code.</li><li>Builder.hx:138: completed 78 / 78</li><li>Builder.hx:147:  successes:</li><li>Builder.hx:149:    html5 | test_assets</li><li>Builder.hx:149:    html5 | test_astar</li><li>Builder.hx:149:    html5 | test_audio</li><li>Builder.hx:149:    html5 | test_base64</li><li>Builder.hx:149:    html5 | test_camera</li><li>Builder.hx:149:    html5 | test_camera_views</li><li>Builder.hx:149:    html5 | test_colors</li><li>Builder.hx:149:    html5 | test_complexgeometry</li><li>Builder.hx:149:    html5 | test_component_state</li><li>Builder.hx:149:    html5 | test_component_transforms</li><li>Builder.hx:149:    html5 | test_components</li><li>Builder.hx:149:    html5 | test_depth</li><li>Builder.hx:149:    html5 | test_draw</li><li>Builder.hx:149:    html5 | test_events</li><li>Builder.hx:149:    html5 | test_fonts</li><li>Builder.hx:149:    html5 | test_groups_and_blendmodes</li><li>Builder.hx:149:    html5 | test_luxemark</li><li>Builder.hx:149:    html5 | test_named_bindings</li><li>Builder.hx:149:    html5 | test_nineslice</li><li>Builder.hx:149:    html5 | test_particles</li><li>Builder.hx:149:    html5 | test_rtt</li><li>Builder.hx:149:    html5 | test_shaders</li><li>Builder.hx:149:    html5 | test_sprite</li><li>Builder.hx:149:    html5 | test_sprite_animation</li><li>Builder.hx:149:    html5 | test_states</li><li>Builder.hx:149:    html5 | test_text</li><li>Builder.hx:149:    html5 | test_tiles</li><li>Builder.hx:149:    html5 | test_timescale</li><li>Builder.hx:149:    html5 | test_tween</li><li>Builder.hx:149:    html5 | test_uuid</li><li>Builder.hx:149:    html5 | test_mesh</li><li>Builder.hx:149:    html5 | test_mesh_component</li><li>Builder.hx:149:    html5 | test_mesh_mouse_rotate</li><li>Builder.hx:149:    html5 | letter5</li><li>Builder.hx:149:    html5 | rings</li><li>Builder.hx:149:    html5 | squads</li><li>Builder.hx:149:    html5 | suitstory</li><li>Builder.hx:149:    html5 | tdgame</li><li>Builder.hx:149:    html5 | three</li><li>Builder.hx:149:    mac | test_assets</li><li>Builder.hx:149:    mac | test_astar</li><li>Builder.hx:149:    mac | test_audio</li><li>Builder.hx:149:    mac | test_base64</li><li>Builder.hx:149:    mac | test_camera</li><li>Builder.hx:149:    mac | test_camera_views</li><li>Builder.hx:149:    mac | test_colors</li><li>Builder.hx:149:    mac | test_complexgeometry</li><li>Builder.hx:149:    mac | test_component_state</li><li>Builder.hx:149:    mac | test_component_transforms</li><li>Builder.hx:149:    mac | test_components</li><li>Builder.hx:149:    mac | test_depth</li><li>Builder.hx:149:    mac | test_draw</li><li>Builder.hx:149:    mac | test_events</li><li>Builder.hx:149:    mac | test_fonts</li><li>Builder.hx:149:    mac | test_groups_and_blendmodes</li><li>Builder.hx:149:    mac | test_luxemark</li><li>Builder.hx:149:    mac | test_named_bindings</li><li>Builder.hx:149:    mac | test_nineslice</li><li>Builder.hx:149:    mac | test_particles</li><li>Builder.hx:149:    mac | test_rtt</li><li>Builder.hx:149:    mac | test_shaders</li><li>Builder.hx:149:    mac | test_sprite</li><li>Builder.hx:149:    mac | test_sprite_animation</li><li>Builder.hx:149:    mac | test_states</li><li>Builder.hx:149:    mac | test_text</li><li>Builder.hx:149:    mac | test_tiles</li><li>Builder.hx:149:    mac | test_timescale</li><li>Builder.hx:149:    mac | test_tween</li><li>Builder.hx:149:    mac | test_uuid</li><li>Builder.hx:149:    mac | test_mesh</li><li>Builder.hx:149:    mac | test_mesh_component</li><li>Builder.hx:149:    mac | test_mesh_mouse_rotate</li><li>Builder.hx:149:    mac | letter5</li><li>Builder.hx:149:    mac | rings</li><li>Builder.hx:149:    mac | squads</li><li>Builder.hx:149:    mac | suitstory</li><li>Builder.hx:149:    mac | tdgame</li><li>Builder.hx:149:    mac | three</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [bda1d23915](https://github.com/underscorediscovery/luxe/commit/bda1d239152b07424bcb42ce83432f4d1beb012c)   
author: underscorediscovery   
date: Mon Jan 20 2014 04:59:24 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>suistory; fixing builds for latest luxe stuff</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [93ffdd37e9](https://github.com/underscorediscovery/luxe/commit/93ffdd37e97c947d58508a06f7d6e91bf3b1f3a7)   
author: underscorediscovery   
date: Mon Jan 20 2014 04:38:48 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tests; text fixing html5 build</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [5c6a21e746](https://github.com/underscorediscovery/luxe/commit/5c6a21e7463bf244127fce716d336eff0253304e)   
author: underscorediscovery   
date: Mon Jan 20 2014 04:33:15 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tests; fixing test states for latest enabled/disable flags</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [cfb1d860de](https://github.com/underscorediscovery/luxe/commit/cfb1d860de9ac808288bc2b7dc59a4a656f3fc19)   
author: underscorediscovery   
date: Mon Jan 20 2014 04:30:11 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tests; luxemark better named</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [2247c49c90](https://github.com/underscorediscovery/luxe/commit/2247c49c90d9842752aad19b98a9cbdcf9184bd4)   
author: underscorediscovery   
date: Mon Jan 20 2014 04:29:55 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Test; Luxemark; fixing html5 build</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [1cbeda6aea](https://github.com/underscorediscovery/luxe/commit/1cbeda6aea0a5a5014a2cd0e312a5092045d46ea)   
author: underscorediscovery   
date: Mon Jan 20 2014 02:47:58 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tests; Adding test builder to run html5/cpp builds automatically</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [161c2377bc](https://github.com/underscorediscovery/luxe/commit/161c2377bc9ef5e96f6ddaf7b67d10c68682306d)   
author: underscorediscovery   
date: Mon Jan 20 2014 02:47:12 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tests; Removing superfluous test from structural</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [57961320e0](https://github.com/underscorediscovery/luxe/commit/57961320e0a6875c03f8349ee63de98745d1ea53)   
author: underscorediscovery   
date: Sun Jan 19 2014 16:27:31 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; changes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [72190223b5](https://github.com/underscorediscovery/luxe/commit/72190223b5261f6c4e75d785edd70f38bd1ad150)   
author: underscorediscovery   
date: Sun Jan 19 2014 16:26:58 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Sprite; deal with custom geometry via  as well as via  in the construct options.</li><li>Sprite; added no_geometry flag for better handling of flexibility</li><li>Sprite; fixing missing flags not set on the sprite itself, but only on geometry (like depth, group etc)</li><li>Sprite; adding missing group flag as well</li><li>NineSlice; using no_geometry flag instead of weird old code</li><li>Rings; using new geometry fixes for sprite to pass geometry in constructor</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [ec6e25945a](https://github.com/underscorediscovery/luxe/commit/ec6e25945a82901614aa11189a07251aeb538127)   
author: underscorediscovery   
date: Sun Jan 19 2014 15:17:25 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Components; Adding component state test</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [151d91be82](https://github.com/underscorediscovery/luxe/commit/151d91be824065f0cbbb55dbba94d07b63290e58)   
author: underscorediscovery   
date: Sun Jan 19 2014 15:04:55 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Components; Fixing late init/start on components, adding .remove(component_name) but it has some gotchas to resolve, see tests/test_component_state for a toggle example (the one gotcha being no cleanup, and needing better names)</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [268e165858](https://github.com/underscorediscovery/luxe/commit/268e165858e309602c903952a43337a9ccb9ea5c)   
author: underscorediscovery   
date: Sun Jan 19 2014 02:42:03 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; Updating changes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [51824808a0](https://github.com/underscorediscovery/luxe/commit/51824808a0b94884f063b58f0b82a8acec77578d)   
author: underscorediscovery   
date: Sun Jan 19 2014 02:41:32 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tilemaps; Adding Isometric rendering and a Tiled isometric example. Still needs coord conversions for the API for Iso stuff</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [8729b3dae1](https://github.com/underscorediscovery/luxe/commit/8729b3dae1e9a14fe6abae608705b4fb9b12c98e)   
author: underscorediscovery   
date: Sun Jan 19 2014 01:05:42 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; Update changes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [973fbce075](https://github.com/underscorediscovery/luxe/commit/973fbce075950b47e42f55c280d0fdce3ff49eb7)   
author: underscorediscovery   
date: Sun Jan 19 2014 01:05:14 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tilemaps; Massive refactor to be more logical, Tilemap and TiledMap handles all the details of tilemaps internally, with Ortho and Isometric being implementation detail deferred from the Tilemap now</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [460af81243](https://github.com/underscorediscovery/luxe/commit/460af81243dccf4154d0e56997d0ee683bb6d256)   
author: underscorediscovery   
date: Sat Jan 18 2014 21:14:37 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>TiledMaps; adding tiled maps csv, zlib, base64 import formats, fixes to example and including more tmx files</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [b7ddd60a05](https://github.com/underscorediscovery/luxe/commit/b7ddd60a05333784810209347b32d281035330e9)   
author: underscorediscovery   
date: Sat Jan 18 2014 20:22:13 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs;</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [ffd77ef7fb](https://github.com/underscorediscovery/luxe/commit/ffd77ef7fb512c5d7767fd263d1d47e9e70666fd)   
author: underscorediscovery   
date: Sat Jan 18 2014 20:21:44 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; fixing generator to leave links to existing stuff alone</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [9b8a87e766](https://github.com/underscorediscovery/luxe/commit/9b8a87e766d5d3277951fc661f56e4d3f6304b8c)   
author: underscorediscovery   
date: Sat Jan 18 2014 19:14:33 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tests; base64 using the api instead</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [d7970c2981](https://github.com/underscorediscovery/luxe/commit/d7970c29818fbddfdc08a0ec4c977b93b8095219)   
author: underscorediscovery   
date: Sat Jan 18 2014 19:11:40 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Input; Propogating all event types (gamepad, touch, keys, mouse) to the entities in the default scene, and propogating them to all entity children and components.</li><li>Utils; adding Base64 accessor on the utils wrapper as well</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [1c61956a6d](https://github.com/underscorediscovery/luxe/commit/1c61956a6dcc1d68dc7fbbeada81128cd3a974ac)   
author: underscorediscovery   
date: Sat Jan 18 2014 17:41:44 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>API; Screen; Adding Luxe.screen.mid for easy access to that</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [df0d086354](https://github.com/underscorediscovery/luxe/commit/df0d086354e0ff85d8acbd0860d5c168c2e8c673)   
author: underscorediscovery   
date: Sat Jan 18 2014 17:38:54 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Base64; Utils; Adding base64 as it's quite useful for many things</li><li>mend</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [6abdd1bd16](https://github.com/underscorediscovery/luxe/commit/6abdd1bd16f69f99c6ced7e90a46818ac6bac314)   
author: underscorediscovery   
date: Sat Jan 18 2014 17:38:27 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Base64; Utils; Adding base64 as it's quite useful for many things</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [66de2ddef6](https://github.com/underscorediscovery/luxe/commit/66de2ddef658e21005fb448166c08780c6f3e454)   
author: underscorediscovery   
date: Sat Jan 18 2014 15:13:13 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Rings; spaces wtf</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [90217a2c89](https://github.com/underscorediscovery/luxe/commit/90217a2c890609c3dd2e44616fb93f5e3c6dab1c)   
author: underscorediscovery   
date: Sat Jan 18 2014 02:43:26 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tilemaps; adding more import flags, backgroundcolor and version</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [b24489b99e](https://github.com/underscorediscovery/luxe/commit/b24489b99eaaed659a2edf61d02b5a664e848210)   
author: underscorediscovery   
date: Sat Jan 18 2014 02:39:17 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tilemaps; Adding JSON importing and fixes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [8c0185de1a](https://github.com/underscorediscovery/luxe/commit/8c0185de1a25f80779b4f9b8b454c75f3b0e28be)   
author: underscorediscovery   
date: Sat Jan 18 2014 01:01:54 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tilemaps; Tiled; Adding object groups and shape imports, drawing some of them in the test_tiles demo as well.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [0a7b2ceaa2](https://github.com/underscorediscovery/luxe/commit/0a7b2ceaa281a3521cae9b29d0732c557fe9a362)   
author: underscorediscovery   
date: Fri Jan 17 2014 23:17:12 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tests; renamed test_tiled to test_tiles because it covers more</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [a45c850352](https://github.com/underscorediscovery/luxe/commit/a45c8503527d8770a633d64dd38a8c866eeeb27b)   
author: underscorediscovery   
date: Fri Jan 17 2014 23:15:12 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tilemaps; Adding tile map base class for luxe, demonstrated in the test_tiles example atm</li><li>mend</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [7311945014](https://github.com/underscorediscovery/luxe/commit/731194501478ea58c08ae3c8730cc2ef2a41ef56)   
author: underscorediscovery   
date: Fri Jan 17 2014 23:15:03 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tilemaps; Adding tile map base class for luxe, demonstrated in the test_tiles example atm</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [49cc708eb3](https://github.com/underscorediscovery/luxe/commit/49cc708eb3012f36b442e27342fcc6f830baad74)   
author: underscorediscovery   
date: Fri Jan 17 2014 13:07:41 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Letter5; fixing defaults for now</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [e2c3f2cc16](https://github.com/underscorediscovery/luxe/commit/e2c3f2cc168e5061dbbcac3f897307b69025f4d5)   
author: underscorediscovery   
date: Fri Jan 17 2014 12:57:50 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tiled; Adding prelim tilemap classes and getting started on proper tilemap support</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [7b8d2171aa](https://github.com/underscorediscovery/luxe/commit/7b8d2171aa17d4087124ceef489a06195040a426)   
author: underscorediscovery   
date: Fri Jan 17 2014 12:57:50 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Letter5; Fixing bugs in restarting the game and making the board size more flexible</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [90bd0f2167](https://github.com/underscorediscovery/luxe/commit/90bd0f2167eaf57ee1f61bd1426b6105b55aa950)   
author: underscorediscovery   
date: Fri Jan 17 2014 12:57:50 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Entity; Sprite; Fixing weird condition where calling .destroy directly calls itself twice, now it defers the first to allow the internal destroy to do it's job.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [2ddd0f6a67](https://github.com/underscorediscovery/luxe/commit/2ddd0f6a67276bfe5adc4b5d07ef05bcbc7940f8)   
author: Sven Bergström   
date: Tue Jan 14 2014 19:13:08 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Update readme.md</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [c4b8a0e2c1](https://github.com/underscorediscovery/luxe/commit/c4b8a0e2c104c5c0fa009cf43512417ccc6e4501)   
author: Sven Bergström   
date: Tue Jan 14 2014 19:12:30 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Update readme.md</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [cf8e54d7f7](https://github.com/underscorediscovery/luxe/commit/cf8e54d7f791dae1c059f88751da2abe97b61250)   
author: underscorediscovery   
date: Mon Jan 13 2014 22:39:34 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>CircleGeometry; Adding start_angle and end_angle so better arcs can be drawn.</li><li>Rings; fixing accidental shoot stuff and refactoring input to work better (see readme also)</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [f0b514ccea](https://github.com/underscorediscovery/luxe/commit/f0b514ccea53c4c2ee7e9972a8bd9267407c5da8)   
author: underscorediscovery   
date: Sat Jan 11 2014 02:46:49 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Rings; Fixing bugs in rings</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [9c14d237fa](https://github.com/underscorediscovery/luxe/commit/9c14d237fa1b54b769f5a823f4e8eb9cc44604b1)   
author: underscorediscovery   
date: Sat Jan 11 2014 02:37:22 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Cleanup; Removing weird code</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [4e753bc2c0](https://github.com/underscorediscovery/luxe/commit/4e753bc2c0fc420ddcecf4d947c24772867f21c4)   
author: underscorediscovery   
date: Sat Jan 11 2014 02:34:28 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Audio; play was missing loop, and start functions</li><li>Sprite; refactored to use Geometry instead of QuadGeometry, temporary fixes required for casting though</li><li>Rings; Tons of refactoring and new input model, adding audio and music</li><li>Pathing; adding a test path function, broken cos of heap implementation</li><li>Structural; temp Heap class</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [227153ce45](https://github.com/underscorediscovery/luxe/commit/227153ce456df8ed7f95ab75997e164efef58d5a)   
author: underscorediscovery   
date: Sun Dec 29 2013 05:15:58 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Rings; Adding reset on end</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [38e4b4b825](https://github.com/underscorediscovery/luxe/commit/38e4b4b8251390ebaa85e65b2f38fc9690d39f07)   
author: underscorediscovery   
date: Sun Dec 29 2013 04:24:23 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Updating changes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [3daa4703a7](https://github.com/underscorediscovery/luxe/commit/3daa4703a74719d8653e9035ac5b270fac3ea80f)   
author: underscorediscovery   
date: Sun Dec 29 2013 04:23:54 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Sprite; fixing rotation_z on creation, adding no_scene flag for not added to scene, clearer warning.</li><li>Tween; changing default tween to something more sensible and not the most expensive, slowest one</li><li>Utils; maths wrap_angle function from rings</li><li>Rings; adding states so that levels can be implemented, added first completable challenge level with progress indicator, intro image, end image, fixing window flags</li><li>CompositeGeometry; adding set_rotation because it was missing</li><li>Structural; Pool class added to core, still needs some tweaks and functions but useful</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [75ac463c82](https://github.com/underscorediscovery/luxe/commit/75ac463c82419e76b74c3e9d57876583917c74c5)   
author: underscorediscovery   
date: Fri Dec 27 2013 21:55:33 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; Changes update</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [7c2765bbd8](https://github.com/underscorediscovery/luxe/commit/7c2765bbd8de2d4554c34c702b9764552a01e4e9)   
author: underscorediscovery   
date: Fri Dec 27 2013 01:31:39 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Camera; removing temporary rotation bug for test</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [dee7c45326](https://github.com/underscorediscovery/luxe/commit/dee7c453266d3984963c627b186ead9d55d2cbfa)   
author: underscorediscovery   
date: Fri Dec 27 2013 00:32:35 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Camera; fixing endless loop in rotation setter.</li><li>Tests; camera views - Adding cameras to scene so their shake gets updated.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [f6f1d3f777](https://github.com/underscorediscovery/luxe/commit/f6f1d3f7774021b94a8a386bbdebcd287815abbb)   
author: underscorediscovery   
date: Thu Dec 26 2013 21:58:46 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tests; Camera views, making each view have their own zoom at start</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [fdc73edcc6](https://github.com/underscorediscovery/luxe/commit/fdc73edcc648e5812c3a4495b7e09f5484763cfc)   
author: underscorediscovery   
date: Thu Dec 26 2013 21:42:22 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tests; Adding multi viewport test case for example</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [73953d95ec](https://github.com/underscorediscovery/luxe/commit/73953d95ec2a3f0f92afd86b1ea19fe8d209cad0)   
author: underscorediscovery   
date: Thu Dec 26 2013 21:42:06 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tests; Adding multi viewport test case for example</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [7aa7f07b52](https://github.com/underscorediscovery/luxe/commit/7aa7f07b528ee49af32279c1f09e73832d8939b5)   
author: underscorediscovery   
date: Thu Dec 26 2013 21:41:45 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Batcher; Changing how batchers are stored, just simple arrays and sort on insert for simplicity.</li><li>Camera; fixing how viewport doesn't adjust center, fixing how viewport is applied in the rendering and all other viewport related junk.</li><li>API; adding create batcher function which helps in setting up a batcher and camera for you</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [735215f4fd](https://github.com/underscorediscovery/luxe/commit/735215f4fd56e58b2d445e45e09502d867db4cef)   
author: underscorediscovery   
date: Thu Dec 26 2013 18:17:38 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Camera; fixing rotation breaking on not ready view.</li><li>Tests; Tiled - fixing html5 late load textures, and camera bounds</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [d8256bfffd](https://github.com/underscorediscovery/luxe/commit/d8256bfffdfdfa141f4d94ca9ec5f67cea24d262)   
author: underscorediscovery   
date: Thu Dec 26 2013 17:35:54 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Camera; luxe - adding get / set rotation to pass the rotation to the view as quat instead of euler</li><li>Camera; luxe/phoenix - screen_point_to_world / world_point_to_screen conversions</li><li>Tests; camera; world conversion example and stuff, adding drag to rotate (still not complete)</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [aa1b5ee9a7](https://github.com/underscorediscovery/luxe/commit/aa1b5ee9a75ff1103b4df2f437d9c62bdedbc5ba)   
author: underscorediscovery   
date: Wed Dec 25 2013 05:52:31 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Cameras; fixing bunches of stuff related to positions, and scale, adding zoom and making position always interact in world coordinates for ortho. Still work in prograss as the focus function needs to account for scale as does the mouse in the example. Also needs wrapping based on 3d/2d, but much better already.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [a72b22ca3a](https://github.com/underscorediscovery/luxe/commit/a72b22ca3acc47072012af7bcceccdc1496af8bc)   
author: underscorediscovery   
date: Tue Dec 24 2013 13:39:11 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Vector; adding ignore listeners flag for updating the position without a call to set_pos</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [10323c07d3](https://github.com/underscorediscovery/luxe/commit/10323c07d308c7cd9edcc2f255f67c0959cc96ed)   
author: underscorediscovery   
date: Tue Dec 24 2013 13:38:47 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Camera; phoenix camera features working properly now, but needs to be shielded for ortho vs perspective</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [394e4bb065](https://github.com/underscorediscovery/luxe/commit/394e4bb065bc97d4a0442629359c9d37d2dc7a4c)   
author: underscorediscovery   
date: Mon Dec 23 2013 23:32:26 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Camera; pushing preliminary fixes for redoing the views</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [57fedb0a01](https://github.com/underscorediscovery/luxe/commit/57fedb0a011e41df600ec1c4becc8375da563d45)   
author: underscorediscovery   
date: Mon Dec 23 2013 23:30:06 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Camera; pushing preliminary fixes for redoing the views</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [6c33ed75ae](https://github.com/underscorediscovery/luxe/commit/6c33ed75ae74b5e1fd8ec040d054b0ff4127d4f9)   
author: underscorediscovery   
date: Mon Dec 23 2013 22:23:59 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>SpriteAnimation; Fixing timing bugs not switching over when switching animations</li><li>SpriteAnimation; Fixing regex for framesets allowing whitespace, like 1 - 12 vs 1-12,</li><li>Found thanks to @korvgubben31</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [bde2c7b644](https://github.com/underscorediscovery/luxe/commit/bde2c7b6448522a935edec38ff6705db6853f290)   
author: underscorediscovery   
date: Mon Dec 23 2013 05:36:56 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Utils; Adding a find_assets_image_sequence( _name:String, _ext:String='.png', _start:String='1' ), for the animation system</li><li>SpriteAnimation; Adding image from image_sequences, as well as filter_type for the image sequences.</li><li>API; Adding Luxe.loadTextures( _ids:Array<String>, ?_onloaded:Array<Texture>->Void, ?_silent:Bool=false )</li><li>API; Adding a silent flag to loadTexture and loadTextures to keep from printing when needed.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [9622c93b5d](https://github.com/underscorediscovery/luxe/commit/9622c93b5d386fe3529d76e911dd5d039c4efcfc)   
author: underscorediscovery   
date: Mon Dec 23 2013 00:33:31 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Sprite Animation; adding hold frame parser, syntax is ['10','hold 5','11 hold 5'], where 'hold (count)' will hold on the previous frame in the set (count) times, and '(frame) hold (count)' will use the frame specified. Solves #24</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [0c3c0e2171](https://github.com/underscorediscovery/luxe/commit/0c3c0e2171574ee4dfd78c1c5af3b4e1e490e506)   
author: underscorediscovery   
date: Sun Dec 22 2013 23:39:01 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tests; RTT cleaning the test beds a bit.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [06f898a647](https://github.com/underscorediscovery/luxe/commit/06f898a6470829ae1a104e866fe6d85164214d76)   
author: underscorediscovery   
date: Sun Dec 22 2013 23:39:01 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Sprite Animation; Resolve #23, Adding frameset ranges, forward and reverse, works in groups (see tests/test_sprite_animation)</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [80897ea27b](https://github.com/underscorediscovery/luxe/commit/80897ea27bb91f81598ee2bd165d21b3e4d5001e)   
author: Sven Bergström   
date: Sun Dec 22 2013 18:19:40 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Update haxelib.json</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [ced26872c4](https://github.com/underscorediscovery/luxe/commit/ced26872c4070b299a692bd971a4b0bb460758db)   
author: underscorediscovery   
date: Sun Dec 22 2013 02:25:11 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Updating changes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [fa08d52777](https://github.com/underscorediscovery/luxe/commit/fa08d52777c06ea86173ab675b3abd7007ba8635)   
author: underscorediscovery   
date: Sun Dec 22 2013 02:24:35 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Vector; Adding set_xyzw, set_xy, and set_xyz for optimized setting when you know what will be set.</li><li>QuadGeometry; Fixing bugs where resize would increment the position based on newer methods of rendering</li><li>Tests; sprite test adding resize tests for seeing that resizing is behaving as expected</li><li>Tests; particle test updated to match latest particle class</li><li>Sprite; making it so that when size is called, if centered, and no custom origin has been specified, it will adjust the origin for you</li><li>Particles; fixing bugs and starting to cleanup some more. Added end_speed for slow down impact particle types</li><li>Geometry; fixing matrix.compose being per vertex instead of once. Updating to parity with html5 api (which existed all along, I just wasn't aware)</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [66ccb8c6d9](https://github.com/underscorediscovery/luxe/commit/66ccb8c6d921cc7defacd1a52302a09f066ac24a)   
author: underscorediscovery   
date: Sat Dec 21 2013 21:37:51 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Collision; cleaning up tests and shapedrawer class</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [05ba4f7c2c](https://github.com/underscorediscovery/luxe/commit/05ba4f7c2c737cbee5499654fdac8dcbc6d87662)   
author: underscorediscovery   
date: Sat Dec 21 2013 21:33:59 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Collision; moving the collision library into the luxe core, resolves #16</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [28f55cb216](https://github.com/underscorediscovery/luxe/commit/28f55cb21649e168c79f0a3edf891a8d945dc52b)   
author: underscorediscovery   
date: Sat Dec 21 2013 17:47:46 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; updating changes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [f59ce1e765](https://github.com/underscorediscovery/luxe/commit/f59ce1e765f6cf364c3c3a3e6a83b7db5edd910b)   
author: underscorediscovery   
date: Sat Dec 21 2013 17:47:20 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tests; Fixing draw test from double new lines</li><li>Docs; Updating docs to match test</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [fd23fdf179](https://github.com/underscorediscovery/luxe/commit/fd23fdf1797f1dbd5bd65ead0f02dad49a6e36b0)   
author: underscorediscovery   
date: Sat Dec 21 2013 07:01:36 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Performance; fixes to mobile performance being thrashed by profiler views, as well as various code fixes that were costing on mobile.</li><li>Tween; Making tweens have a .timescale( trueorfalse ) flag so they obey Luxe.timescale. This let's you use global timescale to slow down tweens as well.</li><li>Rings; Making enemies, projectiles and player all obey timescale. Making player drag slow time down, making the input way better for desktop/mobile.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [2d53be053a](https://github.com/underscorediscovery/luxe/commit/2d53be053a116f020968f250ca8700069fe12d7d)   
author: underscorediscovery   
date: Sat Dec 21 2013 01:32:09 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Haxelib; fixing bug by giving haxelib what it wants (derp)</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [b41b106c2a](https://github.com/underscorediscovery/luxe/commit/b41b106c2a0ce6653b2d99de9e1f3e37325de81b)   
author: underscorediscovery   
date: Fri Dec 20 2013 23:25:12 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Squads; tidying up the code to use hxcollision still...</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [31a725a1ab](https://github.com/underscorediscovery/luxe/commit/31a725a1ab20cbfe4c7b22387897bf02c5b9c3c3)   
author: underscorediscovery   
date: Fri Dec 20 2013 21:15:15 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Squads; Updating projectdata out of the way for now</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [636a6fd4ee](https://github.com/underscorediscovery/luxe/commit/636a6fd4ee0d8cb8cd0fb12ca77dd9b77e91c6db)   
author: underscorediscovery   
date: Fri Dec 20 2013 21:13:48 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Squads; updating project data for now</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [c2758837bf](https://github.com/underscorediscovery/luxe/commit/c2758837bfbe2715ba149df837f2155b0c1ca764)   
author: underscorediscovery   
date: Fri Dec 20 2013 21:13:04 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Entity; fixing bugs with how set parent was calling add_child and vice versa</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [ea2be63f1a](https://github.com/underscorediscovery/luxe/commit/ea2be63f1a5b85503eb1178a1733f9c98617c80b)   
author: underscorediscovery   
date: Fri Dec 20 2013 21:08:24 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; removing excess files and adding some api's</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [5b90f29b41](https://github.com/underscorediscovery/luxe/commit/5b90f29b41e5f5732e142627c986f30608114971)   
author: underscorediscovery   
date: Fri Dec 20 2013 21:08:04 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; removing excess files and adding some api's</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [5a1da9239e](https://github.com/underscorediscovery/luxe/commit/5a1da9239eba5ab14926820e3251f5c05e527621)   
author: underscorediscovery   
date: Fri Dec 20 2013 18:25:38 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; fixing minor issue with formatting on events guide</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [0d02a1f46e](https://github.com/underscorediscovery/luxe/commit/0d02a1f46e89e30cabf44bf467099b8869e4e6aa)   
author: underscorediscovery   
date: Fri Dec 20 2013 18:24:30 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; fixing minor issue with formatting on shader guide</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [24fa917cfc](https://github.com/underscorediscovery/luxe/commit/24fa917cfcb609d374693080f69dd7a5441fa353)   
author: underscorediscovery   
date: Fri Dec 20 2013 18:21:39 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; Adding shader guide details</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [02e5774fad](https://github.com/underscorediscovery/luxe/commit/02e5774fadc998f02f43bda85aa0dd968a391032)   
author: underscorediscovery   
date: Fri Dec 20 2013 17:11:51 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Clarity; Cleanup; Fix #29, actually committed as 609f096 but mistakes. This commit makes shutdown -> destroy consistent, and startup is now always named init like it should be on the core</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [0e63842378](https://github.com/underscorediscovery/luxe/commit/0e63842378bc01e7b813e58ae8ca5eb1f6c65b5b)   
author: underscorediscovery   
date: Fri Dec 20 2013 17:10:14 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Updating changes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [0a7044095b](https://github.com/underscorediscovery/luxe/commit/0a7044095bad5780706e8c2fe25622427216200e)   
author: underscorediscovery   
date: Fri Dec 20 2013 17:08:21 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Update changes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [10a459b534](https://github.com/underscorediscovery/luxe/commit/10a459b5347ce676e2eb3ab621d2fdfc272ca968)   
author: underscorediscovery   
date: Fri Dec 20 2013 16:50:32 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; updated changes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [e61fa61af6](https://github.com/underscorediscovery/luxe/commit/e61fa61af6e7f15de6ae74c77e05c28d8f03949f)   
author: underscorediscovery   
date: Fri Dec 20 2013 16:50:09 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Events; Components; Fix #32 - typed data for init when using .add( Type, name, data )</li><li>Docs; Updating event guide code and descriptions</li><li>Camera; Fixing bug introduced yesterday where screenshake would change/move the camera position, instead of affecting it</li><li>Events; Tidying up the shutdown / startup confusion</li><li>Events; Added a clear() command, fixes #31 but needs to be added to the tests</li><li>Tests; Camera; Added visual info to camera test</li><li>Tests; Components; Fixed and renamed the two component tests, still more to go</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [b75eb142be](https://github.com/underscorediscovery/luxe/commit/b75eb142be60ddf40f1ccc9c1aacbed2a980ea10)   
author: underscorediscovery   
date: Fri Dec 20 2013 03:17:44 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; adding events guide, adding more guides to the list, polishing other guides etc and fixing the generator timestamp system</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [0884698c13](https://github.com/underscorediscovery/luxe/commit/0884698c139eef9246a9e064496e2e21e94a09d6)   
author: underscorediscovery   
date: Thu Dec 19 2013 03:40:55 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tests; Adding test_tween</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [c4648f41c2](https://github.com/underscorediscovery/luxe/commit/c4648f41c2540c8cfea5ce74d0fa774c45f1e28e)   
author: underscorediscovery   
date: Thu Dec 19 2013 02:02:30 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tests; Adding camera test project</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [1398edd7b1](https://github.com/underscorediscovery/luxe/commit/1398edd7b108b87fe0f1cca6435b0a1bbccb0828)   
author: underscorediscovery   
date: Thu Dec 19 2013 01:14:16 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tests; Adding font test</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [05da0251cb](https://github.com/underscorediscovery/luxe/commit/05da0251cb3de3941ae2f0d971e38da3b7b6e3ed)   
author: underscorediscovery   
date: Thu Dec 19 2013 00:54:39 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tests; Adding asset test, but only covers text/bytes for now because the rest are all over the place.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [582c759385](https://github.com/underscorediscovery/luxe/commit/582c7593852cb249afbb2b4a1b79ec3459b391b8)   
author: underscorediscovery   
date: Thu Dec 19 2013 00:37:52 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>API; Adding addGroup for default batcher.</li><li>Tests; adding groups and blendmode test</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [9404ae5ea4](https://github.com/underscorediscovery/luxe/commit/9404ae5ea4ac7089fa9410c1648e9dc01782a8a5)   
author: underscorediscovery   
date: Wed Dec 18 2013 19:43:01 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Cleanup; removing Derp class in test_particles. Updating changes docs.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [f89bc44bd7](https://github.com/underscorediscovery/luxe/commit/f89bc44bd7e06ce85ec4cdca522bd93819cdeff3)   
author: underscorediscovery   
date: Wed Dec 18 2013 19:38:55 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Entity; fixing sprite not calling parent destroy, as well as fixing direct calling of entity internal functions</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [4bb840e165](https://github.com/underscorediscovery/luxe/commit/4bb840e165c9d29303796922aaab3288a934f41f)   
author: underscorediscovery   
date: Tue Dec 17 2013 16:09:33 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Structural; Adding new classe from structural</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [64047a3a56](https://github.com/underscorediscovery/luxe/commit/64047a3a56ce3a1c5af4c67d297b708686b0f3fb)   
author: underscorediscovery   
date: Tue Dec 17 2013 14:52:52 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; Adding changes list to the docs from git history</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [8d5e4202b4](https://github.com/underscorediscovery/luxe/commit/8d5e4202b4d1a331a99bd8dff5a379831b379b2c)   
author: underscorediscovery   
date: Mon Dec 16 2013 22:08:40 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Modes; Renaming to States, and changing it across all projects</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [b381e1a6e3](https://github.com/underscorediscovery/luxe/commit/b381e1a6e3456f5ad6a50502d9560005aef177c5)   
author: underscorediscovery   
date: Fri Dec 13 2013 19:22:06 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding core profiles and testing some threading on luxemark for no good reason</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [909a381070](https://github.com/underscorediscovery/luxe/commit/909a3810703f02ea78734a49a9c989c63ef5becc)   
author: underscorediscovery   
date: Wed Dec 11 2013 21:56:50 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Api; adding a fixed timestep option , set Luxe.fixed_timestep to a fixed time in seconds to keep a fixed dt (this allows you to use dt and alternate )</li><li>Debug; Profiler; Adding profiler view</li><li>Core; Switching out uuid() to uniqueid(), it's significantly faster (see tests/test_uuid)</li><li>Batcher; Fixing exploding verts crashing, submitting only the portions of the vertlist that change.</li><li>HTML5; Fixing depth buffer flags breaking html5 builds</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [1780058668](https://github.com/underscorediscovery/luxe/commit/17800586682678de60cc5032905c97be80648bb6)   
author: Sven Bergström   
date: Wed Dec 11 2013 15:16:12 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Update README.md</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [b03a4ce395](https://github.com/underscorediscovery/luxe/commit/b03a4ce3957e5a22b596df6914faf16023b60798)   
author: underscorediscovery   
date: Tue Dec 10 2013 23:10:19 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixing simplest</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [b602b84165](https://github.com/underscorediscovery/luxe/commit/b602b841654f0ab69213e264f8c6f27f442735c0)   
author: underscorediscovery   
date: Tue Dec 10 2013 23:07:09 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Lots of migration for latest lime</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [a256e7ebc2](https://github.com/underscorediscovery/luxe/commit/a256e7ebc29cc281f9a6eabf415d51d0fee1291f)   
author: underscorediscovery   
date: Sun Dec 01 2013 05:50:23 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Renderer; no longer optional, for now, to play nicely with neko.</li><li>Neko; Various ridiculous fixes™ to play nicely with neko. At least the samples are working, but mouse is exploding still.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [15450dfbb6](https://github.com/underscorediscovery/luxe/commit/15450dfbb6f551650fa3885a53c4bcfb358c6eb7)   
author: underscorediscovery   
date: Sat Nov 30 2013 19:43:58 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; more event fixes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [21d3291196](https://github.com/underscorediscovery/luxe/commit/21d3291196adf4e4e573bc9fe6f9a41253aacd3a)   
author: underscorediscovery   
date: Sat Nov 30 2013 19:36:44 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; fixing events docs</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [3fea05c122](https://github.com/underscorediscovery/luxe/commit/3fea05c122d571957306ddd0e5b050dab3b75bd7)   
author: underscorediscovery   
date: Sat Nov 30 2013 19:30:49 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Editor; Updating the editor doc generator to spit out usable JSON;</li><li>Docs; Adding a bunch of classes docs for now</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [44107beac3](https://github.com/underscorediscovery/luxe/commit/44107beac3dcfdee2761d531dfb7da1d4f42d027)   
author: underscorediscovery   
date: Sat Nov 30 2013 08:24:48 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Editor; fixing latest version for haxe.</li><li>Input; TDCamera; fixing onmouseup wheel events</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [5209098760](https://github.com/underscorediscovery/luxe/commit/52090987601a0f63b8824ec4700cbf503ed9069f)   
author: underscorediscovery   
date: Sat Nov 30 2013 07:23:27 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; Adding text api</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [7b69c026c1](https://github.com/underscorediscovery/luxe/commit/7b69c026c1a04a743f5e92e25dc9fcc445d5d047)   
author: underscorediscovery   
date: Sat Nov 30 2013 06:50:00 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixing bug in Quaternion</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [75da940030](https://github.com/underscorediscovery/luxe/commit/75da940030b82589637fbe778a001ff0aa8395b6)   
author: underscorediscovery   
date: Sat Nov 30 2013 06:48:31 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; Adding Matrix4 docs and json file for that</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [9524c558ec](https://github.com/underscorediscovery/luxe/commit/9524c558ec6f2ff8aea2cb08c3dbd50cdd1e429b)   
author: underscorediscovery   
date: Sat Nov 30 2013 05:48:02 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; Adding pre generator for API's to ease the generation</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [259bee4562](https://github.com/underscorediscovery/luxe/commit/259bee4562bdee3f60b16ea46eaea5ceb4aecee0)   
author: underscorediscovery   
date: Sat Nov 30 2013 04:16:47 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Utils; Reorganising the utility classes to make sense, fixing up doc lists more</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [380635b8c4](https://github.com/underscorediscovery/luxe/commit/380635b8c40a460b54a25fef667395c9c326703e)   
author: underscorediscovery   
date: Fri Nov 29 2013 21:12:14 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; adding git ignore for node_modules</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [59540ee9b4](https://github.com/underscorediscovery/luxe/commit/59540ee9b4a6749e02ef75a03efd6ed89e6534b0)   
author: underscorediscovery   
date: Fri Nov 29 2013 21:11:49 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; Removing source modules. Adding live demo embeds.</li><li>Tests; Fixing stack test.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [26f6876057](https://github.com/underscorediscovery/luxe/commit/26f687605743d2024c1fa7d7efd553d11c9ecf9b)   
author: underscorediscovery   
date: Fri Nov 29 2013 19:00:08 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Color; Fixing bug I just added >.></li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [a84823466e](https://github.com/underscorediscovery/luxe/commit/a84823466eedc60d65be3c003d12b84c65c96c4d)   
author: underscorediscovery   
date: Fri Nov 29 2013 18:58:05 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; Adding color guide and tweaks</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [d19ab952ee](https://github.com/underscorediscovery/luxe/commit/d19ab952ee61bf557879c54c3c3d9e2c7a43f0a7)   
author: underscorediscovery   
date: Fri Nov 29 2013 07:03:15 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; Adding tweening guides and more images to the guide info.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [ea55582247](https://github.com/underscorediscovery/luxe/commit/ea55582247e335f6bf04f77e90123a29885f0631)   
author: underscorediscovery   
date: Thu Nov 28 2013 23:41:05 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; Adding more guides and updates to docs. Renaming joystick functions to gamepad</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [dc794cac42](https://github.com/underscorediscovery/luxe/commit/dc794cac42de18efb5d0e6bfc1702f8de54b2871)   
author: underscorediscovery   
date: Thu Nov 28 2013 07:46:42 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Updating html5 logo</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [91054da84e](https://github.com/underscorediscovery/luxe/commit/91054da84edd5000ccfe088a03078da06d75269e)   
author: underscorediscovery   
date: Thu Nov 28 2013 07:31:10 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding better sized icons</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [2ea3e3092c](https://github.com/underscorediscovery/luxe/commit/2ea3e3092c813baaf1af59f96802dc38fe44afab)   
author: Sven Bergström   
date: Thu Nov 28 2013 07:27:30 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Update README.md</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [e89f4ba94c](https://github.com/underscorediscovery/luxe/commit/e89f4ba94c49f2a23ab894f9d5ff78a90f6c2f48)   
author: underscorediscovery   
date: Thu Nov 28 2013 07:25:56 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; Adding bunches of updates, setup guides, filling in links, tidying up css, index files etc</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [465482136e](https://github.com/underscorediscovery/luxe/commit/465482136e591c38b89239552f07a8be3fce8162)   
author: underscorediscovery   
date: Thu Nov 28 2013 01:22:22 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Merge branch 'master' of github.com:underscorediscovery/luxe</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [ac5b7e9f88](https://github.com/underscorediscovery/luxe/commit/ac5b7e9f8868d1870d5bc724959e0b3e9ec525ad)   
author: underscorediscovery   
date: Thu Nov 28 2013 01:22:15 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>templates; renaming to be proper with tools.</li><li>Texture; Fixing NME references to mention lime instead</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [15e269626a](https://github.com/underscorediscovery/luxe/commit/15e269626a27e7412d267640f2ef1a10714ec0bd)   
author: Sven Bergström   
date: Thu Nov 28 2013 01:06:16 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Update README.md</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [5fdc507a34](https://github.com/underscorediscovery/luxe/commit/5fdc507a3467083482e5362c5705e32d9ae03931)   
author: Sven Bergström   
date: Thu Nov 28 2013 01:04:27 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Updating readme for latest repos</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [03f6bca0c4](https://github.com/underscorediscovery/luxe/commit/03f6bca0c4882ef0dfa64c9dd2c96060a9570c77)   
author: underscorediscovery   
date: Thu Nov 28 2013 00:33:57 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>docs; Generator redone to not stall constantly, take better flags and options for becoming generic.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [2756f11511](https://github.com/underscorediscovery/luxe/commit/2756f1151150814f6a2a188e19d0d74be139e8aa)   
author: underscorediscovery   
date: Tue Nov 26 2013 06:43:00 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>General; Adding a simple benchmark test for fun</li><li>Batcher; Capping maximum dynamic batches to meet the size of buffers to avoid crashing.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [4e97c31d08](https://github.com/underscorediscovery/luxe/commit/4e97c31d0833e724b7dbb8e3cd23161c543bfe5f)   
author: underscorediscovery   
date: Tue Nov 26 2013 04:43:23 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>ArcGeometry; Adding an arc geometry and arc rendering;</li><li>CircleGeometry; Adding end_angle constraint for drawing non complete circles</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [b2211fe378](https://github.com/underscorediscovery/luxe/commit/b2211fe378cea1096280d0f52ff44c8acf831b85)   
author: underscorediscovery   
date: Mon Nov 25 2013 22:36:14 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>RenderState; moving to unique class</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [a1b9b804ea](https://github.com/underscorediscovery/luxe/commit/a1b9b804eaa2ef061a6dae217d2ff236cddc2b43)   
author: underscorediscovery   
date: Mon Nov 25 2013 07:25:48 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Renderer; Adding state manager type thing that won't set the same state twice, and corresponding updates. Luxe.renderer.state.stuff</li><li>Batcher; Updated the way batching happens, properly streaming data to the buffers instead of recreating them each time etc.</li><li>Batcher; Adding double buffering for the VBO's to avoid desync issues on iOS or other platforms</li><li>Shaders; forcing location of fixed attributes so they can be reused without setting them the entire time</li><li>Batcher; aligning verts/normals/tcoords/colors to 4 floats of 4 bytes each</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [dcb005cefd](https://github.com/underscorediscovery/luxe/commit/dcb005cefdc33da1c373c4e92feaa91f19dc5730)   
author: underscorediscovery   
date: Sun Nov 24 2013 15:58:04 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>TouchEvent; adding position the same way the mouse event has it. Note this is fake mouse on the touch events and won't account for multitouch(yet)</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [a27ce844fc](https://github.com/underscorediscovery/luxe/commit/a27ce844fc3e538308e67641051034fea5dd2139)   
author: underscorediscovery   
date: Sun Nov 24 2013 05:06:13 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding rings project</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [71e5fed55c](https://github.com/underscorediscovery/luxe/commit/71e5fed55c5e3bff77ff8e404f707dbfcdca7ec6)   
author: underscorediscovery   
date: Sun Nov 24 2013 01:37:02 GMT-0330 (NST)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Text; Adding locked to text, propogating it to geometry to keep text static buffers.</li><li>Structural; moving luxe/structures to luxe/structural because of the library name</li><li>Batcher; Massive rewrite for the method of handling the arrays and batching.</li><li>Shader; Moved the attributes into the shaders for less setting of redundant state</li><li>Utils; Adding utils for phoenix to clean up batcher code</li><li>CompositeGeometry; locked geometry value passing</li><li>Geometry; adding different method of batching for new float32arrays</li><li>Letter5; used for testing geometry on mobile - but no longer going to be porting right now</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [64bed1a6b1](https://github.com/underscorediscovery/luxe/commit/64bed1a6b1412560deacf4b3fed9d4279d6abae1)   
author: underscorediscovery   
date: Tue Oct 15 2013 07:01:15 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Templates ; Fixing support for latest openfl-tools</li><li>Debug; fixing bug and showing memory usage on native platforms in title</li><li>Geometry; changed to uv set of 8 predefined fixed variables (lowers allocations at runtime)</li><li>General; more cleanup of completion for classes</li><li>HTML5; fix build errors because of serialization code</li><li>Batcher; In flux: Changing vert lists stategies to lower allocation costs</li><li>HTML5; fixing bug where textures weren't returned correctly from cache cos of race conditions</li><li>Texture; fixing onloaded for cached textures being called (wouldn't before)</li><li>TextureCoord; adding texturecoordset class and adding .set function for uvs</li><li>Letter5; bunch of various fixes and clean up, also adding touch/mouse input</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [23f44f59cc](https://github.com/underscorediscovery/luxe/commit/23f44f59cc2059dffc1c08eaf38ff2ea5657a24e)   
author: underscorediscovery   
date: Sun Oct 06 2013 05:11:14 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>fixing project name and file info for guide 3</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [e9007f3bd3](https://github.com/underscorediscovery/luxe/commit/e9007f3bd31bc4cf9e1733ece193a9e4f17f2e64)   
author: underscorediscovery   
date: Sun Oct 06 2013 05:10:46 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>adding 4 finger tap to show console, 3 finger tap to toggle console</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [52e698c3d4](https://github.com/underscorediscovery/luxe/commit/52e698c3d4073d6d76027ec06bd97021469df4e7)   
author: underscorediscovery   
date: Sat Oct 05 2013 05:56:10 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Texture; default to edge clamping, so NPOT works on iOS.</li><li>Letter5; adding fixes for skins, adding touch inputs and testing on device.</li><li>Modes; adding touch event forwarding</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [d3508d1043](https://github.com/underscorediscovery/luxe/commit/d3508d1043c2a7ebe48949aa6bef87423c8f9ea7)   
author: underscorediscovery   
date: Fri Oct 04 2013 04:01:42 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixing comment mistake</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [6ed044de33](https://github.com/underscorediscovery/luxe/commit/6ed044de33320ec72133e20b2372c57038aff33d)   
author: underscorediscovery   
date: Fri Oct 04 2013 02:56:20 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Editor; Conceptually messing with using hscript to show dynamic inspector fields without rebuilding. Works well!</li><li>Debug; Fixing trouble in the counting of stats, and the updating of geometry when disabled. Only refreshes when visible/required now.</li><li>Debug; Removing troublesome batch list viewer that was leaking geometry, and generally slowing things down. Proper visualise tools are better.</li><li>Batcher;Geometry; Switching to a more concise GeometryKey typedef as the key for the batcher. Saves memory and is less prone to errors on the compare side.</li><li>Batcher; Reworked and fixed (or, at least it appears to be fixed) recurring nightmare bug with geometry not being removed occasionally.</li><li>BitmapFont;Text; Removed kerning calls for now, this was making text jump around and not be consistently positioned. Text is infinitely cleaner because of this, but kerning is desirable so will be investigated  further in the near future.</li><li>BitmapFont; Switching from replacing an array of geom to directly inserting the array later, to be more stable and consistent.</li><li>ComplexGeometry; Adding a clear function to remove all quads quickly.</li><li>CompositeGeometry; Adding a .add( _batcher ) function for adding all items to a batcher easily.</li><li>Letter5; Tidying up and beginning to finish skin code for rest of port.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [aac6411805](https://github.com/underscorediscovery/luxe/commit/aac6411805a78f88d689e79b75d886070f75d00c)   
author: underscorediscovery   
date: Mon Sep 30 2013 06:59:13 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>adding icons</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [17f49d7ff3](https://github.com/underscorediscovery/luxe/commit/17f49d7ff3871a13c7ca7369a9f31bdab90ef379)   
author: underscorediscovery   
date: Mon Sep 30 2013 06:55:29 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; Adding class list and minor fixes to component guide.</li><li>General; Many classes tidying up public functions muddying up the completion and docs.</li><li>Editor; Adding tooltips, move/scale/rotate icons, adding some inspector functions to add controls to the inspector view.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [5141a91de1](https://github.com/underscorediscovery/luxe/commit/5141a91de140313d2caf08a99d6572e3a65a8b76)   
author: underscorediscovery   
date: Sun Sep 29 2013 06:26:39 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Guide; Adding fixes to the component samples, and finishing the guide for components.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [c1593c8e8b](https://github.com/underscorediscovery/luxe/commit/c1593c8e8b735b6815cd3e29f4bf07ef79dc3e30)   
author: underscorediscovery   
date: Sun Sep 29 2013 04:15:56 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>adding missing image</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [4b778fc415](https://github.com/underscorediscovery/luxe/commit/4b778fc415c6b10658212d9a55210635359c6ff1)   
author: underscorediscovery   
date: Sun Sep 29 2013 04:15:21 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Scene; Fixing bugs in how the entities are stored in the scene list. Updating guide docs.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [662b81a6fa](https://github.com/underscorediscovery/luxe/commit/662b81a6fab94e01923ac4cce51b91161bbaeb3d)   
author: underscorediscovery   
date: Sun Sep 29 2013 02:14:40 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Sprite; Fixing bug when parent entity is set rotation and stuff is not passed to subclass. Adding a guide for components</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [dd41df84bb](https://github.com/underscorediscovery/luxe/commit/dd41df84bbcae3442c10ccca220813266dad8e1c)   
author: underscorediscovery   
date: Sat Sep 28 2013 04:52:03 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Changing how serialization is done on entities, including saving the components and their children. Adding sprite animation serialization too quick.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [a01f7f7fd1](https://github.com/underscorediscovery/luxe/commit/a01f7f7fd1cde03db359ca8b4f6148332f7cd39d)   
author: underscorediscovery   
date: Fri Sep 27 2013 07:13:45 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Api; adding fileDialogFolder, fileDialogOpen, fileDialogSave in preparation for exposing from nme. Mac ndll includes these already, other's don't just yet.</li><li>Editor; cleaning up code structure into some classes, refactoring compiling and events keeping ui in encapsulated, added an open project dialog, generates missing project files, generates necessarily files to build a non-editor created project and see the output. Public member parsing is now done from compiler xml, more reliable and follows compilation already,</li><li>Entity;Sprite;Camera;Vector;Rectangle;Color; adding serialization for better json output, as well as serializing entities for scene saving etc. WIP.</li><li>Entity; fixing bug where components added DURING the init sequence weren't inited along with their parent entity.</li><li>Objects; adding _merge_properties helper for combining Dynamics for json export</li><li>Squads; minor renames and fixes to the project, cleaning up for serialization tests</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [134bd7c7ad](https://github.com/underscorediscovery/luxe/commit/134bd7c7adcbfcebc118d3a60b2690233e397577)   
author: underscorediscovery   
date: Thu Sep 26 2013 08:04:22 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Events; cleaning up interfaces for using in projects cleanly</li><li>Input; putting neko shields, so neko builds work</li><li>Scene; entities changed to an id map, so they can be fetched quickly</li><li>TDGame; adding a test directional light shader</li><li>Editor; adding a bunch of UI stuff, project compilation status, project file parsing, and more.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [c80e2d3d58](https://github.com/underscorediscovery/luxe/commit/c80e2d3d5845e0e147ee24f972e3680baef20753)   
author: underscorediscovery   
date: Wed Sep 25 2013 06:31:56 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>TDGame; removing axis for now</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [a9d05c0800](https://github.com/underscorediscovery/luxe/commit/a9d05c08009cbe77b807b186171e09a3e170897c)   
author: underscorediscovery   
date: Wed Sep 25 2013 06:29:23 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>TDGame; Adding pathfinding, and a new map look</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [25d44114bb](https://github.com/underscorediscovery/luxe/commit/25d44114bb7adae186479068338027dd79d4d462)   
author: underscorediscovery   
date: Wed Sep 25 2013 02:19:39 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Phoenix; Adding PlaneGeometry for 3d planes, right now kinda awkward api but it does the job. Luxe.draw.plane to compliment.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [c6fa02c64d](https://github.com/underscorediscovery/luxe/commit/c6fa02c64de465fd17cbb1c41f71692d715acc29)   
author: underscorediscovery   
date: Tue Sep 24 2013 22:12:29 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>TDGame; Adding a second tower mesh type. Fixing luxe logo in shader sample to not be half erased.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [3a6227e5fa](https://github.com/underscorediscovery/luxe/commit/3a6227e5fac0f54cfa04894bd9a841bec7504f51)   
author: underscorediscovery   
date: Tue Sep 24 2013 14:47:23 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Cleanup loading race conditions on html5, and making sure things are scaled on create etc</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [efb0c446df](https://github.com/underscorediscovery/luxe/commit/efb0c446df1678d6f7a094e930d6e8462486d558)   
author: underscorediscovery   
date: Tue Sep 24 2013 14:30:59 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>adding changes to shader example for better look</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [64d915a3de](https://github.com/underscorediscovery/luxe/commit/64d915a3deb54ac295ef7b48cf596118348f806d)   
author: underscorediscovery   
date: Tue Sep 24 2013 14:10:25 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Shader;Texture; Adding fixes to allow multiple textures in a shader, passed in as tex0 to tex7 for now! See test_shaders example for how</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [0696d1ba04](https://github.com/underscorediscovery/luxe/commit/0696d1ba04684bd701573c599ee37288732bf634)   
author: underscorediscovery   
date: Tue Sep 24 2013 13:33:18 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Shader;Batcher;Texture; Adding a slot value to textures, so they can be bound to different slots in shaders. Adding set uniform fixes for shaders to work, and fixing Batcher as needed for new changes. Textures being passed are not being bound atm, but fixing that now</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [c66d6dc34a](https://github.com/underscorediscovery/luxe/commit/c66d6dc34a38cc5a35be00b7fdf360326f1a4ec5)   
author: underscorediscovery   
date: Tue Sep 24 2013 13:31:48 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding a test shader project</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [4d0bef86fd](https://github.com/underscorediscovery/luxe/commit/4d0bef86fd4de3908d10e9101a9eda2a711eb5ee)   
author: underscorediscovery   
date: Tue Sep 24 2013 02:33:36 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>tdgame; Adding 2d text display over tower</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [7fd9be0f9a](https://github.com/underscorediscovery/luxe/commit/7fd9be0f9ac41cb63b9858612dcc629f47a87df5)   
author: underscorediscovery   
date: Tue Sep 24 2013 01:10:02 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Entity;Scene;Component; Adding oninputdown and oninputup</li><li>Phoenix; Adding Ray class, and camera projection between world+screen</li><li>Draw; Added axis3D</li><li>Utils; Luxe.utils.geometry.intersect_ray_plane()</li><li>Camera; Adding screen_point_to_ray,  world_point_to_screen</li><li>TDGame; Refactoring to components and cleaning up Main.hx</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [3b7591f047](https://github.com/underscorediscovery/luxe/commit/3b7591f047a31f6a07ab43b4bc7e596c8ce57c13)   
author: underscorediscovery   
date: Mon Sep 23 2013 21:35:19 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Merge branch 'master' of https://github.com/underscorediscovery/luxe</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [a02c733a00](https://github.com/underscorediscovery/luxe/commit/a02c733a00340de5817e5f3ad7504fe7d1de4ce0)   
author: underscorediscovery   
date: Mon Sep 23 2013 21:34:52 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixing luxe serve command on windows</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [c99eebec3c](https://github.com/underscorediscovery/luxe/commit/c99eebec3cd64bb9cbfa64196fa77d10dd60d1bb)   
author: underscorediscovery   
date: Mon Sep 23 2013 20:45:21 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>renaming inverted() to inverse() on Matrix4, moving the unproject and project code into the camera clas as that is where it is most useful. Adding projectVector to tdgame to display health above the tower for fun</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [5c721efabc](https://github.com/underscorediscovery/luxe/commit/5c721efabc764d9b2ea7fabec2e81c65f6c4ad25)   
author: underscorediscovery   
date: Mon Sep 23 2013 19:03:47 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Merge branch 'master' of github.com:underscorediscovery/luxe</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [f9aff5cb9f](https://github.com/underscorediscovery/luxe/commit/f9aff5cb9fc0186b70bb720ea7dbf74991389162)   
author: underscorediscovery   
date: Mon Sep 23 2013 19:03:20 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding a working unproject function to tdgame</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [072617420b](https://github.com/underscorediscovery/luxe/commit/072617420b28991b97ddefb55c6ffd453775dff0)   
author: Sven Bergström   
date: Mon Sep 23 2013 18:15:48 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>fixing missing dev lime piece</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [49127b2722](https://github.com/underscorediscovery/luxe/commit/49127b27225a188f18fc6109b501ad5d473e9cf7)   
author: underscorediscovery   
date: Mon Sep 23 2013 14:21:19 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding more attempts of ray casting lol</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [ef59bb7e73](https://github.com/underscorediscovery/luxe/commit/ef59bb7e733e98e151fd5529916e78667c46818a)   
author: underscorediscovery   
date: Mon Sep 23 2013 02:07:30 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Scene/Entity; Propogating mouse events through entity to components (for now, this way will work well.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [10fdff24f8](https://github.com/underscorediscovery/luxe/commit/10fdff24f8b291f05e4d3bd27772d83def1593cf)   
author: underscorediscovery   
date: Sun Sep 22 2013 22:07:42 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>more test projects</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [f53ae9a06e](https://github.com/underscorediscovery/luxe/commit/f53ae9a06ef5519f430355fba43fb3a38d28aeeb)   
author: underscorediscovery   
date: Sun Sep 22 2013 22:07:26 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding fixes to mesh sub property changes, renaming camera.modelview_matrix to view_matrix, adding matrix.inverted()</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [c64043a944](https://github.com/underscorediscovery/luxe/commit/c64043a9448f3881d72169c1f2e0399c16f9c679)   
author: underscorediscovery   
date: Sun Sep 22 2013 21:41:11 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding tests for 3d components</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [0bc0327eba](https://github.com/underscorediscovery/luxe/commit/0bc0327eba8743353ee8d3f62fcf2c1ce3a8aa60)   
author: underscorediscovery   
date: Sun Sep 22 2013 15:52:05 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding better ray test</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [d95fe6317a](https://github.com/underscorediscovery/luxe/commit/d95fe6317a6638fa65d2b26191271afe08d80e46)   
author: underscorediscovery   
date: Sun Sep 22 2013 14:51:46 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Updating project</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [0e1eb30836](https://github.com/underscorediscovery/luxe/commit/0e1eb30836c6e5dff3ca1999219aef6a805d2a20)   
author: underscorediscovery   
date: Sun Sep 22 2013 05:08:45 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>adding td game</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [432156c302](https://github.com/underscorediscovery/luxe/commit/432156c30245fd08c86fe82c61a4de27bd327f7e)   
author: underscorediscovery   
date: Sun Sep 22 2013 05:07:49 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding td game prototype for now. adding minor code completion claenup in camera and removing mouse lock stuff in console for now.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [f79ab29747](https://github.com/underscorediscovery/luxe/commit/f79ab2974756076397f88652d0e2c630656f04af)   
author: underscorediscovery   
date: Fri Sep 20 2013 00:38:35 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>More update api fixes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [599ec187f1](https://github.com/underscorediscovery/luxe/commit/599ec187f1aa6083befd482ef6f53c0b19269f28)   
author: underscorediscovery   
date: Fri Sep 20 2013 00:35:38 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Updating to latest input values</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [99d7efd21c](https://github.com/underscorediscovery/luxe/commit/99d7efd21c73a7a3a44097efc5c58563924bde77)   
author: underscorediscovery   
date: Thu Sep 19 2013 23:57:32 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>updating the test project names and file names</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [1ec4884af9](https://github.com/underscorediscovery/luxe/commit/1ec4884af99a3789676313e1550e6f4f39fcc97d)   
author: underscorediscovery   
date: Thu Sep 19 2013 23:52:28 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding explosive barrel items and renaming tests to proper names</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [524924670b](https://github.com/underscorediscovery/luxe/commit/524924670b7a677f6f3f2ee6fbf819ced514ab42)   
author: underscorediscovery   
date: Wed Sep 18 2013 12:09:59 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding fix for shooting inside of collidables, now it ignores them until it exits.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [ed920a3f2d](https://github.com/underscorediscovery/luxe/commit/ed920a3f2d5545218035430f60b1d1f25fbb39e3)   
author: underscorediscovery   
date: Tue Sep 17 2013 19:57:25 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Updating asset library to be cleaner, and reference lime instead of nme</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [1f9cfb6043](https://github.com/underscorediscovery/luxe/commit/1f9cfb604348ba0044dd4f4a17d91596e0af2c6d)   
author: underscorediscovery   
date: Tue Sep 17 2013 16:32:10 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>only colliding in game, not in menu</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [b48d7e1a02](https://github.com/underscorediscovery/luxe/commit/b48d7e1a02c36228ebeb82f7f4d8bfe7ed60e481)   
author: underscorediscovery   
date: Tue Sep 17 2013 15:25:29 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Vector; hiding setters and getters. Squads; adding fixed aim direction and fixes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [835792a4c1](https://github.com/underscorediscovery/luxe/commit/835792a4c102cd0ca7ec5fec619714c1cfd7c0ac)   
author: underscorediscovery   
date: Tue Sep 17 2013 07:00:53 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding collision layers and shapes for the first level, integrated it with bullets and player on 2 levels</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [88dd90a4f2](https://github.com/underscorediscovery/luxe/commit/88dd90a4f20093065574b24aeeee6c9e00e80396)   
author: underscorediscovery   
date: Sun Sep 15 2013 19:59:57 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Merge branch 'master' of github.com:underscorediscovery/luxe</li><li>Conflicts:</li><li>	projects/squads/builds/squads.0.5.windows.zip</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [e0197e2062](https://github.com/underscorediscovery/luxe/commit/e0197e206291233da64b852fb23fe59581511a1e)   
author: underscorediscovery   
date: Sun Sep 15 2013 19:59:19 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding builds</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [0c37f155f9](https://github.com/underscorediscovery/luxe/commit/0c37f155f92d076e6630c9de185a4fac1d24acf5)   
author: underscorediscovery   
date: Sun Sep 15 2013 17:33:27 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding windows build</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [d87ff1a630](https://github.com/underscorediscovery/luxe/commit/d87ff1a630d21b51ebe8c38a8e278145c9df8f83)   
author: underscorediscovery   
date: Sun Sep 15 2013 17:24:04 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding animations for running and one idle</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [00165a694c](https://github.com/underscorediscovery/luxe/commit/00165a694c67c9c07e0ad1badd48118faff35ae9)   
author: underscorediscovery   
date: Sun Sep 15 2013 05:38:17 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding a quick audio test for testing latest openal on mac</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [f8e05f7a3e](https://github.com/underscorediscovery/luxe/commit/f8e05f7a3ee1dce361b0459a7662337402b34119)   
author: underscorediscovery   
date: Sun Sep 15 2013 05:16:00 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Switching lime_native and lime_html5 to luxe_native and luxe_html5</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [05f3fde856](https://github.com/underscorediscovery/luxe/commit/05f3fde8563e1d2d2dc0ec6f14cc489e1052b327)   
author: underscorediscovery   
date: Sun Sep 15 2013 05:12:02 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>SpriteAnimation; added set_frame function to skip to exact frame.</li><li>Squads; Added 8 directions rotation for character from andrio.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [3ab55e04cd](https://github.com/underscorediscovery/luxe/commit/3ab55e04cd232ba220f157ae729444ce8890e62b)   
author: underscorediscovery   
date: Sat Sep 14 2013 23:09:44 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>adding asset guides and adding loadData function to the api</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [48d643fedf](https://github.com/underscorediscovery/luxe/commit/48d643fedf1f467f71346881617c60d462da2dde)   
author: underscorediscovery   
date: Sat Sep 14 2013 22:05:22 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Entity; Fixing fixed rate setter getting weird timing from the values in the getter</li><li>Modes; Readding modes.enable and .disable, for allowing multiple modes at once.</li><li>Squads; Adding first pass of new art assets, added modes to switch into level (space in menu) and go back(esc in game)</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [fb3e8723c3](https://github.com/underscorediscovery/luxe/commit/fb3e8723c3568d6fe36acfda3278fb84a3ddee72)   
author: underscorediscovery   
date: Sat Sep 14 2013 18:35:11 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixing possible error on Input compiling</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [6d4827d04f](https://github.com/underscorediscovery/luxe/commit/6d4827d04f03647fa608c09554787d2c0ae24e92)   
author: underscorediscovery   
date: Sat Sep 14 2013 05:54:51 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>QuadGeometry; Fixing non immediate flag set in creation</li><li>Entity; Fixed rate callback now stops on destroy, and also fixed rate can now be changed at runtime</li><li>Squads; Adding a bunch of gameplay stuff, weapon switching and firing etc</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [a5e0679f98](https://github.com/underscorediscovery/luxe/commit/a5e0679f9863569b6db14ee876662a6c04d3f380)   
author: underscorediscovery   
date: Sat Sep 14 2013 02:06:15 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Luxe; Adding a profiler key, use ctrl+P to start profiling (requires <haxedef name='profiler'/> or luxe test target -Dprofiler , and only works on native targets.</li><li>Entity; Fixing a slow down on entity fixed updates, by changing a bunch of code in haxe/timer (in lime), timers are more stable and much faster now.</li><li>Objects; Adding a shield against null crashes in Objects when args are null</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [d9cbe48370](https://github.com/underscorediscovery/luxe/commit/d9cbe4837061c7153bdc60f412319cea08c687b5)   
author: underscorediscovery   
date: Fri Sep 13 2013 23:49:11 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>API; Adding openURL to open browser windows</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [003e36719d](https://github.com/underscorediscovery/luxe/commit/003e36719db20bd3db19dbe3b66b160aeb2832c6)   
author: underscorediscovery   
date: Fri Sep 13 2013 14:29:11 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Vector; Adding rotationTo and RotationTo, for angle between two vectors.</li><li>Entity; Renaming addChild and removeChild to add_child and remove_child for consistency</li><li>API; Adding Luxe.mouse accessible value anywhere.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [985d80c011](https://github.com/underscorediscovery/luxe/commit/985d80c011cec6b139d96a22565e92239b3ec25f)   
author: underscorediscovery   
date: Fri Sep 13 2013 13:56:11 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Converting tabs to spaces</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [194cc3920a](https://github.com/underscorediscovery/luxe/commit/194cc3920a60d8ed50eb9aa4753e03b3dab2d30f)   
author: underscorediscovery   
date: Fri Sep 13 2013 13:48:33 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>BitmapFont; Renamed KeyValue to KeyValuePair because it was conflicting with Input.KeyValue</li><li>Modes; Adding oninputup and oninputdown for handling named input bindings</li><li>Input; changed oninput to oninputup and oninputdown, which makes more sense for normal usage</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [9df6efae15](https://github.com/underscorediscovery/luxe/commit/9df6efae1569b902a0c47b99544542aedcc96db7)   
author: underscorediscovery   
date: Fri Sep 13 2013 13:47:00 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding movement to the player via components</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [07004725c9](https://github.com/underscorediscovery/luxe/commit/07004725c93b3879628318686c07ad06eddb66c7)   
author: underscorediscovery   
date: Fri Sep 13 2013 11:33:10 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>cleaning up code for squads</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [378b326e51](https://github.com/underscorediscovery/luxe/commit/378b326e51e0a28d830fc63946818b853ee8518b)   
author: underscorediscovery   
date: Fri Sep 13 2013 09:47:08 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixing bug in LineGeometry constructor colors being misnamed</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [0c984c6518](https://github.com/underscorediscovery/luxe/commit/0c984c6518aa1caa31889e720089226e2221260e)   
author: underscorediscovery   
date: Fri Sep 13 2013 09:28:38 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Removing erroneous trace</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [93952ba3f8](https://github.com/underscorediscovery/luxe/commit/93952ba3f8a130a2087a411d6833e5c9603868a7)   
author: underscorediscovery   
date: Fri Sep 13 2013 09:27:26 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>API; Adding loadFont to easily load fonts from assets</li><li>API; Explicitly typing loadText</li><li>Modes; Typing key and mouse events in mode class.</li><li>Components; Tidying public code completion</li><li>Components; Moving 3D physics components to it's own folder</li><li>LineGeometry; Adding color0 color1 options to specify each side color</li><li>Letter5; Fixing scale for screen size. Still bugs there, though.</li><li>Entity; Moved scene to entity not the sprites class.</li><li>Entity/Component; Fixed bug where late added components or entities were not inited/started</li><li>Sprite Animation component added;</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [6cd8e1345a](https://github.com/underscorediscovery/luxe/commit/6cd8e1345a4fb91ce8deca0023c3b34121930aa2)   
author: underscorediscovery   
date: Thu Sep 12 2013 20:17:34 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Switching the order of the html5 serve command, and making it blocking so ctrl-c will kill the server in console</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [09de112693](https://github.com/underscorediscovery/luxe/commit/09de11269376a9f90eac4420def2036fae66c1d2)   
author: underscorediscovery   
date: Thu Sep 12 2013 20:13:48 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Switching the order of the html5 serve command, and making it blocking so ctrl-c will kill the server in console</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [970ed2a3e2](https://github.com/underscorediscovery/luxe/commit/970ed2a3e2216b81fe39a34e0bfaaecf62516cee)   
author: underscorediscovery   
date: Thu Sep 12 2013 20:01:48 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding luxe serve command for opening the html5 build in a local server</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [1d5023f367](https://github.com/underscorediscovery/luxe/commit/1d5023f36774c5609b801886321bf3105a0da33d)   
author: underscorediscovery   
date: Thu Sep 12 2013 20:00:54 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding luxe serve command for opening the html5 build in a local server</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [326b3dff12](https://github.com/underscorediscovery/luxe/commit/326b3dff12856c459dce026494570b57eab236e6)   
author: underscorediscovery   
date: Thu Sep 12 2013 19:47:00 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixes to html5 run loop, and newer run script adds luxe test html5 -server which launches a nekotools server and the url manually</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [91610e5a6d](https://github.com/underscorediscovery/luxe/commit/91610e5a6d81ff8680bc52c810b0c1e8224943a8)   
author: underscorediscovery   
date: Thu Sep 12 2013 04:52:56 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Docs; adding some guides and adjusting some output options for the generator ,like copying images from the folder to the output.</li><li>Samples; Adding samples/guides with the first two guide sample code.</li><li>Input; Adding a .pos property as luxe.Vector to MouseEvent for direct use. It's cached internally so no allocation is done.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [c1fb1deff1](https://github.com/underscorediscovery/luxe/commit/c1fb1deff14bc02797f8e151c6d58a1227702bfa)   
author: underscorediscovery   
date: Thu Sep 12 2013 01:51:30 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Updating draw quality for circles to be higher, and adding box/ring/circle to docs</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [dc9cb89f3c](https://github.com/underscorediscovery/luxe/commit/dc9cb89f3cbd47ad6d864c2c8991da9c15e9b516)   
author: underscorediscovery   
date: Wed Sep 11 2013 20:36:18 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding draw circle and draw ring to Luxe.draw commands</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [e6f915a5f1](https://github.com/underscorediscovery/luxe/commit/e6f915a5f1ae9621039a4ebe451f27c1007af62e)   
author: underscorediscovery   
date: Wed Sep 11 2013 18:27:31 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Cleaning up projects nmml files</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [cbee722d0c](https://github.com/underscorediscovery/luxe/commit/cbee722d0c79f6e6916e0cf8def237175357eb5c)   
author: underscorediscovery   
date: Wed Sep 11 2013 18:13:40 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Switching to project.luxe.xml</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [c5c7edea33](https://github.com/underscorediscovery/luxe/commit/c5c7edea339e0977b30d1d38275dd0381aaafe9e)   
author: underscorediscovery   
date: Wed Sep 11 2013 15:08:05 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Texture; removing legacy comment. adding tests for letter5 for mobile</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [f791f68f5b](https://github.com/underscorediscovery/luxe/commit/f791f68f5bfc7593f367ffe999a5462a243afad1)   
author: underscorediscovery   
date: Sun Sep 08 2013 09:06:49 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Merge branch 'master' of github.com:underscorediscovery/luxe</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [dafda94e57](https://github.com/underscorediscovery/luxe/commit/dafda94e57da5f41dae11ca099d87e6dce670f59)   
author: underscorediscovery   
date: Sun Sep 08 2013 09:06:35 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Editor; Adding initial editor proof of concept tests. added a haxe public property parsing class, added an initial draft of the command system stack for undo.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [d08f683c80](https://github.com/underscorediscovery/luxe/commit/d08f683c80c830d1f4eec8f0dfe4bd2add6a9a80)   
author: Sven Bergström   
date: Sat Sep 07 2013 22:07:52 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Updating to include details and resolution rather than hacking in dev files :)</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [89c001d28a](https://github.com/underscorediscovery/luxe/commit/89c001d28a21da97369e2f255ef617d9e7f9a976)   
author: underscorediscovery   
date: Sat Sep 07 2013 16:32:23 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding linked list based stack structure</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [d2a33764fc](https://github.com/underscorediscovery/luxe/commit/d2a33764fc1041716c95ba9bbdc1b28750059a7f)   
author: underscorediscovery   
date: Sat Sep 07 2013 04:04:38 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Making timescale not affect internal dt</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [2de46ad34a](https://github.com/underscorediscovery/luxe/commit/2de46ad34a0f20dad01f817b94f7b298780b3768)   
author: underscorediscovery   
date: Fri Sep 06 2013 20:42:24 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Merge branch 'master' of github.com:underscorediscovery/luxe</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [cd37ee03cd](https://github.com/underscorediscovery/luxe/commit/cd37ee03cd0982fb542ae19a162385abf41b7963)   
author: underscorediscovery   
date: Fri Sep 06 2013 20:42:14 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Added a timescale value so you can scale dt up and down. Adding a test/demo for that. Added a down/up flag to Input.add so that we can get mousedown and mouseup differentiated.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [70350b4cbc](https://github.com/underscorediscovery/luxe/commit/70350b4cbca20d00ff9cdd7b0da87b7b2acf64e0)   
author: Andrew Price   
date: Fri Sep 06 2013 14:54:37 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Added troubleshooting on Windows</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [f4efb15360](https://github.com/underscorediscovery/luxe/commit/f4efb153609d71b132298bf8620d11ca4b327fa0)   
author: underscorediscovery   
date: Fri Sep 06 2013 07:32:10 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>adding test named bindings</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [486d06c097](https://github.com/underscorediscovery/luxe/commit/486d06c09747ab34cb0693e90f99930dda3c5e3d)   
author: underscorediscovery   
date: Fri Sep 06 2013 07:31:53 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Input; Adding first draft of named input functionality. Right now only on keyup and mouseup - handles MouseButton and KeyValue.</li><li>Input; Added raw property to MouseEvent and KeyEvent and GamepadEvent, in case there is a property not passed through exact types.</li><li>Input; Added KeyEvents and KeyValue enumerations so that types can be code completed. e.key == Keys.tab;</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [a24a9015d6](https://github.com/underscorediscovery/luxe/commit/a24a9015d6d5755f7ea3823a91e9dd2a6680df46)   
author: underscorediscovery   
date: Fri Sep 06 2013 01:31:02 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>minor tidy</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [70d0994cb5](https://github.com/underscorediscovery/luxe/commit/70d0994cb5d25ce530da936ca8a2b196b1cc22f2)   
author: underscorediscovery   
date: Fri Sep 06 2013 01:29:46 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Updating readme</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [31dda1f258](https://github.com/underscorediscovery/luxe/commit/31dda1f2583bc365c94a510ab1a18ff4301c3e7d)   
author: underscorediscovery   
date: Fri Sep 06 2013 01:29:06 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding samples</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [185bb820d2](https://github.com/underscorediscovery/luxe/commit/185bb820d294171a545db45549cda5e6c4787b8f)   
author: underscorediscovery   
date: Fri Sep 06 2013 01:28:42 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>moving simplest to samples</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [c642a48dcc](https://github.com/underscorediscovery/luxe/commit/c642a48dccd977fa20036226b03370aa8261da05)   
author: underscorediscovery   
date: Fri Sep 06 2013 01:20:31 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Merge branch 'master' of github.com:underscorediscovery/luxe</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [f01cbbc792](https://github.com/underscorediscovery/luxe/commit/f01cbbc792fb2cda45162ec075c87f3e17b73fc2)   
author: underscorediscovery   
date: Fri Sep 06 2013 00:38:42 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixing tweening</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [85ce4900a2](https://github.com/underscorediscovery/luxe/commit/85ce4900a2a27426ab2ac8c2a52e2e614efd4fa3)   
author: underscorediscovery   
date: Fri Sep 06 2013 00:21:44 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Updating color classes with HSV and HSL variations, and conversion between each as well as some tweening stuff.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [d2a75b1f10](https://github.com/underscorediscovery/luxe/commit/d2a75b1f107d3735ad13880b506b68605118b542)   
author: underscorediscovery   
date: Thu Sep 05 2013 20:44:40 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>more tests to color tween</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [e79b9d98bd](https://github.com/underscorediscovery/luxe/commit/e79b9d98bde2a6c810a2d3f49780cbfaae6e727c)   
author: underscorediscovery   
date: Thu Sep 05 2013 20:02:52 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Updating roadmap a little</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [3b4e2143ad](https://github.com/underscorediscovery/luxe/commit/3b4e2143ad67a7231fb9a6df1ba1d48dff963ffd)   
author: underscorediscovery   
date: Thu Sep 05 2013 19:59:43 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Luxe : tidying the project folder</li><li>Color : Adding color tween</li><li>tests : Adding test_tween</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [a5ab90e6f2](https://github.com/underscorediscovery/luxe/commit/a5ab90e6f2f3a50844e06276a6991612d74858b7)   
author: underscorediscovery   
date: Thu Sep 05 2013 19:09:30 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Updating run to work with create/copy again.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [ec7fce7cc4](https://github.com/underscorediscovery/luxe/commit/ec7fce7cc4b68da9d5647bb59b6aad7211d334c7)   
author: underscorediscovery   
date: Thu Sep 05 2013 17:10:34 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Updating readme to remove actuate dependency</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [f7f16f0091](https://github.com/underscorediscovery/luxe/commit/f7f16f00917920efd2fc68f10cf3311b359f54d3)   
author: underscorediscovery   
date: Thu Sep 05 2013 17:09:20 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tween : Adding internal version of Actaute without any flash code etc, ties into game update loop and so on.</li><li>Tween : Replacing all uses of actuate with local version. Removed actuate dependency.</li><li>Lauren : Fixed project to work as expected, showing the things it is meant to show.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [5814a4f458](https://github.com/underscorediscovery/luxe/commit/5814a4f458fa92598660548e4b05377282fe1326)   
author: underscorediscovery   
date: Thu Sep 05 2013 07:36:03 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding safegaurd against rogue non strings being drawn on html5 breaking things. Hiding warning temporarily as it blows up the debug log on html5...given that it prints entire object trees.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [2cff67eb54](https://github.com/underscorediscovery/luxe/commit/2cff67eb5480e3b402a3ea9bd1c03f995acf3270)   
author: underscorediscovery   
date: Thu Sep 05 2013 03:47:42 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Slight tidying</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [59975e2597](https://github.com/underscorediscovery/luxe/commit/59975e259722af48cedc9f337f71d7fbc2af1272)   
author: underscorediscovery   
date: Wed Sep 04 2013 06:11:04 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding balanced binary tree into the geometry tree, works much better than normal BST for operations on the tree.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [31b5e3cc99](https://github.com/underscorediscovery/luxe/commit/31b5e3cc99f9c050352fab48ecbdcfd5ffb5a70e)   
author: underscorediscovery   
date: Wed Sep 04 2013 03:57:19 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Removing erroneous line from last minute cleanup</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [9fc093aef9](https://github.com/underscorediscovery/luxe/commit/9fc093aef9ddfe8856e0c49db4a34321a6c2f1ea)   
author: underscorediscovery   
date: Wed Sep 04 2013 03:55:58 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Debug : adding geometry batcher tree for testing</li><li>Batcher : Changed layer to int, hardly likely to need float for that</li><li>Batcher : Replaced the old BinarySearchTree with the new one, and its compares etc</li><li>Geometry : Switching to new BST style, and tidying up state changes</li><li>Geometry : Added shadow state values to swap in after removal</li><li>LineGeometry : Color for verts was not correct</li><li>QuadGeometry : Changed from the only use of .width and .height to .w and .h for consistency</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [1566ae7f79](https://github.com/underscorediscovery/luxe/commit/1566ae7f79586f3b9c4f2cea21c91ead95f373a5)   
author: underscorediscovery   
date: Tue Sep 03 2013 02:32:03 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixing immediate bug in draw.text</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [f547eacfc1](https://github.com/underscorediscovery/luxe/commit/f547eacfc108884e42715a4d9bfa833e6ab95f9d)   
author: underscorediscovery   
date: Mon Sep 02 2013 01:29:57 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li> a</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [17a65dd78b](https://github.com/underscorediscovery/luxe/commit/17a65dd78b6fbe8d8a8b8321c599b2d1e6df8ffb)   
author: underscorediscovery   
date: Sun Sep 01 2013 20:37:00 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixing missing Dynamic on constructor when seeing src/Main.hx:33: lines 33-35 : { texture : phoenix.Texture } has no field color _options etc</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [02a6eb1a12](https://github.com/underscorediscovery/luxe/commit/02a6eb1a12f8d11e05014fc7ba94eab17b615d94)   
author: underscorediscovery   
date: Sun Sep 01 2013 06:40:11 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding actuate for code complete</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [aeaf6e1929](https://github.com/underscorediscovery/luxe/commit/aeaf6e1929da9916f72e97a6b2510ea041282fdb)   
author: underscorediscovery   
date: Sun Sep 01 2013 04:32:06 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>updating minor fixes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [6b61a8940b](https://github.com/underscorediscovery/luxe/commit/6b61a8940b2a2da225328edbe149344fec3753b2)   
author: underscorediscovery   
date: Sat Aug 31 2013 03:34:44 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixing sorting issues by not calling refresh repeatedly, when state is the same as before</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [3534f5199f](https://github.com/underscorediscovery/luxe/commit/3534f5199f55b02e223c0ad4e35bb82970d6d489)   
author: underscorediscovery   
date: Sat Aug 31 2013 00:36:09 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Debug: Moved to update last, for stats to be better.</li><li>Debug: Adding provisional geometry debugger view</li><li>Debug: Moved debug console from many lines to one single text item for performance, and made it static batched</li><li>NineSlice: Moved into a ComplexGeometry, so it's now a single draw call</li><li>NineSlice: Moved to luxe.NineSlice instead of luxe.utils, as it will be an Entity soon (already extends sprite...so it is already)</li><li>NineSlice: Added .size property which will efficiently resize the nineslice to a new size (see tests/test_nineslice)</li><li>Tests: Added test_nineslice, update test_depth to have a better test of the depth system (+/- to change depth)</li><li>Fonts: Fixed bug where text positions were ignoring their alignment after positioning. Fixed with .origin</li><li>CompositeGeometry: Adding fix for missing set_origin</li><li>Geometry: Temporarily disabling .refresh() for set_clip and set_clip_rect (need elegant solution to same depths being readded at the end (forcing reordering, which is bad))</li><li>Geometry: Fixing state compare function after cleaning up from the remove bugs.</li><li>SuitStory: Tidying up project some more, added scale to the balloons</li><li>Empty: Updating nmml to include actuate, as for now it is dependent for code completion. New Tween coming soon.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [ed7485e3e5](https://github.com/underscorediscovery/luxe/commit/ed7485e3e58069abb774ec2579af330861f47f6e)   
author: underscorediscovery   
date: Mon Aug 26 2013 06:44:32 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Updating docs a bunch</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [a04ab71a82](https://github.com/underscorediscovery/luxe/commit/a04ab71a8280d0a5fe8c516bb6a242e3b0231de4)   
author: underscorediscovery   
date: Mon Aug 26 2013 06:44:27 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Updating docs a bunch</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [8cf7a2b248](https://github.com/underscorediscovery/luxe/commit/8cf7a2b248a49db0b7393b0082b569c15100c136)   
author: underscorediscovery   
date: Sun Aug 25 2013 03:27:09 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Updating tests for latest code base</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [1056bcf703](https://github.com/underscorediscovery/luxe/commit/1056bcf703df9b4c664d4489c862981779903e0c)   
author: underscorediscovery   
date: Sun Aug 25 2013 02:54:49 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding setup shortcuts and instructions</li><li>as well as updating the readme, and adding a click-to-regrab-cursor for</li><li>when locking the mouse in the three flycamera component demo.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [2a47c1954b](https://github.com/underscorediscovery/luxe/commit/2a47c1954b5927d6eac9b81c15decbb0b2291883)   
author: underscorediscovery   
date: Sat Aug 24 2013 17:36:52 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Updating so scale is changeable</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [52d5de3717](https://github.com/underscorediscovery/luxe/commit/52d5de3717b10bfc49c930ab17235e3bfad3f8aa)   
author: underscorediscovery   
date: Sat Aug 24 2013 17:33:19 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding tiled map loading test</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [45138def84](https://github.com/underscorediscovery/luxe/commit/45138def84621335488f794599f91ab9b99c09c0)   
author: underscorediscovery   
date: Sat Aug 24 2013 16:26:16 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>removing haxebullet dependency, found by pekuja</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [844f30e9ca](https://github.com/underscorediscovery/luxe/commit/844f30e9ca7ac89cdc6526bf59d18928a19bb5a1)   
author: underscorediscovery   
date: Sat Aug 24 2013 13:38:46 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixing missing _, thanks Martin</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [2d8ffb3f30](https://github.com/underscorediscovery/luxe/commit/2d8ffb3f30095e0b4cc882fbd5c84c44c682fa77)   
author: underscorediscovery   
date: Fri Aug 23 2013 13:01:02 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding more docs, tidying up the Vector implementation</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [307dfac444](https://github.com/underscorediscovery/luxe/commit/307dfac4441d99a31b62c4fd1b7150e8ed4ba60d)   
author: underscorediscovery   
date: Fri Aug 23 2013 11:35:12 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Updating to new hand built docs generator with syntax highlighting</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [e04d883f6f](https://github.com/underscorediscovery/luxe/commit/e04d883f6f5a47d330d10a13b2f008d70a613511)   
author: underscorediscovery   
date: Thu Aug 22 2013 23:06:31 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding shielding for physics, while bullet physics is not built just yet for other platforms</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [1f824df8b0](https://github.com/underscorediscovery/luxe/commit/1f824df8b0730411f891e19b86239d73bdbb3aef)   
author: underscorediscovery   
date: Thu Aug 22 2013 22:13:47 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixing ordering and rendering of non blurred items</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [f812c73b5e](https://github.com/underscorediscovery/luxe/commit/f812c73b5eca6cf276c183401860ff7e1e7383ad)   
author: underscorediscovery   
date: Thu Aug 22 2013 17:30:55 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixing minor issue with not yet loaded textures on html5 using the default uv's (0,0,1,1) which is incorrect if the images were NPOT and padded to work on webgl.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [87064db3f3](https://github.com/underscorediscovery/luxe/commit/87064db3f3a9c813a035840519ded014db96de48)   
author: underscorediscovery   
date: Wed Aug 21 2013 06:31:36 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Debugging some entity .x .y .z listeners stuff on js target</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [7fb334433f](https://github.com/underscorediscovery/luxe/commit/7fb334433fc4ecf5b38ebdf1c9cb324a1137331f)   
author: underscorediscovery   
date: Wed Aug 21 2013 00:02:24 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Finally fixing the geometry refresh issues! Binary search tree returns the index when adding, for use when removal. Adding simple dialog to suit story</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [45fbb4aa21](https://github.com/underscorediscovery/luxe/commit/45fbb4aa2109c667b1cbd0b8b5be61038d52319d)   
author: underscorediscovery   
date: Tue Aug 20 2013 19:52:36 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Luxe: adding Luxe.loadShader,</li><li>Camera : adding .center( point, time, oncomplete ) , added camera.bounds which clamps the movement inside this area</li><li>Sprite : adding .shader accessor, added batcher into the constructor</li><li>Tidying suit story project, adding game stuff</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [853617ceb5](https://github.com/underscorediscovery/luxe/commit/853617ceb5b9d1f2aa37f86c31e4aa6d61e3a1ca)   
author: underscorediscovery   
date: Mon Aug 19 2013 03:25:13 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>adding a roadmap, for interest sake</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [ee02f34aec](https://github.com/underscorediscovery/luxe/commit/ee02f34aec43295b1401550e9a827bda394e3a12)   
author: underscorediscovery   
date: Sat Aug 17 2013 07:50:51 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>removing display thing its in the way of code complete</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [95551ba2db](https://github.com/underscorediscovery/luxe/commit/95551ba2db087bfd9aed408cf89d7eac45a29f0c)   
author: underscorediscovery   
date: Sat Aug 17 2013 06:55:34 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Mesh : Adding rotate/scale/pos, and updated MeshComponent</li><li>Physics : Exposing world as public for fetching properties etc</li><li>Sprite : Adjusting for latest geometry transforms, cleans up code for sprite</li><li>Text : Adjusting for latest geometry transforms</li><li>RigidBody Component : Adding all properties to bullet, like damping, friction, restitution etc. And fetches rotation from physics</li><li>Batcher : Fixing bugs in removal/adding geometry, as well as tidying the ordering</li><li>CompositeGeometry : Adding set_pos and a bunch of null shields to avoid crashes</li><li>Geometry : Completely redid transforms using a more reliable matrix approach for both 2d and 3d,</li><li>also made geometry state properties that affect the sorting in the batchers refresh its position in the list,</li><li>LineGeometry : Adding immediate passing flag to options, it was ignored before</li><li>TestSprite Added test sprite project to add more tests for sprites, only position rotation and scale added atm</li><li>Various fixes and cleanups</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [c6acde8b7b](https://github.com/underscorediscovery/luxe/commit/c6acde8b7bc5900773224adf138779a10f36a009)   
author: underscorediscovery   
date: Thu Aug 15 2013 08:45:51 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding box, capsule, cone, cylinder, and mesh collider components. Adding rigidbody control for applyTorque, applyForce, applyCentralImpulse, applyTorqueImpulse, applyImpulse, clearForces</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [b040abc975](https://github.com/underscorediscovery/luxe/commit/b040abc9754c7b944386bb9e712d844b8c0a3792)   
author: underscorediscovery   
date: Thu Aug 15 2013 03:46:39 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding more complex functions (like uv, flipping, etc)</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [142a89af07](https://github.com/underscorediscovery/luxe/commit/142a89af072249195f1d3481727058df9e1c557e)   
author: underscorediscovery   
date: Thu Aug 15 2013 01:16:46 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding complex geometry for more complex static geometries using quads (tilemaps, etc), Adding vertex coloring to geometry</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [8449514654](https://github.com/underscorediscovery/luxe/commit/844951465465961ff07c9872dfcf8cd4fc760558)   
author: underscorediscovery   
date: Wed Aug 14 2013 16:56:08 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Default batcher set to layer 1, this allows drawing text on top of 3d easier without manual fiddling of layers when adding batchers</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [27ba6f1511](https://github.com/underscorediscovery/luxe/commit/27ba6f151129006595711dee72782274d85c26d3)   
author: underscorediscovery   
date: Wed Aug 14 2013 02:12:07 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>removing superfluous code for now</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [4953fdac5d](https://github.com/underscorediscovery/luxe/commit/4953fdac5d422c4baa43db6498a1d6afc24bcaaa)   
author: underscorediscovery   
date: Wed Aug 14 2013 02:04:12 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Added bindings to ammo.js in browser, for bullet physics in webgl target</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [8ccf78c677](https://github.com/underscorediscovery/luxe/commit/8ccf78c6778c3446cfbf3efb2bf3e80d0325b4fc)   
author: underscorediscovery   
date: Tue Aug 13 2013 17:18:38 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Updating docs with new logo, moving test ui to actual haxelib</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [fd94d38098](https://github.com/underscorediscovery/luxe/commit/fd94d3809855acb037c8402609c0ccf26bd601a2)   
author: underscorediscovery   
date: Tue Aug 13 2013 06:12:55 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixing entity and physics components, run three, press R to reset the object.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [ff897a4857](https://github.com/underscorediscovery/luxe/commit/ff897a48572cad403902b0acab65e6a17d79906c)   
author: underscorediscovery   
date: Tue Aug 13 2013 04:33:03 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding some base components for Meshs and Physics bindings, redoing the entity heirarchy and component structures</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [257c34c5ca](https://github.com/underscorediscovery/luxe/commit/257c34c5cadb814b240847a16456c4e4e1f63c58)   
author: underscorediscovery   
date: Fri Aug 09 2013 03:56:43 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding event filtering options, as well as fixing a minor issue with entity events not being processed</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [6e392141ab](https://github.com/underscorediscovery/luxe/commit/6e392141ab8080ef6e8252266c1a32550382d808)   
author: underscorediscovery   
date: Thu Aug 08 2013 22:55:52 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tweaking render texture</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [8cb0d5ef1c](https://github.com/underscorediscovery/luxe/commit/8cb0d5ef1c6b0386320d03101b397799120cfa55)   
author: underscorediscovery   
date: Thu Aug 08 2013 22:30:48 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Updating docs</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [83aa16b690](https://github.com/underscorediscovery/luxe/commit/83aa16b69032c8e797a3eb17724b9e09a16ea4cd)   
author: underscorediscovery   
date: Thu Aug 08 2013 22:30:19 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Changed name of events.connect to events.listen, adding local events to entities, adding test events project</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [0163824c4d](https://github.com/underscorediscovery/luxe/commit/0163824c4df046a82b8cba1d049a82b9135e2961)   
author: underscorediscovery   
date: Thu Aug 08 2013 17:14:03 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding ability to flip Quads(and then Sprites) horizontally and vertically, render targets applied to sprites will auto flipy because they are rendererd in opengl space upside down.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [8c016079b8](https://github.com/underscorediscovery/luxe/commit/8c016079b8ffcf1a2395981808b3605e097843e1)   
author: underscorediscovery   
date: Thu Aug 08 2013 06:16:51 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding provisional render texture support, still requires flipping y somewhere because renders are upside down as per GL coords</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [6aa30f12b9](https://github.com/underscorediscovery/luxe/commit/6aa30f12b948e3cf26bc4b776a8b808213677071)   
author: underscorediscovery   
date: Thu Aug 08 2013 01:25:22 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Renaming everything to luxe from lab</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [bcab4f9f2d](https://github.com/underscorediscovery/luxe/commit/bcab4f9f2dfad30afe6404bab188bd76e6048e2c)   
author: Sven Bergström   
date: Wed Aug 07 2013 23:38:15 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Update README.md</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [8519f9c4e2](https://github.com/underscorediscovery/luxe/commit/8519f9c4e240310d6e007b3472cdae20b7f9c528)   
author: Sven Bergström   
date: Wed Aug 07 2013 23:37:48 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Update README.md</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [77aa7eb6a0](https://github.com/underscorediscovery/luxe/commit/77aa7eb6a08dbc1d9d796986d581e9dff69ab0ef)   
author: Sven Bergström   
date: Wed Aug 07 2013 23:37:31 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Update README.md</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [868829bad1](https://github.com/underscorediscovery/luxe/commit/868829bad16039d4a7427fb4c34d7a6fc9a38d82)   
author: Sven Bergström   
date: Wed Aug 07 2013 23:37:16 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Updating readme to luxe, as well as fixing issues with instructions</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [ad283af12f](https://github.com/underscorediscovery/luxe/commit/ad283af12fbb8c7d4a1cb5bbd2d4639a0bfeb3eb)   
author: underscorediscovery   
date: Wed Aug 07 2013 23:24:29 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Starting work on render targets and more</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [e635e2fd70](https://github.com/underscorediscovery/luxe/commit/e635e2fd70f72d6502b808b74e64813967fde625)   
author: underscorediscovery   
date: Wed Aug 07 2013 21:13:33 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>adding new keep</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [4789b1b3b6](https://github.com/underscorediscovery/luxe/commit/4789b1b3b60f5549a33825168b8d5ffdbfc2116c)   
author: underscorediscovery   
date: Wed Aug 07 2013 21:13:10 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>removing older keep file</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [7505f74c1d](https://github.com/underscorediscovery/luxe/commit/7505f74c1d488d7d037a595b1f1c56e0262001b8)   
author: underscorediscovery   
date: Wed Aug 07 2013 16:06:02 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Renaming project header</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [d0a3fff523](https://github.com/underscorediscovery/luxe/commit/d0a3fff523061040387488af2bfdb1a20bb4554b)   
author: underscorediscovery   
date: Wed Aug 07 2013 15:53:58 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Cleaning up camera classes, more optimal apply_perspective instead of set_perspective in process()</li><li>both phoenix and lab cameras, for extensibility and components</li><li>Fixing issue where 2D camera's intersect 3D scene</li><li>Cleaning up, optimising, and fixing bug in flycamera, jerking to its last mouse pos on native</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [f30217828e](https://github.com/underscorediscovery/luxe/commit/f30217828ea1e9aebc217d101e80f8418c177ada)   
author: underscorediscovery   
date: Wed Aug 07 2013 03:51:27 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding initial MIWindow to test_ui</li><li>Adding more test projects, test_depth, to test the sorting of the batchers</li><li>Renamed empty project to three,</li><li>Added FlyCamera controls to three, added test mesh with baked texture,</li><li>Added mouse lock, cursor set positions, and mouse visibility to use for fps,</li><li>Fixed bugs in the renderer not sending the correct matrix to the shaders,</li><li>Synced matrix4 and quaternion classes back up with Three.js trunk,</li><li>Lots of camera fixes, and new features,</li><li>Adding start of RenderPath</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [2831f8b9b3](https://github.com/underscorediscovery/luxe/commit/2831f8b9b32c3c096eaee23ea06e3314cc3f4519)   
author: underscorediscovery   
date: Wed Jul 31 2013 04:03:08 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding more BST tests</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [b870402e2b](https://github.com/underscorediscovery/luxe/commit/b870402e2b28864018768e8754a3a864739d658e)   
author: underscorediscovery   
date: Mon Jul 29 2013 14:16:56 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>adding some base colors and geometry, adding clipping to the nineslice base, fixing minor issues</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [2284ae2bf0](https://github.com/underscorediscovery/luxe/commit/2284ae2bf0bc3e4378ac4d19e53e7e4a79c32958)   
author: underscorediscovery   
date: Mon Jul 29 2013 10:19:41 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding privisional MLList class for string lists, but MIControl is missing parent of parent nesting atm</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [fe61326f6e](https://github.com/underscorediscovery/luxe/commit/fe61326f6e1eb89202219f543b42eeb4c6f2074a)   
author: underscorediscovery   
date: Mon Jul 29 2013 09:22:04 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding button clicks and fixing mouse bugs</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [f8e5aa8141](https://github.com/underscorediscovery/luxe/commit/f8e5aa814119fc065086008d8196b35052c4f512)   
author: underscorediscovery   
date: Mon Jul 29 2013 08:35:56 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding fixes to scroll areas, and base control</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [5f8bf76867](https://github.com/underscorediscovery/luxe/commit/5f8bf76867fb61f561cd02da29540ced48eab6f2)   
author: underscorediscovery   
date: Mon Jul 29 2013 01:56:06 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding new files for ui</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [911dc880bb](https://github.com/underscorediscovery/luxe/commit/911dc880bba75832e6c4e7bf1e13ba24cb2ec3b2)   
author: underscorediscovery   
date: Mon Jul 29 2013 01:55:38 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>adding Lab.draw.text, added clipping to geometry and batcher, added toString for batcher and bitmapfont to show their names, fixing bugs in drawing text to be immediate, adding Rectangle.equal(other), fixing drop of CompositeGeometry</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [7e7c144c83](https://github.com/underscorediscovery/luxe/commit/7e7c144c836bdf39155a0de17fc90d9940b5e373)   
author: underscorediscovery   
date: Sun Jul 28 2013 07:50:24 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding test ui project</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [2babad9a69](https://github.com/underscorediscovery/luxe/commit/2babad9a69bf706c04513b013859cfc0122f51a7)   
author: underscorediscovery   
date: Sun Jul 28 2013 07:50:04 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding button labels</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [330d5266e8](https://github.com/underscorediscovery/luxe/commit/330d5266e8650460b66a67d4ccebbb05f2af50ee)   
author: underscorediscovery   
date: Sun Jul 28 2013 07:37:05 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixing scaling issue on the dimensions function</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [51dc32e604](https://github.com/underscorediscovery/luxe/commit/51dc32e604d8cb4dc82aad7d6ed78a76c4e1d427)   
author: underscorediscovery   
date: Sun Jul 28 2013 07:36:24 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixing scaling issue on the dimensions function</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [7b3e50d1fa](https://github.com/underscorediscovery/luxe/commit/7b3e50d1fa51f4ada6fe2f477e96a54c4c66ab76)   
author: underscorediscovery   
date: Sun Jul 28 2013 06:45:40 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding text vertical alignment, adding text bounds, fixing destroy function in Nineslice, adding Rectangle.set, .clone, fixing empty sample creator file</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [592e85cc18](https://github.com/underscorediscovery/luxe/commit/592e85cc18c306af2c8f8d1f91b50f2fe4071ef1)   
author: underscorediscovery   
date: Sat Jul 27 2013 23:18:53 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>adding image</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [df0d32b872](https://github.com/underscorediscovery/luxe/commit/df0d32b8728a97ab64f1f3887fe9cf22d73e397a)   
author: underscorediscovery   
date: Sat Jul 27 2013 23:18:25 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding a bunch of ui skinning stuff and additions to nineslice class</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [5aebd4759a](https://github.com/underscorediscovery/luxe/commit/5aebd4759a60f05fb7398496b568877ae682aa01)   
author: underscorediscovery   
date: Fri Jul 26 2013 06:58:33 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Various fixes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [269ad16ace](https://github.com/underscorediscovery/luxe/commit/269ad16ace18d5f45791a502a0e26f00b24a57ef)   
author: underscorediscovery   
date: Fri Jul 26 2013 06:57:39 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Various fixes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [9307073b13](https://github.com/underscorediscovery/luxe/commit/9307073b13cb12cb8ad25e8b52bacadcbc9e30ee)   
author: underscorediscovery   
date: Wed Jul 24 2013 06:28:45 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>fixing color on text constructor, and destroy to text class.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [f39df56915](https://github.com/underscorediscovery/luxe/commit/f39df569158a21fe7fe4908d88053e8eeac1e2eb)   
author: underscorediscovery   
date: Wed Jul 24 2013 06:28:30 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding basis for word game port</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [c4cb3a6ad2](https://github.com/underscorediscovery/luxe/commit/c4cb3a6ad2e9ced8c065096d56a67b4c3afc0e06)   
author: underscorediscovery   
date: Wed Jul 24 2013 02:48:29 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding missing RectangleGeometry file</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [56f3c79049](https://github.com/underscorediscovery/luxe/commit/56f3c790492d9f0d1aba2b9c45a4ed11d9af1b6e)   
author: underscorediscovery   
date: Wed Jul 24 2013 02:47:50 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixing immediate geometry bugs. adding draw.rectangle. Adding RectangleGeometry. Still need to add circle and Polygon (like draw n sides with x radius</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [16f12fcd26](https://github.com/underscorediscovery/luxe/commit/16f12fcd26b114afc1227d3117511542a6d1a64b)   
author: underscorediscovery   
date: Wed Jul 24 2013 02:21:59 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding test drawing project</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [ae6f13dfeb](https://github.com/underscorediscovery/luxe/commit/ae6f13dfebf0afcf6f2b0604c021ec493e16e4da)   
author: underscorediscovery   
date: Wed Jul 24 2013 02:21:09 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>adding draw interface to Lab.draw, adding initial modes class, for state machines. Fixing sprite centered point_inside</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [bd42735cee](https://github.com/underscorediscovery/luxe/commit/bd42735ceed998bd1e14dc52cc098eeb35e746fd)   
author: underscorediscovery   
date: Tue Jul 23 2013 23:08:23 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Updating parent properties to reflect child changes properly, fixing infinite recursion in particle systems. Added scene.create(Type, name) so that you can spawn an empty component of that type instead of creating an empty one, adding it, then add the child. Added sprite.locked = true for setting to static batching. Adding haxelib run lime copy <target> <dest folder> to move the files from a build over to a specific folder. for example ; lab build html5 && lab copy html5 ~/Dropbox/Public/test/</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [442a365905](https://github.com/underscorediscovery/luxe/commit/442a365905191092526fa73f6cb5945a3a117ef3)   
author: underscorediscovery   
date: Tue Jul 23 2013 20:22:45 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>adding more debug</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [5694f04f40](https://github.com/underscorediscovery/luxe/commit/5694f04f40c5c50f8324c53b0024c1f3de6e15a9)   
author: underscorediscovery   
date: Tue Jul 23 2013 19:46:06 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding missing file</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [f338b7c8bb](https://github.com/underscorediscovery/luxe/commit/f338b7c8bb50eec22dc945e3048ab201d5ded265)   
author: underscorediscovery   
date: Tue Jul 23 2013 19:40:29 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding text</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [43ba449834](https://github.com/underscorediscovery/luxe/commit/43ba449834d12c191b4013ac086edc34d0245145)   
author: underscorediscovery   
date: Tue Jul 23 2013 19:04:10 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>adding some logging to see</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [ff12f063c7](https://github.com/underscorediscovery/luxe/commit/ff12f063c7b51886b16e9b69073aeca6477fce99)   
author: underscorediscovery   
date: Tue Jul 23 2013 18:43:50 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Making sure debug code it out of the entity</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [7d6a001e89](https://github.com/underscorediscovery/luxe/commit/7d6a001e89415f6987921e4564e5cb45c18ae532)   
author: underscorediscovery   
date: Tue Jul 23 2013 18:31:49 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Updating with splits cos vc is lame</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [e19a467e3b](https://github.com/underscorediscovery/luxe/commit/e19a467e3bd29f7c514dfce4c937f0d035eb906c)   
author: underscorediscovery   
date: Tue Jul 23 2013 17:57:07 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixing dumb bugs and making a better cache system in the resource manager</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [bb8338cb0d](https://github.com/underscorediscovery/luxe/commit/bb8338cb0d6b8cb330fdf43115d88572dad5fdb0)   
author: underscorediscovery   
date: Tue Jul 23 2013 17:08:42 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Updating rendering in debug to be much faster</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [1718fe0151](https://github.com/underscorediscovery/luxe/commit/1718fe01510d5685e751ab13bc5493d244c3b454)   
author: underscorediscovery   
date: Tue Jul 23 2013 06:52:11 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Updating entity/component system to include parent transforms and properties, cascading into the tree. Along with a test case to see that these work</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [6f76153fd8](https://github.com/underscorediscovery/luxe/commit/6f76153fd8f10d2e143c4c081ef582f8f656f1d1)   
author: underscorediscovery   
date: Tue Jul 23 2013 01:23:43 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding sample folder</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [0040e45ab5](https://github.com/underscorediscovery/luxe/commit/0040e45ab59ab120ccd9833c1690bcff9f594063)   
author: underscorediscovery   
date: Tue Jul 23 2013 01:23:15 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding sample folder</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [e7c710dcb8](https://github.com/underscorediscovery/luxe/commit/e7c710dcb824b82b15904e76986a70c70a86cb37)   
author: underscorediscovery   
date: Tue Jul 23 2013 01:22:51 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding debug console, replacing trace with in game console</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [d46adb7898](https://github.com/underscorediscovery/luxe/commit/d46adb78982b738402f34fa5d55e32c7a97b94a4)   
author: underscorediscovery   
date: Mon Jul 22 2013 23:51:43 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding component test project</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [195e6138b8](https://github.com/underscorediscovery/luxe/commit/195e6138b8732b28517e68a316e9c20ef1453d53)   
author: underscorediscovery   
date: Mon Jul 22 2013 23:51:32 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixing bug in components system where child entities weren't called correctly</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [6181cd0c10](https://github.com/underscorediscovery/luxe/commit/6181cd0c108d5d59067dabdb3e519d5332426893)   
author: underscorediscovery   
date: Mon Jul 22 2013 23:24:47 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Updating run.n to include create commands for samples</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [be9090a40d](https://github.com/underscorediscovery/luxe/commit/be9090a40d107365332c791d477848278221644d)   
author: underscorediscovery   
date: Mon Jul 22 2013 13:06:09 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Updating stats</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [bcff6a323a](https://github.com/underscorediscovery/luxe/commit/bcff6a323a4095c540d151011661a18c4d7c6a27)   
author: underscorediscovery   
date: Sun Jul 21 2013 14:00:02 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding static batching geometry options, works for now, profiling to be done</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [9db96e8339](https://github.com/underscorediscovery/luxe/commit/9db96e833958e81b20a97139b540d935e7241afb)   
author: underscorediscovery   
date: Sun Jul 21 2013 11:22:54 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Making sure particles direction and speed works</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [be09228107](https://github.com/underscorediscovery/luxe/commit/be092281075c3fc585ec6b7d70b27bb8b8e852c2)   
author: underscorediscovery   
date: Sun Jul 21 2013 10:05:06 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding texture sizes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [1ba3c03e99](https://github.com/underscorediscovery/luxe/commit/1ba3c03e99ab2cb73907bae49ad61554c6aeffe8)   
author: underscorediscovery   
date: Sun Jul 21 2013 10:03:52 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding texture sizes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [9401deb846](https://github.com/underscorediscovery/luxe/commit/9401deb846206706363486400ad33fd4e150ebf0)   
author: underscorediscovery   
date: Sun Jul 21 2013 09:57:14 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding more statistics to the debug view</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [7377378058](https://github.com/underscorediscovery/luxe/commit/7377378058be20ccd708e73bac674daf19d3aa42)   
author: underscorediscovery   
date: Sun Jul 21 2013 07:32:16 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixing where the debug UI will move with the game camera</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [551c3ed881](https://github.com/underscorediscovery/luxe/commit/551c3ed8816622095d9f9e6af0746023d29ac509)   
author: underscorediscovery   
date: Sun Jul 21 2013 07:29:56 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Removing unneeded assets, Adding default UI skin into code for console to remove the dependency</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [1a498da9ce](https://github.com/underscorediscovery/luxe/commit/1a498da9cea6f07f6a3b4acb5610ef2136ad0293)   
author: underscorediscovery   
date: Sun Jul 21 2013 07:20:19 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixing text rendering to use actual_width in case. Fixing a bug in the texture state being never-set because of texture.loaded being false on the default font texture (i.e created with internal string array)</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [4dd4da9abf](https://github.com/underscorediscovery/luxe/commit/4dd4da9abf7fe831fe649021c00246afa108785c)   
author: underscorediscovery   
date: Sun Jul 21 2013 07:11:35 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>fixed camera not listening for sub property changes on position, added more debug output, added fixes to texture : onload is overloaded to take multiple listeners when set, so many listeners can work. Texture now works with deferred properties on filter and clamp type, fixed bugs in the texture properties order of loading, added internal load from byte string for textures, fixing webgl export problems with linear/nearest settings, adding NineSlice fixes to wait for the texture before being created so that they work as expected. Removing buggy test line of code on html5 target. Adding padding for html5 textures so that they work as expected (i.e you dont have to worry about power of two, it should just work as expected including the UV function).</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [5aa1067d86](https://github.com/underscorediscovery/luxe/commit/5aa1067d86c7fcfbfa8f25a360db996bdf3b029a)   
author: underscorediscovery   
date: Sun Jul 21 2013 03:12:17 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding debug statistics to console, fixing bugs in text</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [67b2fc6947](https://github.com/underscorediscovery/luxe/commit/67b2fc69475eeb453502b9bca32cc57367e1f9d0)   
author: underscorediscovery   
date: Sun Jul 21 2013 01:33:13 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixing default fonts, fixing geometry cleanups, fixing a bunch of minor bugs, adding a gaurd for the BinarySearchTree crashing on remove, adding remembering whether geometry is in a container or not, fixing bugs in text so it works much faster now and more probably but hey</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [8805d46cbe](https://github.com/underscorediscovery/luxe/commit/8805d46cbe2018b042eb9e412b8944880f524f5b)   
author: underscorediscovery   
date: Sun Jul 21 2013 00:11:32 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixing disabled by default geometry in Sprite bug</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [f67c431a45](https://github.com/underscorediscovery/luxe/commit/f67c431a45ea2540acd63c9404d7c01b21e20106)   
author: underscorediscovery   
date: Sat Jul 20 2013 23:56:38 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Making suitstory show thigns</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [07709a88b7](https://github.com/underscorediscovery/luxe/commit/07709a88b7304c04bfa2179ff607593ca9ac35de)   
author: underscorediscovery   
date: Sat Jul 20 2013 23:54:16 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Making suitstory show thigns</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [2f2e513c79](https://github.com/underscorediscovery/luxe/commit/2f2e513c794e50088bdc08be10016a14e7fddd5e)   
author: underscorediscovery   
date: Sat Jul 20 2013 23:49:58 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Temp disable the stupid fonts</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [8830b68e00](https://github.com/underscorediscovery/luxe/commit/8830b68e0040211a681561a81507307e1f80d0eb)   
author: underscorediscovery   
date: Sat Jul 20 2013 23:29:58 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixing compiling problems with large byte files</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [3bec823565](https://github.com/underscorediscovery/luxe/commit/3bec823565c24c6360b5d038674a81baa93837a4)   
author: underscorediscovery   
date: Sat Jul 20 2013 23:29:46 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixing compiling problems with large byte files</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [a8e4a03e05](https://github.com/underscorediscovery/luxe/commit/a8e4a03e050cdecd3b7cfccde6a26857fbe935c2)   
author: underscorediscovery   
date: Sat Jul 20 2013 22:52:57 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixing bugs in text not being created with size, visible not being correct, and allowing precreated fonts to be used, adding initial debug console, not ready yet though</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [64486c7c88](https://github.com/underscorediscovery/luxe/commit/64486c7c88f32b438ec33ea300e91946b76c8aa2)   
author: underscorediscovery   
date: Sat Jul 20 2013 17:51:26 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding more BST tests</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [f8e4383979](https://github.com/underscorediscovery/luxe/commit/f8e43839798544054c1dc1da8ff5ec2b69c817b5)   
author: underscorediscovery   
date: Sat Jul 20 2013 17:29:49 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding BST tests</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [3c3fa9c5e4](https://github.com/underscorediscovery/luxe/commit/3c3fa9c5e4e836cb5adc5f5e9e5c292c20a32dd0)   
author: underscorediscovery   
date: Sat Jul 20 2013 17:07:35 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding BST float and string test</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [4a937a4909](https://github.com/underscorediscovery/luxe/commit/4a937a4909cc8c044ad42a1896e09c2c8b8fe8ba)   
author: underscorediscovery   
date: Sat Jul 20 2013 17:00:47 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding simple BST test</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [c7e71f2978](https://github.com/underscorediscovery/luxe/commit/c7e71f2978866860cccc9ea4ea7c41418cdd60dd)   
author: underscorediscovery   
date: Sat Jul 20 2013 07:36:03 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Removing key repeat</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [224f2b1d95](https://github.com/underscorediscovery/luxe/commit/224f2b1d957943307cd3b85890140d3e899c3725)   
author: underscorediscovery   
date: Sat Jul 20 2013 07:30:57 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding batcher group listeners, adding simple particle system components (see suitstory project for example), fixing Vector having problems with Dynamic implement, Fixed sprite accidentally not creating geometry while texture was null, adding improvements to Entity</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [149250687b](https://github.com/underscorediscovery/luxe/commit/149250687b31d6326aa6aceb1adf328e88dd9325)   
author: underscorediscovery   
date: Fri Jul 19 2013 07:17:36 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixing negative dt, adding color.set and color.clone()</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [dd8ff39709](https://github.com/underscorediscovery/luxe/commit/dd8ff39709a6dbc32af0214715c606d3456421b0)   
author: underscorediscovery   
date: Fri Jul 19 2013 02:50:33 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding searching children and other fixes to the Entity apis, changing Lab.camera to a lab.Camera (not phoenix.Camera) so it can be extended and extend Entity, and take components.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [a925011d9e](https://github.com/underscorediscovery/luxe/commit/a925011d9e1857d276baca5cc8194ad5bad84804)   
author: underscorediscovery   
date: Fri Jul 19 2013 01:50:17 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding component system, basic Scene manager</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [0cd502755b](https://github.com/underscorediscovery/luxe/commit/0cd502755b53ad449ef4342ba0b054d92736733d)   
author: underscorediscovery   
date: Thu Jul 18 2013 22:47:34 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Updating docs a bit</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [bd2cc9bdc0](https://github.com/underscorediscovery/luxe/commit/bd2cc9bdc03d6bcbd2aa4f32d634b0f3c1bdefc3)   
author: underscorediscovery   
date: Thu Jul 18 2013 21:27:01 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding event system into the lab Core, might need some minor features from past-lab (like filters for events and such)</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [56a72ab977](https://github.com/underscorediscovery/luxe/commit/56a72ab97701d48ca40829a9194b7680dcac47dd)   
author: underscorediscovery   
date: Thu Jul 18 2013 21:15:37 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding Time class for time.schedule(time_in_seconds, function(){}, repeat?)</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [9d529db800](https://github.com/underscorediscovery/luxe/commit/9d529db800abaee697ca50966886822fc902be36)   
author: underscorediscovery   
date: Thu Jul 18 2013 02:08:45 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Cleaning up project folders</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [12144e8997](https://github.com/underscorediscovery/luxe/commit/12144e8997bc15a0fcc33874a6da076cc788b27c)   
author: underscorediscovery   
date: Wed Jul 17 2013 18:59:03 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding flags for window control from the project config, adding input typing and testing on iOS, adding multitouch support and more</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [76f4bc235f](https://github.com/underscorediscovery/luxe/commit/76f4bc235f6c61f4fa028b6fe47baf2473474122)   
author: underscorediscovery   
date: Sun Jul 14 2013 10:25:33 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>fixing silly error</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [b96a193cb9](https://github.com/underscorediscovery/luxe/commit/b96a193cb9da57c9ae58dd7ad504d3de4043641c)   
author: underscorediscovery   
date: Sun Jul 14 2013 09:59:16 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>fixing silly error</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [dd2059759b](https://github.com/underscorediscovery/luxe/commit/dd2059759b39ec71b9463ad39db5577a3b4ffb22)   
author: underscorediscovery   
date: Sun Jul 14 2013 09:55:13 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>fixing silly error</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [1d1d947f8f](https://github.com/underscorediscovery/luxe/commit/1d1d947f8f82bb7177c70be0da0a52b894befd5c)   
author: underscorediscovery   
date: Sun Jul 14 2013 09:48:11 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Updating to test platform code</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [1e3aaf7435](https://github.com/underscorediscovery/luxe/commit/1e3aaf7435b9fe14cb2da860b05f5d145aba3d99)   
author: underscorediscovery   
date: Sun Jul 14 2013 09:24:33 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding some gamepad code to test</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [15e42a7a7a](https://github.com/underscorediscovery/luxe/commit/15e42a7a7adbc31c1f6048b5d1663bb4a669d640)   
author: underscorediscovery   
date: Sun Jul 14 2013 09:03:24 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixing gamepad errors</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [8d1601ee81](https://github.com/underscorediscovery/luxe/commit/8d1601ee811aa2ddab22819aae6a4c3cfe127eb2)   
author: underscorediscovery   
date: Sun Jul 14 2013 08:55:24 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding some bindings for gamepad</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [912d0bfe3d](https://github.com/underscorediscovery/luxe/commit/912d0bfe3d2bfaa93ff0f851d7704d3ad9afd7d7)   
author: underscorediscovery   
date: Sun Jul 14 2013 08:08:18 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding fix for scale values being ridiculous. Adding some gamepad fixes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [16df9676e9](https://github.com/underscorediscovery/luxe/commit/16df9676e92d6c88b49076bc05f104e18a10c0ce)   
author: underscorediscovery   
date: Sun Jul 14 2013 07:18:45 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Keys</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [65ed3745ac](https://github.com/underscorediscovery/luxe/commit/65ed3745ac2d4507cd43713eddca5ee40d43a87d)   
author: underscorediscovery   
date: Sun Jul 14 2013 07:04:03 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixing scale issues in sprite</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [797cd4d28d](https://github.com/underscorediscovery/luxe/commit/797cd4d28d3261d20bb5fb7cf3a4558f0fafdf82)   
author: underscorediscovery   
date: Sun Jul 14 2013 06:57:45 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding key bindings for now, and adding a test for sprite size</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [ca482bc6b3](https://github.com/underscorediscovery/luxe/commit/ca482bc6b38da4e0e88ba455254810e73a1e3811)   
author: underscorediscovery   
date: Sun Jul 14 2013 06:48:15 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixing sprite scale at 1,1 from 0,0</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [3730fa3311](https://github.com/underscorediscovery/luxe/commit/3730fa33111c8440c98c8bcf823b701ced9c27da)   
author: underscorediscovery   
date: Sun Jul 14 2013 06:00:39 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding global dt to Lab.dt as well as passing into update() function on root</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [fbdaf1ffce](https://github.com/underscorediscovery/luxe/commit/fbdaf1ffce003128b02dafa0472f965dc91d0d29)   
author: underscorediscovery   
date: Sun Jul 14 2013 05:35:16 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixing scale function in sprite</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [5b9d80050c](https://github.com/underscorediscovery/luxe/commit/5b9d80050c29ed6240ac7ecda28d967b649efd58)   
author: underscorediscovery   
date: Sun Jul 14 2013 05:25:32 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding fixed for sprite resizing, scale wip</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [0ae0332a58](https://github.com/underscorediscovery/luxe/commit/0ae0332a58661c14e027a37fd1390259030b25ee)   
author: underscorediscovery   
date: Sun Jul 14 2013 05:21:48 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding fixed for sprite resizing, scale wip</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [dde4a15058](https://github.com/underscorediscovery/luxe/commit/dde4a150582eb336ed58b8399aa9dcc3d7caa995)   
author: underscorediscovery   
date: Sun Jul 14 2013 02:55:59 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding more fixes to the Vector class</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [e3a3556ee2](https://github.com/underscorediscovery/luxe/commit/e3a3556ee20f8ad776f664c230565f7a2d3502c7)   
author: underscorediscovery   
date: Sun Jul 14 2013 02:00:17 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding DivideScalar</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [8652532781](https://github.com/underscorediscovery/luxe/commit/8652532781f8a6decbbe8f25fdddc8c4641b2ed7)   
author: underscorediscovery   
date: Sun Jul 14 2013 01:58:49 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding some vector fixes, adding sprite sizing and scaling (wip)</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [e5c104cab0](https://github.com/underscorediscovery/luxe/commit/e5c104cab052c34ebfc368690eb6ece925139a01)   
author: underscorediscovery   
date: Fri Jul 12 2013 21:58:55 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Updating run file</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [9ebb8b9e24](https://github.com/underscorediscovery/luxe/commit/9ebb8b9e24ab5032e4b95f0f867be335a0c8a191)   
author: underscorediscovery   
date: Fri Jul 12 2013 21:30:58 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding run script</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [dcc6d5ff9e](https://github.com/underscorediscovery/luxe/commit/dcc6d5ff9e9c63c6db4c3af1b3ae05a1ee1323a2)   
author: underscorediscovery   
date: Fri Jul 12 2013 05:42:25 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>adding more fixes for screen size and camera positioning</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [6f578bce24](https://github.com/underscorediscovery/luxe/commit/6f578bce2461a4b24fcba1e253f4b973e30ffe9d)   
author: underscorediscovery   
date: Fri Jul 12 2013 05:31:33 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding config to core, adding Lab.screen.w and .h for size, adding new Cam2D class with screenshake</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [e6f9a20486](https://github.com/underscorediscovery/luxe/commit/e6f9a2048640ca14db77d7a546f82803dd1211e7)   
author: underscorediscovery   
date: Thu Jul 11 2013 21:42:58 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tweaking docs, trying to adjust the code completion, testing actuate</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [4de5a6a0c3](https://github.com/underscorediscovery/luxe/commit/4de5a6a0c3fd9ea50324a59d13c37a5389119a66)   
author: underscorediscovery   
date: Thu Jul 11 2013 20:24:36 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding documentation sources for building docs</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [7b26475791](https://github.com/underscorediscovery/luxe/commit/7b264757919b0e0a22d478c254c7914e1aae982e)   
author: underscorediscovery   
date: Thu Jul 11 2013 20:01:17 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>removing weird styling on docs sheet</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [a287127151](https://github.com/underscorediscovery/luxe/commit/a287127151a138aba2962bbc8dda5b4b6682b3a3)   
author: underscorediscovery   
date: Thu Jul 11 2013 19:07:43 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding docs</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [716a83bd98](https://github.com/underscorediscovery/luxe/commit/716a83bd983d258e9209e54c199b8a7b7c769fd4)   
author: underscorediscovery   
date: Thu Jul 11 2013 19:07:22 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding audio api</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [d3fc46b423](https://github.com/underscorediscovery/luxe/commit/d3fc46b4235da3ada5b158b4dd3e11cc1c3c390f)   
author: underscorediscovery   
date: Thu Jul 11 2013 19:06:50 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding audio api</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [31d678bb0f](https://github.com/underscorediscovery/luxe/commit/31d678bb0f1ce384dac264ec012c2dcf6444ecac)   
author: underscorediscovery   
date: Thu Jul 11 2013 09:14:18 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding sprite.radians and sprite.rotation fixes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [480e81df2f](https://github.com/underscorediscovery/luxe/commit/480e81df2fdbac510f53f2cae0cfc9d1f193990e)   
author: underscorediscovery   
date: Thu Jul 11 2013 06:54:49 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding required assets and Rectangle classes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [1552e39bea](https://github.com/underscorediscovery/luxe/commit/1552e39beab9c124a09f0fff18e31898716f14b8)   
author: underscorediscovery   
date: Thu Jul 11 2013 06:53:33 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding test sounds</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [0e96b9b869](https://github.com/underscorediscovery/luxe/commit/0e96b9b869063f406bbcba5dfdfabd2a34bfa680)   
author: underscorediscovery   
date: Thu Jul 11 2013 06:53:13 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding prelim audio support</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [8b7b2d95d7](https://github.com/underscorediscovery/luxe/commit/8b7b2d95d717a5d2f210e52511e9cb689abed3d2)   
author: underscorediscovery   
date: Thu Jul 11 2013 04:47:40 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>changing order in test project</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [1d6c7eb327](https://github.com/underscorediscovery/luxe/commit/1d6c7eb32730a9e2407a7f0cd52712943d59834e)   
author: underscorediscovery   
date: Thu Jul 11 2013 04:46:52 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding uv fixes for sprite (and other stuff)</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [d05170344e](https://github.com/underscorediscovery/luxe/commit/d05170344e7c32912255d6c06c8230f28b113df5)   
author: underscorediscovery   
date: Thu Jul 11 2013 02:29:08 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding UV code for sprite</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [db6e79586e](https://github.com/underscorediscovery/luxe/commit/db6e79586e03533bbe6d8928ba0211fda8630a37)   
author: underscorediscovery   
date: Thu Jul 11 2013 01:53:16 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding initial centered/origin values for sprite</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [a1c0177ceb](https://github.com/underscorediscovery/luxe/commit/a1c0177ceb7fbbb0c1cdd28cc7b983f8054781b1)   
author: underscorediscovery   
date: Thu Jul 11 2013 01:29:52 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adjusting sprite to use position modifier</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [fe174c70f5](https://github.com/underscorediscovery/luxe/commit/fe174c70f52d0cdb3e562ccff216ff17448c2743)   
author: underscorediscovery   
date: Thu Jul 11 2013 00:57:10 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding test for sprite pos moving the sprite</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [a19f5305f3](https://github.com/underscorediscovery/luxe/commit/a19f5305f3211a31d4ae66edb72702c1b6a7ad59)   
author: underscorediscovery   
date: Thu Jul 11 2013 00:53:48 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding texture fixes, sprite rotation, vector cleanups and more</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [b34f7b6804](https://github.com/underscorediscovery/luxe/commit/b34f7b6804173cc1f4dfb7c74797321f12b5ba32)   
author: underscorediscovery   
date: Wed Jul 10 2013 02:37:45 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixing texture issues hopefully</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [4ab09eb0c7](https://github.com/underscorediscovery/luxe/commit/4ab09eb0c761abe29e19660f2281957b3b01e673)   
author: underscorediscovery   
date: Tue Jul 09 2013 23:32:40 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding max texture size print quick</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [c9b047d982](https://github.com/underscorediscovery/luxe/commit/c9b047d9826c74cdd6fd3a23df68a06b9ec2fcb5)   
author: underscorediscovery   
date: Tue Jul 09 2013 23:32:07 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding max texture size print quick</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [bb4752d7e9](https://github.com/underscorediscovery/luxe/commit/bb4752d7e9679a9a118540cc6a94d0c6e5c636ab)   
author: underscorediscovery   
date: Tue Jul 09 2013 22:56:28 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixing noisy shader compiles</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [367bc70094](https://github.com/underscorediscovery/luxe/commit/367bc70094191948f1d28ef8550e75c4232a7955)   
author: underscorediscovery   
date: Tue Jul 09 2013 21:20:31 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixing app xml file</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [e97910d37d](https://github.com/underscorediscovery/luxe/commit/e97910d37df876d7ecffcb7cd37f51b7c5f11271)   
author: underscorediscovery   
date: Sun Jul 07 2013 09:05:11 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding text rendering. Adding Text class. Lots going on.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [6289cb513e](https://github.com/underscorediscovery/luxe/commit/6289cb513ee109ee4c556c56854a6bafa019bc2d)   
author: underscorediscovery   
date: Mon Jul 01 2013 05:53:40 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixing errors in GL.depthFunc being LESS, should LEQUAL for 2D (works with 3d too)</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [1083e04e1d](https://github.com/underscorediscovery/luxe/commit/1083e04e1d45ac5811202ddd3c678901d00c1f7a)   
author: underscorediscovery   
date: Mon Jul 01 2013 04:41:40 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>fixing the default clear color</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [263fd90c57](https://github.com/underscorediscovery/luxe/commit/263fd90c57568f395ea16c55f8af7ce2418f3ea9)   
author: underscorediscovery   
date: Mon Jul 01 2013 04:07:55 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding support for chrome, firefox, safari, opera and maybe others that represent the same options. Added fix for mouse position on cross browsers, fixing bugs in color code, fixing bugs in batcher. Renamed primitive_type to type: for options on Geometry constructor. Fixed alpha premultiply options (hopefully) in the browsers, making colors match better to OpenGL, including disabling premult for textures. Will optionify this later.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [e42f06d94c](https://github.com/underscorediscovery/luxe/commit/e42f06d94cc681bd539b18c9b6a9f851077079cc)   
author: underscorediscovery   
date: Sun Jun 30 2013 19:00:50 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding texture onloaded functions and callbacks in the sprite class (temp) so that images and sizes are loaded from the textures before they try to use them. This will be a fallback to a proper preloader, but it works well on all platforms. Exposed options to generate mipmaps instead of forcing them on always.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [507415cdb1](https://github.com/underscorediscovery/luxe/commit/507415cdb104fbd471f29f91ac20399aa4a35c09)   
author: underscorediscovery   
date: Sun Jun 30 2013 06:47:23 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding some fixes to binary search tree to allow exact matches by reference, adding the beginnings of the Lab api, adding bunches of fixes to sprites, changing the game lib a tiny bit for clarity.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [b85434749a](https://github.com/underscorediscovery/luxe/commit/b85434749a950d61bce6699ff3f2401f8bde4c94)   
author: underscorediscovery   
date: Sun Jun 30 2013 05:04:51 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adjusting batchstate geometry to work on html5 (GLProgram maps to webgl progam, and that has no .id...Naughty nme) also cleaning up shader logging code that wont spam when there is no need.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [2077e02c2f](https://github.com/underscorediscovery/luxe/commit/2077e02c2fad1aa7134636083a1cd7da73ac0917)   
author: underscorediscovery   
date: Sun Jun 30 2013 04:47:43 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixing logging in shaders being a mess, fixing example - immediate geometry is dropped every time so only draws once.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [926d6acbf1](https://github.com/underscorediscovery/luxe/commit/926d6acbf13149ab11ace854f71c5c59af4bad8f)   
author: underscorediscovery   
date: Sun Jun 30 2013 04:29:40 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding support for per geometry shaders, untextured geometry, vertex colors in the shaders, fixing bugs in the normals being passed into the shader, adding initial sprite class with minor support for being a sprite</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [b7a4750937](https://github.com/underscorediscovery/luxe/commit/b7a4750937ebb8ab835c6fae8c85b981979eb7ea)   
author: underscorediscovery   
date: Fri Jun 28 2013 06:23:16 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding fixes to multiple batchers. Adding other fixes, messing with cameras</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [6120043698](https://github.com/underscorediscovery/luxe/commit/61200436986f16b21a5a6f2c177ce628eeab282a)   
author: underscorediscovery   
date: Wed Jun 26 2013 13:44:10 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>making it 3D again</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [bd29d34f59](https://github.com/underscorediscovery/luxe/commit/bd29d34f59cdeaeab4db49efe639a2479ce9501a)   
author: underscorediscovery   
date: Wed Jun 26 2013 13:43:12 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixing bugs on rendering 2D camera, it was using old options code</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [66257c7c5f](https://github.com/underscorediscovery/luxe/commit/66257c7c5f02a0d2e63a609148df668f6c52d8d5)   
author: underscorediscovery   
date: Wed Jun 26 2013 13:41:41 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding fixes to the stupid obj loader invalidly loading the indices. Now renders 3D obj meshes ok (for the most part, there is still some issue but it appears to be affecting the sprites as well)</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [f7c1847854](https://github.com/underscorediscovery/luxe/commit/f7c1847854fea88726c9954a10f0c509dc59af60)   
author: underscorediscovery   
date: Wed Jun 26 2013 13:40:57 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding fixes to the stupid obj loader invalidly loading the indices. Now renders 3D obj meshes ok (for the most part, there is still some issue but it appears to be affecting the sprites as well)</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [9b388b4cb6](https://github.com/underscorediscovery/luxe/commit/9b388b4cb62d3c1e2acf08f2238251beb75c9d78)   
author: underscorediscovery   
date: Wed Jun 26 2013 01:25:29 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Updating logging for testing</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [bc2200ebbd](https://github.com/underscorediscovery/luxe/commit/bc2200ebbdbe7b261893e1a7ebcde0e6dac309f7)   
author: underscorediscovery   
date: Wed Jun 26 2013 01:22:06 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Updating logging for testing</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [4ac874abf5](https://github.com/underscorediscovery/luxe/commit/4ac874abf5d95ace2c22e959c85fc3e8e5f78e33)   
author: underscorediscovery   
date: Wed Jun 26 2013 01:19:36 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Updating logging for testing</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [2fc8edd508](https://github.com/underscorediscovery/luxe/commit/2fc8edd50891ac325d0efe3739d862b888c0a3ae)   
author: underscorediscovery   
date: Tue Jun 25 2013 23:56:14 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>fixing texture code inside phoenix</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [1f45284a7a](https://github.com/underscorediscovery/luxe/commit/1f45284a7ab86508618846a96548b9cf2086f839)   
author: underscorediscovery   
date: Tue Jun 25 2013 23:27:26 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding html5 support from lime, minor fixes to make it work out</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [ae95801cea](https://github.com/underscorediscovery/luxe/commit/ae95801cea545d61195d551d84fa789ad1aebed6)   
author: underscorediscovery   
date: Tue Jun 25 2013 04:01:12 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Cleaning up logs for now</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [0acd028404](https://github.com/underscorediscovery/luxe/commit/0acd0284042be75bf2d45dbe3bf0b00e32b07e2c)   
author: underscorediscovery   
date: Tue Jun 25 2013 03:57:48 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Updating readme for building info</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [e089ef6b28](https://github.com/underscorediscovery/luxe/commit/e089ef6b28c5dfd227e11aaf40f43c26f3992cdc)   
author: underscorediscovery   
date: Tue Jun 25 2013 03:46:45 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Renaming any lime references</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [175d51bc5f](https://github.com/underscorediscovery/luxe/commit/175d51bc5f12e245fe0564be61fc24d235ab8507)   
author: underscorediscovery   
date: Tue Jun 25 2013 03:13:19 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding some minor fixes to the batcher, seems to render correctly now. Geometry for quads is not really useful as a triangle strip for batching, so it should be triangles for better batching. When both geometries share the same texture they should still batch. Right now if you set them the same depth etc it fails to batch correctly. Still 2 draw calls )see the state came back dirty</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [b9b7318459](https://github.com/underscorediscovery/luxe/commit/b9b7318459af3dff2c87ebe00d83eb2cc29d072d)   
author: underscorediscovery   
date: Tue Jun 25 2013 00:58:28 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Getting rid of 000 verts</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [70df356b02](https://github.com/underscorediscovery/luxe/commit/70df356b02364fd4bcc6ed19e88455aba5014045)   
author: underscorediscovery   
date: Tue Jun 25 2013 00:55:53 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Keep chipping away at the broken batching</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [3ca1d9fb68](https://github.com/underscorediscovery/luxe/commit/3ca1d9fb6804eaa0069e910219e12401c3aa4e58)   
author: underscorediscovery   
date: Tue Jun 25 2013 00:52:39 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Keep chipping away at the broken batching</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [6cba8acc75](https://github.com/underscorediscovery/luxe/commit/6cba8acc757f24523401ccbf21412af0c44dd4d2)   
author: underscorediscovery   
date: Tue Jun 25 2013 00:09:03 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding new batching code that was missing</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [09585a80fd](https://github.com/underscorediscovery/luxe/commit/09585a80fd4c22019be4c44dab9d56c365e2fdf2)   
author: underscorediscovery   
date: Mon Jun 24 2013 23:51:27 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding more batch code</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [0687390bac](https://github.com/underscorediscovery/luxe/commit/0687390bac5cd9964f28ea1c630b32b43942d365)   
author: underscorediscovery   
date: Mon Jun 24 2013 22:31:38 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding better batch code based on phoenix.</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [e9966c19fc](https://github.com/underscorediscovery/luxe/commit/e9966c19fcdf53ec98f7e6cd759d81f23dc09db9)   
author: underscorediscovery   
date: Mon Jun 24 2013 19:42:42 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Resetting to more usable code for continuing</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [f5452c4294](https://github.com/underscorediscovery/luxe/commit/f5452c429456e6b2dbf67126318373816550fbac)   
author: underscorediscovery   
date: Mon Jun 24 2013 18:40:38 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixing texture loading sizes..</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [3e5ee902b2](https://github.com/underscorediscovery/luxe/commit/3e5ee902b25d9ed9c5978deb598a055c07a4ba88)   
author: underscorediscovery   
date: Mon Jun 24 2013 18:18:56 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding clearer texture loading from nme side</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [3252054ab4](https://github.com/underscorediscovery/luxe/commit/3252054ab4f189bbaf8a2d223ae9cdb080796e5b)   
author: underscorediscovery   
date: Mon Jun 24 2013 17:58:02 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>updating texture loading code for testing</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [9cfeebc7e2](https://github.com/underscorediscovery/luxe/commit/9cfeebc7e2db77a4072449e6bbefab05f6ebe0c6)   
author: underscorediscovery   
date: Mon Jun 24 2013 17:56:25 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Updating test image</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [2203c9f481](https://github.com/underscorediscovery/luxe/commit/2203c9f48167ee3cfb227c7ef64ec575070e8ec6)   
author: underscorediscovery   
date: Mon Jun 24 2013 17:53:43 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Updating test image</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [cd83b61c2d](https://github.com/underscorediscovery/luxe/commit/cd83b61c2de3818f301a8c4ba7b6ac5fe27dc4a6)   
author: underscorediscovery   
date: Mon Jun 24 2013 07:12:00 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding a obj loader, drawing functions for 3d perspective and camera, for some reason its not rendering its texture though</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [5a73d4caeb](https://github.com/underscorediscovery/luxe/commit/5a73d4caeb24d886f53bcb370008fc32ebb32c2e)   
author: underscorediscovery   
date: Mon Jun 24 2013 02:27:31 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Removing hxlode dependancy</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [36a98e0dbb](https://github.com/underscorediscovery/luxe/commit/36a98e0dbb61094898fd456fdb8f209bba3d6c0a)   
author: underscorediscovery   
date: Mon Jun 24 2013 02:26:36 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Cleaning up texture loading, moving it inside of texture, got it loaded and working nicely with png files using format.png for now</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [0633c98b93](https://github.com/underscorediscovery/luxe/commit/0633c98b938cca22677d2db9c9e1d7d477427f19)   
author: underscorediscovery   
date: Mon Jun 24 2013 00:55:49 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding texture loading, requires hxlode for now until we can get nme to cooperate with returning usable bytes</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [5d1cd826cc](https://github.com/underscorediscovery/luxe/commit/5d1cd826cc8717a53cd06ce5d33a32050f828686)   
author: underscorediscovery   
date: Sun Jun 23 2013 22:04:21 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>adding prelim camera rotation</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [50065d44bd](https://github.com/underscorediscovery/luxe/commit/50065d44bd04b301908d4b8ac068e7c7dbba6c11)   
author: underscorediscovery   
date: Sun Jun 23 2013 21:39:50 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding camera code and fixing render order due to tri stips</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [147d1ff13e](https://github.com/underscorediscovery/luxe/commit/147d1ff13edcbc917e747823b311a5eeb96e9b00)   
author: underscorediscovery   
date: Sun Jun 23 2013 21:36:40 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding camera code and fixing render order due to tri stips</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [e7ea98bd08](https://github.com/underscorediscovery/luxe/commit/e7ea98bd08c40f40095d92599951640d84964420)   
author: underscorediscovery   
date: Sun Jun 23 2013 20:00:22 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Add prelim batcher, now draws a silly square</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [172bd35ba6](https://github.com/underscorediscovery/luxe/commit/172bd35ba65a496939a74c8fe20bea1f4b2cddd1)   
author: underscorediscovery   
date: Sun Jun 23 2013 17:41:28 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Add prelim batcher, now draws a silly square</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [935cafd0e5](https://github.com/underscorediscovery/luxe/commit/935cafd0e5ef73784890e7743c166624d574291a)   
author: underscorediscovery   
date: Sun Jun 23 2013 16:04:58 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Cleaning up resource manager stuff</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [f45e36ba15](https://github.com/underscorediscovery/luxe/commit/f45e36ba1561f8ee92a70c7f7f929c73ee4a22c9)   
author: underscorediscovery   
date: Sun Jun 23 2013 15:55:26 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Cleaning up resource manager stuff</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [9778036255](https://github.com/underscorediscovery/luxe/commit/97780362554f2220d3b382ed5568a39e5123ff9e)   
author: underscorediscovery   
date: Sun Jun 23 2013 15:53:00 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Removing garbage collector stuff</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [20f1e5d988](https://github.com/underscorediscovery/luxe/commit/20f1e5d98815a0780f4b9e62fc63c2155608ec6b)   
author: underscorediscovery   
date: Sun Jun 23 2013 15:23:33 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adjusting to latest nmegl ready(nmegl lib)</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [42cc3151e0](https://github.com/underscorediscovery/luxe/commit/42cc3151e0df974843f8708e94366908d5001dd8)   
author: underscorediscovery   
date: Sun Jun 23 2013 07:08:27 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding initial phoenix classes, updating nmegl classes to match latest version</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [c1fba12f8d](https://github.com/underscorediscovery/luxe/commit/c1fba12f8d35c3d7da8a864c7e911018a1d216d7)   
author: underscorediscovery   
date: Sat Jun 22 2013 20:28:09 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding code for a test square on screen</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [e3052fb55e](https://github.com/underscorediscovery/luxe/commit/e3052fb55ed86bcd5f553dad78e79f9bd1367f74)   
author: underscorediscovery   
date: Sat Jun 22 2013 20:05:40 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixing null object reference on quitting, update loop accidentally calling dead objects (part of a bigger design not implemented yet)</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [2311188396](https://github.com/underscorediscovery/luxe/commit/231118839648a3c091966e185a6c80ba225ee098)   
author: underscorediscovery   
date: Sat Jun 22 2013 20:03:13 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Making OpenGL render, adding update process functions to subsystems, fixing some layout</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [2c9bc2c412](https://github.com/underscorediscovery/luxe/commit/2c9bc2c412337d33b79736ded6333bd2035c8ae9)   
author: underscorediscovery   
date: Sat Jun 22 2013 19:39:05 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixing some formatting errors</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [b10776b936](https://github.com/underscorediscovery/luxe/commit/b10776b936b899d82386d42e1391536898a40774)   
author: underscorediscovery   
date: Sat Jun 22 2013 19:32:40 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Switching to newer templates, and newer Lib.load, including GL class code</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [0bd7d04eac](https://github.com/underscorediscovery/luxe/commit/0bd7d04eacff29c75b478bddb0a7d0883b9bb2f5)   
author: underscorediscovery   
date: Sat Jun 22 2013 19:32:22 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Switching to newer templates, and newer Lib.load, including GL class code</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [66fbbbebfa](https://github.com/underscorediscovery/luxe/commit/66fbbbebfa1342d75b7036ef25f650c51cecfeb1)   
author: underscorediscovery   
date: Sat Jun 22 2013 18:03:19 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding OpenGL view set up calls and handles</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [48289e988c](https://github.com/underscorediscovery/luxe/commit/48289e988c7bad45d9d838603e92960c0cd13030)   
author: underscorediscovery   
date: Sat Jun 22 2013 17:46:59 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Fixing spacing. Windowing code will move out of core soon. First figure out OpenGLView</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [776afbad81](https://github.com/underscorediscovery/luxe/commit/776afbad818a091d1394803a5c8c5f236497d454)   
author: underscorediscovery   
date: Sat Jun 22 2013 17:44:23 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Testing user name</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [92f7d37ddf](https://github.com/underscorediscovery/luxe/commit/92f7d37ddfcf29f1f06efc29bd248f0645350485)   
author: Sven Bergström   
date: Sat Jun 22 2013 17:43:02 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Removing accidental typedef</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [6622ee2644](https://github.com/underscorediscovery/luxe/commit/6622ee2644d15fd67e7a7b5281cd874064e16b89)   
author: Sven Bergström   
date: Sat Jun 22 2013 17:42:21 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Simplifying api to lab instead of haxelab</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [6c0466a168](https://github.com/underscorediscovery/luxe/commit/6c0466a168ac2905ac2c9348eb985af1fd35f8ed)   
author: Sven Bergström   
date: Sat Jun 22 2013 17:22:06 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Removing Stupid DS_Store files</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [5b4a8bfee0](https://github.com/underscorediscovery/luxe/commit/5b4a8bfee03d4e4fcde5b8d563a3472e5957db03)   
author: Sven Bergström   
date: Sat Jun 22 2013 17:19:50 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding gitignore</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [58c7556a8a](https://github.com/underscorediscovery/luxe/commit/58c7556a8a116e8b1a6ed2be7b20690453083dbb)   
author: Sven Bergström   
date: Sat Jun 22 2013 17:06:18 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Removing Stupid DS_Store files</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [b87dbad487](https://github.com/underscorediscovery/luxe/commit/b87dbad487cc74508c0ed677f705fabf48038ad2)   
author: Sven Bergström   
date: Sat Jun 22 2013 17:05:16 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Adding projects folder</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [8dcfbab0ba](https://github.com/underscorediscovery/luxe/commit/8dcfbab0ba16bc74f9b15dcd9f6f83194c418307)   
author: Sven Bergström   
date: Sat Jun 22 2013 17:03:32 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Tidying input</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [802ac296b5](https://github.com/underscorediscovery/luxe/commit/802ac296b55c8ee0890ba3c2053817a647593292)   
author: Sven Bergström   
date: Sat Jun 22 2013 16:42:44 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Initial Commit</li></ul>
</div>
&nbsp;   
&nbsp;   
<div class="commit_info">

commit [0818841383](https://github.com/underscorediscovery/luxe/commit/08188413831adf1e4ea98dab4a7c30b29a10efef)   
author: Sven Bergström   
date: Sat Jun 22 2013 15:44:59 GMT-0230 (NDT)   
</div>

&nbsp;   
<div class="commit_message">

<ul><li>Initial commit</li></ul>
</div>
&nbsp;   
