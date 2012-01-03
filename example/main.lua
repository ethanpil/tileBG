require( "tilebg" ) --load the function
local bg = tileBG() --add a new backgroud, use the default settings

-- add some buttons to test functions

--add each button 3/4 of the way down (.75) and 1/4 of the display apart (.25)
btnOne = display.newImage( "btn/grass.png", display.contentWidth * .25, display.contentHeight * .75 )
btnTwo = display.newImage( "btn/tree.png", display.contentWidth * .5, display.contentHeight * .75 )
btnThree = display.newImage( "btn/water.png", display.contentWidth * .75, display.contentHeight * .75 )

--add some parameters to the buttons so we can reuse a single function
btnOne.bgImageFile = "bg/bg_tile_grass.jpg"
btnOne.bgWidth = 300
btnOne.bgHeight = 200

btnTwo.bgImageFile = "bg/bg_tile_trees.png"
btnTwo.bgWidth = 300
btnTwo.bgHeight = 300

btnThree.bgImageFile = "bg/bg_tile_water.jpg"
btnThree.bgWidth = 300
btnThree.bgHeight = 250

-- Tap on button event function
local function btnTap( event )
	bg.removeBG() --remove the old bg
	local bgImageFile = event.target.bgImageFile --read the value from the btn
	local bgWidth = event.target.bgWidth --read the value from the btn
	local bgHeight = event.target.bgHeight --read the value from the btn
	bg = tileBG(bgImageFile,bgWidth,bgHeight) --set the new bg
end

--Activate button listeners
btnOne:addEventListener( "tap", btnTap )
btnTwo:addEventListener( "tap", btnTap )
btnThree:addEventListener( "tap", btnTap )

