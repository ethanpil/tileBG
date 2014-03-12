# tilebg.lua v1.1
For Corona SDK
***
This creates a function tileBG() which will tile an image on the background of the display. It detects your display content height and attempts to calculate the minimum number of tiles needed (based on the size of the provided background tile.)

# USAGE

1) Include the function in your code (probably main.lua)

	require( "tilebg" )


2) Now you can begin to use the function in your code. 

	local bg = tileBG() add a new background, use the default settings
	
The function takes 3 optional arguments:

	bgImageFile - the filename of the background image to tile
	bgWidth - the width of the bgImagefile
	bgHeight - the height of the bgImagefile

Default values
If the function is run without any arguments then it will use these values:

	bgImageFile = tileBG.jpg
	bgWidth = 100
	bgHeight = 100

In other words, you can quickly use this code if you have an image file called tileBG.jpg in your project folder, which is 100x100 pixels in size.

Its best to store the background in a local object, as demoed above:

	local bg = tileBG()

Doing this, you can then use an build in method to self-destruct the tiles:

	bg.removeBG()

Thats all there is to it. There is a full demo on the github repo. To make things easier, the function logs everything it does to the console...

# CHANGELOG
1.1 - Updated graphics code from onesvat
1.0 - First release

