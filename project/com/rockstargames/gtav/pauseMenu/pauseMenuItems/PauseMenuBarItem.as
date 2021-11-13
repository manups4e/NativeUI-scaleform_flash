class com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBarItem extends MovieClip
{
	var isLocked = false;
	var mIndex = 0;
	var PMB;
	var _alpha;
	var _highlight;
	var _menuenum;
	var _mywidth;
	var _rollover;
	var attachMovie;
	var getNextHighestDepth;
	var hasMouse;
	var lockMC;
	var mc;
	var tabMC;
	var textMC;
	var warnAlertText;
	function PauseMenuBarItem()
	{
		super();
		var _loc3_ = new com.rockstargames.ui.utils.HudColour();
		com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_MENU_DIMMED,_loc3_);
		this.set mycolour([com.rockstargames.ui.utils.HudColour.HUD_COLOUR_MENU_DIMMED, _loc3_.r, _loc3_.g, _loc3_.b, _loc3_.a]);
		this.tabMC._alpha = 0;
		this.set rollover(false);
		this.textMC = this.mc.textMC;
		this.hasMouse = false;
	}
	function mInit(_PMB, _mIndex)
	{
		this.PMB = _PMB;
		this.mIndex = _mIndex;
		this.addMouse();
	}
	function addMouse()
	{
		this.mc.onRelease = mx.utils.Delegate.create(this, this.mPress);
		this.mc.onRollOver = mx.utils.Delegate.create(this, this.mRollOver);
		this.mc.onRollOut = mx.utils.Delegate.create(this, this.mRollOut);
		this.mc.onDragOut = mx.utils.Delegate.create(this, this.mRollOut);
		this.hasMouse = true;
	}
	function removeMouse()
	{
		delete this.mc.onRelease;
		delete this.mc.onRollOver;
		delete this.mc.onRollOut;
		this.hasMouse = false;
	}
	function mPress()
	{
		if (!this.get highlight())
		{
			this.PMB.SET_CODE_MENU_INDEX(this.mIndex);
		}
		else
		{
			this.PMB.SET_CODE_MENU_SELECT();
		}
	}
	function mRollOver()
	{
		if (!this.isLocked && !this.get highlight())
		{
			this.set rollover(true);
		}
	}
	function mRollOut()
	{
		if (!this.isLocked)
		{
			this.set rollover(false);
		}
	}
	function set label(str)
	{
		com.rockstargames.ui.utils.UIText.setSizedText(this.textMC.labelTF,str,true,false);
		this.textMC.labelTF._width = this.width;
		this.textMC.labelTF._x = 0;
		return this.get label();
	}
	function set menuenum(m)
	{
		this._menuenum = m;
	}
	function get menuenum()
	{
		return this._menuenum;
	}
	function set rollover(h)
	{
		if (h)
		{
			this.mc.rolloverMC._alpha = 20;
		}
		else
		{
			this.mc.rolloverMC._alpha = 0;
		}
		this._rollover = h;
	}
	function set highlight(h)
	{
		var _loc3_ = new com.rockstargames.ui.utils.HudColour();
		var _loc4_ = new com.rockstargames.ui.utils.HudColour();
		var _loc2_ = new com.rockstargames.ui.utils.HudColour();
		com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,_loc3_);
		com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc4_);
		com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc2_);
		if (h)
		{
			this.tabMC._alpha = 100;
			com.rockstargames.ui.utils.Colour.Colourise(this.mc.bgMC,_loc2_.r,_loc2_.g,_loc2_.b,_loc2_.a);
			com.rockstargames.ui.utils.Colour.Colourise(this.mc.textMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
			if (this.isLocked)
			{
				com.rockstargames.ui.utils.Colour.Colourise(this.lockMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
			}
		}
		else
		{
			this.tabMC._alpha = 0;
			com.rockstargames.ui.utils.Colour.Colourise(this.mc.bgMC,_loc4_.r,_loc4_.g,_loc4_.b,_loc4_.a);
			com.rockstargames.ui.utils.Colour.Colourise(this.mc.textMC,_loc2_.r,_loc2_.g,_loc2_.b,_loc2_.a);
			if (this.isLocked)
			{
				com.rockstargames.ui.utils.Colour.Colourise(this.lockMC,_loc2_.r,_loc2_.g,_loc2_.b,_loc2_.a);
			}
		}
		this._highlight = h;
		return this.get highlight();
	}
	function get highlight()
	{
		return this._highlight;
	}
	function set mycolour(c)
	{
		com.rockstargames.ui.utils.Colour.Colourise(this.tabMC,c[1],c[2],c[3],!this._highlight ? 0 : 100);
		return this.get mycolour();
	}
	function set locked(l)
	{
		this.isLocked = Boolean(l);
		this.lockMC._alpha = !this.isLocked ? 0 : 100;
		this._alpha = !this.isLocked ? 100 : 50;
		return this.get locked();
	}
	function set bespokeColour(cID)
	{
		if (cID != undefined && cID != false)
		{
			com.rockstargames.ui.utils.Colour.ApplyHudColour(this.mc.bgMC,cID);
			com.rockstargames.ui.utils.Colour.ApplyHudColour(this.mc.textMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
		}
		return this.get bespokeColour();
	}
	function setAlertText(warnStr, col)
	{
		if (this.warnAlertText)
		{
			this.warnAlertText.removeMovieClip();
		}
		if (warnStr != "")
		{
			this.warnAlertText = this.attachMovie("uiTextField", "uiTF", this.getNextHighestDepth(), {_y:1});
			this.warnAlertText.init(17,com.rockstargames.gtav.utils.GTAVUIConfig.CONDENSED_FONT_NOT_GAMERNAME,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,true);
			this.warnAlertText.setText(warnStr);
			this.warnAlertText.setBgColour(col);
			this.warnAlertText._x = this.mc.bgMC._width * 0.5 + this.textMC.labelTF.textWidth * 0.5 + 5;
			this.warnAlertText._y = 7;
		}
	}
	function set width(w)
	{
		this.tabMC._width = this.mc.bgMC._width = this.mc.rolloverMC._width = this._mywidth = w;
		this.realignText();
		return this.get width();
	}
	function get width()
	{
		return this._mywidth;
	}
	function realignText(widthSpan)
	{
		var _loc2_ = this.get width();
		if (widthSpan)
		{
			var _loc4_ = 2;
			_loc2_ = this._mywidth * widthSpan + _loc4_ * (widthSpan - 1);
			this.tabMC._width = this.mc.bgMC._width = this.mc.rolloverMC._width = _loc2_;
		}
		this.textMC.labelTF._x = _loc2_ / 2 - this.textMC.labelTF._width / 2 - 1;
		this.lockMC._x = this.textMC.labelTF._x + this.textMC.labelTF._width + 5;
	}
	function resizeTabPx(widthSpanPx)
	{
		this.tabMC._width = this.mc.bgMC._width = this.mc.rolloverMC._width = widthSpanPx;
		this.textMC.labelTF._x = widthSpanPx / 2 - this.textMC.labelTF._width / 2;
		this.lockMC._x = this.textMC.labelTF._x + this.textMC.labelTF._width + 5;
		if (this.warnAlertText)
		{
			this.warnAlertText._x = this.mc.bgMC._width * 0.5 + this.textMC.labelTF.textWidth * 0.5 + 5;
		}
	}
}