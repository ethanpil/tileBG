------------------------------------------------------------------------        
--	==================
--	 tilebg.lua v1.0
--	==================
--
--  This creates a function tileBG() which will tile an image on the 
--  background of the display. It detects your display content height 
--  and attempts to calculate the minimum number of tiles needed (based 
--  on the size of the provided background tile.)
------------------------------------------------------------------------  
--	---------
--	USAGE
--	---------
--
--	1) Include the function in your code (probably main.lua)
--
-- 	    require( "tilebg" )
--
--
--  2) Now you can begin to use the function in your code. 
--
--		local bg = tileBG() --add a new background, use the default settings
--		
--  The function takes 3 optional arguments:
--
--		bgImageFile - the filename of the background image to tile
--		bgWidth - the width of the bgImagefile
--		bgHeight - the height of the bgImagefile
-- 
--	Default values
--  If the function is run without any arguments then it will use these values:
--
--		bgImageFile = tileBG.jpg
--		bgWidth = 100
--		bgHeight = 100
--
--	In other words, you can quickly use this code if you have an image file
--  called tileBG.jpg in your project folder, which is 100x100 pixels in size.
--
--  Its best to store the background in a local object, as demoed above:
-- 		local bg = tileBG()
--
--	Doing this, you can then use an build in method to self-destruct the tiles:
--		bg.removeBG()
--
--
--  Thats all there is to it. There is a full demo on the github repo. To make
--  things easier, the function logs everything it does to the console...
--
------------------------------------------------------------------------  
--	---------
--	CHANGELOG
--	---------
--
--	1.0 - First release
--
------------------------------------------------------------------------        

function tileBG(bgImageFile,bgWidth,bgHeight)
   
   print ("TileBG started.")
   
	--Set the defaults, for rapid calls and just in case
	bgImageFile = bgImageFile or "tileBG.jpg"
	bgWidth = bgWidth or 100
	bgHeight = bgHeight or 100
	
	--Calculate how manytimes to repeat the image based on display size, math.ceil roundup for loops
	local bgRepeatX=math.ceil(display.contentWidth/bgWidth) --number of times to repeat bg on x axis
	local bgRepeatY=math.ceil(display.contentHeight/bgHeight) --number of times to repeat bg on y axis
	local bgCount = bgRepeatX*bgRepeatY --total bg images placed
   
	--Useful debug info
	print ("TileBG: display.contentWidth: " .. display.contentWidth)
	print ("TileBG: display.contentHeight: " .. display.contentHeight)
	print ("TileBG: bgImageFile: " .. bgImageFile)
	print ("TileBG: bgWidth: " .. bgWidth)
	print ("TileBG: bgHeight: " .. bgHeight)
	print ("TileBG: bgRepeatX: " .. bgRepeatX .. "(number of times to repeat bg on X axis)")
	print ("TileBG: bgRepeatY: " .. bgRepeatY .. "(number of times to repeat bg on Y axis)")
	
	--Loop through and place the bg image
	local bgImages = {} --images table
	local bgLocationY = 0 --start at origin
	local bgLocationX = 0 --start at origin
	
	local tiledBG=display.newGroup()

	for bgY=1,bgRepeatY do
		local bgLocationX = 0 --reset x position each time we go to next row
		for bgX=1,bgRepeatX do
			tiledBG:insert(display.newImage( bgImageFile, bgLocationX, bgLocationY ))
			print ("TileBG: Placed tile at x,y: " .. bgLocationX .. "," .. bgLocationY)
			bgLocationX=bgLocationX+bgWidth
		end
		bgLocationY=bgLocationY+bgHeight
	end

	tiledBG:toBack() --make sure its on the background
	
   print ("TileBG: Placed " .. bgCount .. " images on background.")
   
   	--a function to cleanup the bg
	function tiledBG.removeBG ()
		if tiledBG.numChildren then
			 print ("TileBG: Removing " .. tiledBG.numChildren .. " images from background.")
			while tiledBG.numChildren > 0 do   -- we have have tiles left in the tiledbg group, so first clean them out		
					tiledBG:remove(tiledBG.numChildren) -- clean out the last member of the group (work from the top down!)
			end
		end	
		tiledBG:removeSelf() --whats left is now an empty group. remove it.
	    print ("TileBG: Removed background.")
		return
	end
 
   --Send everything back to mama
   return tiledBG
  
 end