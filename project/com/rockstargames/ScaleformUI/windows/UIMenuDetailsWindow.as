class com.rockstargames.ScaleformUI.windows.UIMenuDetailsWindow
{
	var itemMC;
	var _parentMenu;
	var detail0;
	var detail1;
	var detail2;
	var _background;
	var DESC_TYPE_TXT = 0;
	var DESC_TYPE_SC = 1;
	var DESC_TYPE_INV_SENT = 2;
	var startStatLabelAnim = false;
	var leftEmblemMC;
	var wheelRadius;
	var currentAngle;
	var statsMaxDegrees = [];
	var PI_OVER_180 = 0.017453292519943295;
	var TextureID;
	var totalStats;
	function UIMenuDetailsWindow(parentMenu, _det0, _det1, _det2, txd, txn, x, y, w, h)
	{
		this.statsMaxDegrees = new Array();
		this.currentAngle = 0;
		this.itemMC.statWheelMC.wheelMC.clear();
		this._parentMenu = parentMenu;
		this.itemMC = this._parentMenu._mainMC.attachMovie("UIMenuDetailsWindow", "detailsWindow_" + this._parentMenu._mainMC.getNextHighestDepth(), this._parentMenu._mainMC.getNextHighestDepth());
		this._background = this.itemMC.headerBGMC;
		this.detail0 = this.itemMC.item0TF;
		this.detail1 = this.itemMC.item1TF;
		this.detail2 = this.itemMC.item2TF;
		com.rockstargames.ui.utils.UIText.setSizedText(this.detail0,_det0,true,true);
		com.rockstargames.ui.utils.UIText.setSizedText(this.detail1,_det1,true,true);
		com.rockstargames.ui.utils.UIText.setSizedText(this.detail2,_det2,true,true);

		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.itemMC.headerBGMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
		com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.itemMC.item0TF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
		com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.itemMC.item1TF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
		com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.itemMC.item2TF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
		if (x == undefined)
		{
			x = 0;
		}
		if (y == undefined)
		{
			y = 0;
		}
		if (w == undefined)
		{
			w = 64;
		}
		if (h == undefined)
		{
			h = 64;
		}
		if (txd != undefined && txd != "" && txn != undefined && txn != "")
		{
			this.itemMC.statWheelMC._visible = false;
			this.leftEmblemMC = this.itemMC.cMC.attachMovie("txdLoader", "uimenudetailswindow", this.itemMC.getNextHighestDepth(), {_x:14, _y:9});
			if (this.leftEmblemMC.textureFilename != txd && this.leftEmblemMC.textureDict != txn)
			{
				if (this.leftEmblemMC.isLoaded)
				{
					this.leftEmblemMC.removeTxdRef();
				}
				this.leftEmblemMC.init("ScaleformUI",txd,txn,w,h);
				var _loc7_ = 3;
				var _loc5_ = String(this.leftEmblemMC).split(".");
				var _loc8_ = _loc5_.slice(_loc5_.length - _loc7_).join(".");
				com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.leftEmblemMC);
				this.leftEmblemMC._alpha = 100;
				this.leftEmblemMC.addTxdRef(_loc8_,this.txdloaded,this);
			}
		}
		else
		{
			this.TextureID = txd;
			if (this.TextureID == "statWheel")
			{
				this.itemMC.statWheelMC._visible = true;
				this.itemMC.rankEmblemMC._visible = false;
				this.itemMC.rankEmblemBG._visible = false;
				com.rockstargames.ui.utils.Colour.ApplyHudColour(this.itemMC.statWheelMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
				com.rockstargames.ui.utils.Colour.ApplyHudColour(this.itemMC.statWheelMC.bgFillMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
				this.itemMC.statWheelMC.bgFillMC._alpha = 20;
				this.wheelRadius = this.itemMC.statWheelMC.bgFillMC._width * 0.5;
				this.itemMC.statWheelMC.createEmptyMovieClip("wheelMC",this.itemMC.getNextHighestDepth(),{_x:0, _y:0});
				this.itemMC.statWheelMC.wheelMC.setMask(this.itemMC.statWheelMC.maskMC);
			}
			else
			{
				this.itemMC.statWheelMC._visible = false;
				this.itemMC.rankEmblemMC._visible = true;
				this.itemMC.rankEmblemBG._visible = true;
				com.rockstargames.ui.utils.Colour.ApplyHudColour(this.itemMC.rankEmblemMC,116);
			}
		}
	}

	function setValues(_det0, _det1, _det2, txd, txn, x, y, w, h)
	{
		if (x == undefined)
		{
			x = 0;
		}
		if (y == undefined)
		{
			y = 0;
		}
		if (w == undefined || w == 0)
		{
			w = 64;
		}
		if (h == undefined || h == 0)
		{
			h = 64;
		}
		if (txd != undefined && txd != "" && txn != undefined && txn != "")
		{
			this.itemMC.statWheelMC._visible = false;
			this.leftEmblemMC = this.itemMC.cMC.attachMovie("txdLoader", "uimenudetailswindow", this.itemMC.getNextHighestDepth());
			if (this.leftEmblemMC.textureFilename != txd && this.leftEmblemMC.textureDict != txn)
			{
				if (this.leftEmblemMC.isLoaded)
				{
					this.leftEmblemMC.removeTxdRef();
				}
				this.leftEmblemMC.init("ScaleformUI",txd,txn,w,h);
				var _loc7_ = 3;
				var _loc5_ = String(this.leftEmblemMC).split(".");
				var _loc8_ = _loc5_.slice(_loc5_.length - _loc7_).join(".");
				com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.leftEmblemMC);
				this.leftEmblemMC._alpha = 100;
				this.leftEmblemMC._x = x;
				this.leftEmblemMC._y = y;
				this.leftEmblemMC.addTxdRef(_loc8_,this.txdloaded,this);
			}
		}
		else
		{
			this.TextureID = txd;
			if (txd == "statWheel")
			{
				this.itemMC.rankEmblemMC._visible = false;
				this.itemMC.rankEmblemBG._visible = false;
				this.itemMC.statWheelMC._visible = true;
				com.rockstargames.ui.utils.Colour.ApplyHudColour(this.itemMC.statWheelMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
				com.rockstargames.ui.utils.Colour.ApplyHudColour(this.itemMC.statWheelMC.bgFillMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
				this.itemMC.statWheelMC.bgFillMC._alpha = 20;
				this.wheelRadius = this.itemMC.statWheelMC.bgFillMC._width * 0.5;
			}
			else
			{
				this.itemMC.statWheelMC._visible = false;
				this.itemMC.rankEmblemMC._visible = true;
				this.itemMC.rankEmblemBG._visible = true;
				com.rockstargames.ui.utils.Colour.ApplyHudColour(this.itemMC.rankEmblemMC,116);
			}
		}
		com.rockstargames.ui.utils.UIText.setSizedText(this.detail0,_det0,true,true);
		com.rockstargames.ui.utils.UIText.setSizedText(this.detail1,_det1,true,true);
		com.rockstargames.ui.utils.UIText.setSizedText(this.detail2,_det2,true,true);
	}

	function txdloaded()
	{
		this.itemMC.rankEmblemMC._visible = false;
		this.itemMC.rankEmblemBG._visible = false;
		this.leftEmblemMC._alpha = 0;
		com.rockstargames.ui.tweenStar.TweenStarLite.to(this.leftEmblemMC,0.2,{_alpha:100});
	}

	function addStatToWheel(pctComplete, statColourEnum)
	{
		pctComplete = Math.min(pctComplete, 100);
		var stat = new com.rockstargames.ScaleformUI.windows.WheelStat(pctComplete, statColourEnum);
		this.statsMaxDegrees.push(stat);
		this.updateStatWheel();
	}

	function updateStatWheel()
	{
		this.currentAngle = 0;
		this.itemMC.statWheelMC.wheelMC.clear();
		this.itemMC.statWheelMC.wheelMC.removeMovieClip();
		this.totalStats = 0;
		this.itemMC.statWheelMC.createEmptyMovieClip("wheelMC",this.itemMC.getNextHighestDepth(),{_x:0, _y:0});
		this.itemMC.statWheelMC.wheelMC.setMask(this.itemMC.statWheelMC.maskMC);
		for(var i in this.statsMaxDegrees)
		{
			this.totalStats = this.totalStats + this.statsMaxDegrees[i].Percentage ;
		}
		for (var stat in this.statsMaxDegrees)
		{
			if (this.statsMaxDegrees[stat].Percentage > 0)
			{
				var perc = this.statsMaxDegrees[stat].Percentage / this.totalStats;
				var loc = this.currentAngle + (perc * 360);
				this.drawArc(this.currentAngle,loc,this.statsMaxDegrees[stat].Colour);
				this.currentAngle = loc;
			}
		}
	}

	function updateStatistic(id, pctComplete, statColourEnum)
	{
		pctComplete = Math.min(pctComplete, 100);
		this.statsMaxDegrees[id] = new com.rockstargames.ScaleformUI.windows.WheelStat(pctComplete, statColourEnum);
		this.updateStatWheel();
	}

	function drawArc(startAngle, endAngle, colourId)
	{
		endAngle = Math.min(endAngle, 360);
		var _loc5_ = this.itemMC.statWheelMC.wheelMC;
		var _loc6_ = new com.rockstargames.ui.utils.HudColour();
		com.rockstargames.ui.utils.Colour.setHudColour(colourId,_loc6_);
		_loc5_.moveTo(0,0);
		_loc5_.beginFill(com.rockstargames.ui.utils.Colour.RGBToHex(_loc6_.r, _loc6_.g, _loc6_.b),100);
		var _loc2_ = startAngle;
		var _loc4_ = 0.25;
		while (_loc2_ <= endAngle)
		{
			this.lineToPtOnWheel(_loc2_);
			_loc2_ = _loc2_ + _loc4_;
		}
		if (_loc2_ < endAngle + _loc4_)
		{
			this.lineToPtOnWheel(endAngle);
		}
		_loc5_.lineTo(0,0);
		_loc5_.endFill();
	}
	function lineToPtOnWheel(angle)
	{
		this.itemMC.statWheelMC.wheelMC.lineTo(Math.sin(angle * this.PI_OVER_180) * this.wheelRadius,(-Math.cos(angle * this.PI_OVER_180)) * this.wheelRadius);
	}
	
	function Clear()
	{
		this.currentAngle = 0;
		this.itemMC.statWheelMC.wheelMC.clear();
		this.totalStats = 0;
		this.itemMC.removeMovieClip();
	}
}