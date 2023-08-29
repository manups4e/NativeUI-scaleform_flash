class com.rockstargames.ScaleformUI.GameMap.Minimap
{
	var CONTENT;
	var itemMC;
	var mapContainer;
	var Map;
	var maps;
	var worldMapWidth;
	var worldMapHeight;
	var txd_loader;
	var centerX = 3523.8;
	var centerY = 7157.6;
	var topLeft = [-3745, 8020];
	var bottomRight = [4500, -4400.0];
	var bottomLeft = [-3745, -4400.0];
	var topRight = [4500, 8020];

	function Minimap(mc)
	{
		this.CONTENT = mc;
		this.itemMC = mc.createEmptyMovieClip("container", mc.getNextHighestDepth());
		this.itemMC.createEmptyMovieClip("map",this.itemMC.getNextHighestDepth());
		this.Map = this.itemMC.map.createEmptyMovieClip("mapLayer", this.itemMC.map.getNextHighestDepth());

		this.maps = new Array();

		this.worldMapWidth = 9216;
		this.worldMapHeight = 15360.002;

		this.Load("minimap_sea_0_0",this.MCLoaded);
		this.Load("minimap_sea_0_1",this.MCLoaded);
		this.Load("minimap_sea_1_0",this.MCLoaded);
		this.Load("minimap_sea_1_1",this.MCLoaded);
		this.Load("minimap_sea_2_0",this.MCLoaded);
		this.Load("minimap_sea_2_1",this.MCLoaded);
	}

	function ScaleMap(scale)
	{
		this.Map._width = this.worldMapWidth;
		this.Map._height = this.worldMapHeight;
		if (scale != 100)
		{
			this.itemMC.map._xscale = scale;
			this.itemMC.map._yscale = scale;
		}

		this.itemMC.map._x = 1280 / 2 - this.itemMC.map._width / 2;
		this.itemMC.map._y = 720 / 2 - this.itemMC.map._height / 2;

var gta5X:Number = 0; // Replace with your GTA5 X coordinate
var gta5Y:Number = 0; // Replace with your GTA5 Y coordinate
var gta5MaxX:Number = 500; // Replace with your GTA5 maximum X value
var gta5MaxY:Number = 500; // Replace with your GTA5 maximum Y value
var scaleformMaxX:Number = 1920; // Replace with your Scaleform maximum X value
var scaleformMaxY:Number = 1080; // Replace with your Scaleform maximum Y value

		var comb = this.Map.attachMovie("colour_pent", "_0", this.Map.getNextHighestDepth());
		var coord = this.convertGTA5ToScaleform([0, 0]);

		var comb_2 = this.Map.attachMovie("colour_pent", "_1", this.Map.getNextHighestDepth());
		var coord_2 = this.convertGTA5ToScaleform([-1266.723, -2986.771]);

		comb._xscale = comb._yscale = 200;
		comb._x = coord.x;
		comb._y = coord.y;
		com.rockstargames.ui.utils.Colour.ApplyHudColour(comb,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED);

		comb_2._xscale = comb_2._yscale = 200;
		comb_2._x = 3523.8;
		comb_2._y = 7157.6;
		com.rockstargames.ui.utils.Colour.ApplyHudColour(comb_2,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PURPLE);

		com.rockstargames.ui.utils.Debug.log("MAP size => w: " + this.Map._width + ", " + this.Map._height);
		com.rockstargames.ui.utils.Debug.log("denomal coord => " + coord.x + ", " + coord.y);
		com.rockstargames.ui.utils.Debug.log("denomal coord_2 => " + coord_2.x + ", " + coord_2.y);

		//com.rockstargames.ui.tweenStar.TweenStarLite.to(
		this.Map.onPress = function()
		{
			this.startDrag();
		};

		this.Map.onRelease = this.Map.onReleaseOutside = function ()
		{
			this.stopDrag();
		};
	}

	function convertGTA5ToScaleform(gta5X:Number, gta5Y:Number, gta5MaxX:Number, gta5MaxY:Number, scaleformMaxX:Number, scaleformMaxY:Number)
	{
		var scaleXFactor:Number = scaleformMaxX / (2 * gta5MaxX);
		var scaleYFactor:Number = scaleformMaxY / (2 * gta5MaxY);

		var scaleformX:Number = (gta5X + gta5MaxX) * scaleXFactor;
		var scaleformY:Number = (gta5MaxY - gta5Y) * scaleYFactor;

		return {x:scaleformX, y:scaleformY};
	}


	function mouseMoving()
	{
		var globalX = _root._xmouse;
		var globalY = _root._ymouse;

		// Convert global coordinates to local coordinates of the movie clip
		var localCoordinates:Object = {x:globalX, y:globalY};
		this.Map._parent.globalToLocal(localCoordinates);

		var movieClipWidth = 1280;
		var movieClipHeight = 720;

		var centerX = localCoordinates.x + (movieClipWidth / 2);
		var centerY = localCoordinates.y + (movieClipHeight / 2);



		// Use the centerX and centerY coordinates as needed
		// For example, update the position of another movie clip
		this.Map._x = centerX;
		this.Map._y = centerY;

	}


	function Load(txd, callback)
	{
		var mc = this.Map.attachMovie("txdLoader", txd, this.Map.getNextHighestDepth());
		this.maps.push(mc);
		com.rockstargames.ScaleformUI.utils.MovieClipHandler.SetClip(mc,txd,txd,3834,3834,callback,this);
	}
	function MCLoaded()
	{
		if (this.Map.minimap_sea_0_0 != undefined)
		{
			this.Map.minimap_sea_0_0._x = 0;
			this.Map.minimap_sea_0_0._y = 0;
		}
		if (this.Map.minimap_sea_0_1 != undefined)
		{
			this.Map.minimap_sea_0_1._x = 3833.5;
			this.Map.minimap_sea_0_1._y = 0;
		}
		if (this.Map.minimap_sea_1_0 != undefined)
		{
			this.Map.minimap_sea_1_0._x = 0;
			this.Map.minimap_sea_1_0._y = 3833.5;
		}
		if (this.Map.minimap_sea_1_1 != undefined)
		{
			this.Map.minimap_sea_1_1._x = 3833.5;
			this.Map.minimap_sea_1_1._y = 3833.5;
		}
		if (this.Map.minimap_sea_2_0 != undefined)
		{
			this.Map.minimap_sea_2_0._x = 0;
			this.Map.minimap_sea_2_0._y = 3834 + 3833.5;
		}
		if (this.Map.minimap_sea_2_1 != undefined)
		{
			this.Map.minimap_sea_2_1._x = 3833.5;
			this.Map.minimap_sea_2_1._y = 3834 + 3833.5;
			this.Map._width = this.worldMapWidth;
			this.Map._height = this.worldMapHeight;
		}
	}

	function set Visible(bool)
	{
		this.itemMC._visible = bool;
	}

	function get Visible()
	{
		return this.itemMC._visible;
	}

	function Clear()
	{
		for (var i in this.maps)
		{
			this.maps[i].removeMovieClip();
		}
		this.Map.removeMovieClip();
		this.itemMC.removeMovieClip();
	}

}