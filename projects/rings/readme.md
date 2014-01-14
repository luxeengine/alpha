Controls:

Drag from the player to move (can only move to the blue arc!)
Drag outside the dark circle to shoot

Dragging slows down time based on how far away you are from the player

&nbsp;

Win by killing 10 enemies   
Hit enemy = +1 score   
Miss enemy = -3 score   

0.1.17 -
- Adding angle based direction modifier
- Fixing logic flaw where move could be initiated from a shoot start
- Tweaked enemy size and speed a bit for no reason

0.1.16 -
- Fixing accidental shooting when moving. When you initiate a move that's the only option because it's explicit

0.1.15 -
- Changed controls around AGAIN!!
- Redid controls logic entirely, eliminates some minor bugs
- Changed bullet speed to be constant for now 
- Changed slow distance to match new size
- Changed play field size considerably
- Added better visualization of the state you are in (move/shoot)
- Added delay to spam shooting

0.1.14 -
- Changed controls around!!
- Added sounds and music 
- Added aim direction
- Changed the way scoring works, you gain a point for hitting a enemy, but lose 3 for a miss.


0.1.13 -
- Changed line widths to better match screen size 
- Made shapes of enemies, projectiles and player more condusive to their collision shape
- Made enemies a tad more agressive to match changes to the player
- Tweaked range of time slow to be shorter (around the space between the shortest distance to the screen edge)
- Changed size of ring slightly, to better fit smaller screens
- Made blue line more prominent
- Made jump target same size as player, for precision jumping 
- Display red damage indicator when you lose health
- Increased player shoot speed 

0.1.12 -
- Implemented level structure for game states
- First level has win state, which shows in the beginning and end , and resets at the end
- Tweaked balance a bit for succeeding at the level
- Added visual progress meter for the first level
- Tweaked input timings to be more based on the size of the screen
- Permanently show the blue arc, much easier 

0.1.11 -
- Redid input mechanics, muccch better now on pc and mobile
- Performance tweaks
- Timeslow implemented properly now... much cooler.

0.1.10 -
- Yet more devices

0.1.9 -
- Adding more provisioned devices

0.1.8 - 
- Added some screen shake (what took so long) 
- Added tweaks to mechanics and timings
- Added blue ring to mark where you can and can't jump

0.1.7 -
- Added enemies shooting back at you.
- Fixed bugs with enemies not dying on game reset. Now full reset works.

0.1.6 -
- Fixing game reset, so that health resets, and that enemies are not kept alive

0.1.5 -
- Fixing bugs in shooting, adding more visual feedback, increasing bullet speeds.

0.1.4 -
- added enemies, health and a gameplay loop

0.1.3 - 
- performance fixes, tests and improvement

0.1.2 -
- added quick test shooting and fixing other issues

0.1.1 -  
- adding some devices
- fix showing landing rings when there is no chance of movement or landing
- fix finger size (hopefully)

0.1.0 - 
- first build to test movement and deployment
