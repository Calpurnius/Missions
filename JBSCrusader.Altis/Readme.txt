Sushi's Breaching Script - Yak's Fix

Credits and Thanks:

This script owes it's roots to Sushi's breaching script, found here:
http://www.armaholic.com/page.php?id=30573
This is based off V. 1.3 of sushi's script, which had a lot of good fixes and code.  I helped with some of the code in the past, but the reality is 99% of this work is Sushi's and as such, here are Sushi's original credits and thanks:

"This script is inspired by great Jarhead (http://www.armaholic.com/page.php?id=25202) script and i use little part of his code to place explosives on doors and stun AI. All credits for this part of code should go to him.
Version 1.2 was created with huge help of Yakavetta[31stMEU]. Thank You for Your feedback and parts of code."

I don't own any rights to this script, and can not give you permission to edit, modify or release it.  I am only releasing this on my own because I have helped sushi in the past, and he has been unresponsive and radio silent after his v 1.3 release.  I have contacted administrators for Armaholic prior to releasing this, as well, to inform them of my intent.  If he shows back up, I fully expect this mod to become defunct and all of the work I've done to be rolled into a new version of his mod.  Sorry for any trouble this may cause future modders who want to edit this script.

Installation instructions:

Add this entire package to your mission folder in "\Documents\Arma 3 - Other Profiles\(Profile Name)\Missions\(Misison Name)"
If you already have a description.ext, just copy and paste the contents of this description into your existing one
Add a marker over the area you wish to close/lock doors to
Name the marker something using simple naming (no spaces, symbols, etc for simplicity.  Uses something like: "LockAllDoors1, "CloseAllDoors", etc)
Save the mission file
go into the mission folder as described above, and open up the "sushi_scripts" folder
Edit the "breach-settings.cpp" in your favorite editing tool.  I prefer Notepad++
Decide which features you want to use "LockFrontDoorsOnly, AllowLockPick, lockall, etc." 
Check the "class lockDoor, class zone_1, and change the zone = "doorlockall1" to the marker name you made.
Save, export the mission file to MP, and host a local MP server to test.

If you have doors you want to close, and they are not closing, try changing closefix to 1.  ArmA buildings are funny, and this can often work.



Changelog:

Yak's Fix Version 1.2
Fixed bug where closefix=1 and lockfrontdoorsonly = 1 wouldn't work properly.  

Yak's Fix Version 1.1
Added more doors
Fixed a bug with CUP Middle Eastern Buildings, should be compatible with all CUP ME buildings now

Yak's Fix Version 1.0
Initial Release freom V1.3 of Sushi's Script
Added multiple CUP Building Doors
Fixed Join in Progress Multiplayer errors
Fixed bug caused by player death (menu items would disappear)
Fixed initial load times when marker covers the entire screen (reduced load times from upwards of 30 minutes to 1-3 minutes) 
This will not work in the editor/SP only missions.  It depends on a multiplayer environment, and at least a locally hosted MP game to work.  Sorry, but unfortunately that's how I was able to fix a lot of the code

Sush's ChangeLog:
v1.3
+Added more door name support by default
+Added new param: customDoorAnim - for defining custom door anim related to custom door names
^Reduced delay when door are breaching by explosive

v1.2
+Added new param: closeFix - it allows "fix" closing doors on maps with invertet animation values
+Added new param: customDoorNames - for defining custom door names if needed
+Added new param: closeDoors - for closing all doors in zone
-Better support for non standard maps
-Some smaller fixes

v1.0
- first release