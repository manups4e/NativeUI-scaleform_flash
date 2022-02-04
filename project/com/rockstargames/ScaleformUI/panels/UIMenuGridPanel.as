class com.rockstargames.ScaleformUI.panels.UIMenuGridPanel extends com.rockstargames.ScaleformUI.panels.BasePanel
{
	var padding:Number = 0;
	var mx:Number = 0;
	var my:Number = 0;
	var _data;
	var _highlighted;
	var dotMC;
	var gridMC;
	var isAdjustable;
	var isSelectable;
	var itemTextRight;
	var labelMC;
	var _value;
	var txd_loader;
	var type;
	var _coords;
	var hovered = false;

	function UIMenuGridPanel(parentItem, upTx, rxTx, lxTx, downTx, valX, valY, animate, _hori)
	{
		super(parentItem);
		this._value = new Array();
		this.type = _hori;
		this.itemMC = parentItem._parentMenu._mainMC.attachMovie("UIMenuGridPanel", "gridPanel_" + parentItem.itemMC._name + "_" + (parentItem.panels.length + 1), parentItem._parentMenu._mainMC.getNextHighestDepth());
		this.backgroundMC = this.itemMC.bgMC;
		this.dotMC = this.itemMC.dotMC;
		this.gridMC = this.itemMC.gridMC;
		var _grid;
		if (animate != undefined)
		{
			if (animate)
			{
				if (this.dotMC._currentframe != 2)
				{
					this.dotMC.gotoAndStop(2);
				}
			}
			else if (this.dotMC._currentframe != 1)
			{
				this.dotMC.gotoAndStop(1);
			}
		}
		if (this.type == 1)
		{
			this.gridMC.gotoAndStop(_hori + 1);
			this.backgroundMC.gotoAndStop(_hori + 1);
			this.itemMC.labelMC.gotoAndStop(_hori + 1);
		}
		else
		{
			_grid = this.gridMC.attachMovie("txdLoader", "gridPanel", this.gridMC.getNextHighestDepth());
			this.SetClip(_grid,"pause_menu_pages_char_mom_dad","nose_grid");
		}
		this.gridMC.onRollOver = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOverGP, this.gridMC);
		this.gridMC.onRollOut = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOutGP, this.gridMC);

		this.itemTextRight = this.labelMC.valueTF;
		this.isAdjustable = true;
		this.padding = this.dotMC._x - this.gridMC._x;
		this.mx = this.gridMC._width - this.padding * 2;
		this.my = this.gridMC._height - this.padding * 2;
		com.rockstargames.ui.utils.UIText.setSizedText(this.itemMC.labelMC.upTF,upTx,true);
		com.rockstargames.ui.utils.UIText.setSizedText(this.itemMC.labelMC.rightTF,rxTx,true);
		com.rockstargames.ui.utils.UIText.setSizedText(this.itemMC.labelMC.downTF,downTx,true);
		com.rockstargames.ui.utils.UIText.setSizedText(this.itemMC.labelMC.leftTF,lxTx,true);
		if (valX != undefined && valY != undefined)
		{
			this._value = new Array(valX, valY);
		}
		else
		{
			this._value = new Array(0, 0);
		}
		this.Value = this._value;
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.backgroundMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
		//this.initBaseMouseInterface();
	}

	function mPressGP(mc)
	{
		com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"CONTINUOUS_SLIDER","HUD_FRONTEND_DEFAULT_SOUNDSET");
	}
	function mReleaseGP(mc)
	{
		com.rockstargames.ui.game.GameInterface.call("STOP_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE);
	}

	function mOverGP(mc)
	{
		this.hovered = true;
		this._hovered = true;

	}
	function mOutGP(mc)
	{
		this.hovered = false;
		this._hovered = false;
	}
	function SetClip(targetMC, textureDict, textureName, w, h, callback)
	{
		var _loaded = true;
		if (targetMC.textureFilename != textureName && targetMC.textureDict != textureDict)
		{
			_loaded = false;
		}
		/*
		if (targetMC.isLoaded)
		{
		targetMC.removeTxdRef();
		}
		*/ 
		targetMC.init("ScaleformUI",textureDict,textureName,w,h);
		var _loc7_ = 3;
		var _loc5_ = String(targetMC).split(".");
		var _loc8_ = _loc5_.slice(_loc5_.length - _loc7_).join(".");
		com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(targetMC);
		targetMC._alpha = 100;
		targetMC.requestTxdRef(_loc8_,_loaded,callback,this);
	}
	function onLoadInit(target_mc)
	{
		target_mc.onRollOver = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOverGP, target_mc);
		target_mc.onRollOut = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOutGP, target_mc);
		delete this.txd_loader;
	}

	function set Value(val)
	{
		this._value = val;
		if (this._value[0] > 1)
		{
			this._value[0] = 1;
		}
		if (this._value[0] < 0)
		{
			this._value[0] = 0;
		}
		if (this._value[1] > 1)
		{
			this._value[1] = 1;
		}
		if (this._value[1] < 0)
		{
			this._value[1] = 0;
		}
		this.dotMC._x = this.gridMC._x + this.padding + (this.mx * this._value[0]);
		if (this.type == 0)
		{
			this.dotMC._y = this.gridMC._y + this.padding + (this.my * this._value[1]);
		}
		else
		{
			this.dotMC._y = this.gridMC._y + this.padding + (this.my * 0.5);
		}
	}
	function get Value()
	{
		return this._value;
	}

	function set Coords(val)
	{
		if (this.hovered)
		{
			var coords = val;
			if (this.type == 0)
			{
				this.my = this.gridMC._height - this.padding * 2;
				var offset = ((this.itemMC._y + this.my) - this.padding * 2) - (this.gridMC._height / 2) - this.padding;
				coords[1] -= offset;
			}
			var valX = (coords[0] - this.gridMC._x - this.padding) / this.mx;
			var valY = (coords[1] - this.gridMC._y - this.padding) / this.my;
			this.Value = new Array(valX, valY);
		}
	}
	function get Coords()
	{
		return new Array(this.dotMC._x, this.dotMC._y);
	}

	function Select()
	{
		return this.Value.toString();
	}

	function Clear()
	{
		if (this.gridMC.gridPanel != undefined)
		{
			if (this.gridMC.gridPanel.isLoaded)
			{
				this.gridMC.gridPanel.removeTxdRef();
			}
		}
		this.itemMC.removeMovieClip();
	}

}