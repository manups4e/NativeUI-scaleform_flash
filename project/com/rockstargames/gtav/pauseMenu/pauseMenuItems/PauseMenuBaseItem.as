class com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem extends com.rockstargames.ui.components.GUIMenuItem
{
	var index = 0;
	var type = 0;
	var menuID = 0;
	var initialIndex = 0;
	var selectedIndex = 0;
	var isAdjustable = false;
	var isSelectable = 1;
	var _uniqueID = 0;
	var bAlpha = 0;
	var itemHeight = 25;
	var menuPrefOffset = 1000;
	var _columnID = -1;
	function PauseMenuBaseItem()
	{
		super();
		this.sizeText = true;
		this.itemTextLeft = this.labelMC.titleTF;
		this.highlighted = this._highlighted;
		this.mInit();
	}
	function set uniqueID(uID)
	{
		this._uniqueID = uID;
	}
	function get uniqueID()
	{
		return this._uniqueID;
	}
	function set data(_d)
	{
		this.index = _d[0];
		this.menuID = _d[1];
		this.uniqueID = _d[2];
		this.type = _d[3];
		this.initialIndex = _d[4];
		this.isSelectable = _d[5];
		if (_d.length >= 7)
		{
			this._data = _d.slice(6);
		}
		if (this._data[0] != undefined)
		{
			if (this.sizeText)
			{
				com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextLeft,this._data[0]);
			}
		}
	}
	function get data()
	{
		return this._data;
	}
	function checkSelectable()
	{
		var _loc2_ = true;
		if (this.isSelectable == -1)
		{
			_loc2_ = false;
		}
		return _loc2_;
	}
	function set highlighted(_h)
	{
		var _loc2_ = new com.rockstargames.ui.utils.HudColour();
		var _loc3_ = new com.rockstargames.ui.utils.HudColour();
		if (_h)
		{
			com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,_loc2_);
			com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc3_);
		}
		else
		{
			com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc2_);
			com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc3_);
		}
		if (this.bgMC != undefined)
		{
			com.rockstargames.ui.utils.Colour.Colourise(this.bgMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
		}
		if (this.labelMC != undefined)
		{
			com.rockstargames.ui.utils.Colour.Colourise(this.labelMC,_loc2_.r,_loc2_.g,_loc2_.b,_loc2_.a);
		}
		this._highlighted = _h;
	}

	function get highlighted()
	{
		return this._highlighted;
	}
	function snapBGGrid(bgMC)
	{
		var _loc2_ = Math.ceil(this.itemTextLeft.textHeight / 27);
		bgMC._height = _loc2_ * 27;
	}
	function stepVal(dir)
	{
	}
	function setPref(val)
	{
		if (this.uniqueID >= 0 && this.uniqueID < this.menuPrefOffset)
		{
			com.rockstargames.ui.game.GameInterface.call("SET_PAUSE_MENU_PREF",com.rockstargames.ui.game.GameInterface.PAUSE_TYPE,this.uniqueID,val);
		}
	}
	function mInit()
	{
		if (this.bMC)
		{
			this.bMC.removeMovieClip();
		}
		this.bMC = this.createEmptyMovieClip("bMC", 9999);
		this.createButton();
		this.bMC._alpha = this.bAlpha;
		this.bMC.onRelease = mx.utils.Delegate.create(this, this.mPress);
		this.bMC.onRollOver = mx.utils.Delegate.create(this, this.mOver);
		this.bMC.onRollOut = mx.utils.Delegate.create(this, this.mOut);
	}
	function createButton()
	{
		this.bMC.clear();
		this.bMC.beginFill(16777215);
		this.bMC.moveTo(0,0);
		this.bMC.lineTo(this.bgMC._width,0);
		this.bMC.lineTo(this.bgMC._width,this.bgMC._height);
		this.bMC.lineTo(0,this.bgMC._height);
		this.bMC.lineTo(0,0);
		this.bMC.endFill();
	}
	function set columnID(cID)
	{
		this._columnID = cID;
	}
	function get columnID()
	{
		return this._columnID;
	}
	function mouseOver(b)
	{
		if (b)
		{
			if (!this.highlighted)
			{
				this.bMC._alpha = 20;
			}
		}
		else
		{
			this.bMC._alpha = 0;
		}
	}
	function mOver()
	{
		_level0.TIMELINE.M_OVER_EVENT(this.index,this.columnID,this);
	}
	function mOut()
	{
		_level0.TIMELINE.M_OUT_EVENT(this.index,this.columnID);
	}
	function mPress()
	{
		if (!this.__get__highlighted())
		{
			_level0.TIMELINE.M_PRESS_EVENT(this.index,this.columnID,false);
		}
		else
		{
			_level0.TIMELINE.M_PRESS_EVENT(this.index,this.columnID,true);
		}
	}
}