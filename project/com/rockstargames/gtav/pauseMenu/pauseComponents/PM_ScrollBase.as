class com.rockstargames.gtav.pauseMenu.pauseComponents.PM_ScrollBase extends MovieClip
{
	static var SCROLL_TYPE_ALL:Number = 0;
	static var SCROLL_TYPE_UP_DOWN:Number = 1;
	static var SCROLL_TYPE_LEFT_RIGHT:Number = 2;
	static var SCROLL_TYPE_NONE:Number = 3;
	static var SCROLL_DIRECTION_LEFT:Number = 0;
	static var SCROLL_DIRECTION_RIGHT:Number = 1;
	static var SCROLL_DIRECTION_UP:Number = 2;
	static var SCROLL_DIRECTION_DOWN:Number = 3;
	static var POSITION_ARROW_LEFT:Number = 0;
	static var POSITION_ARROW_CENTER:Number = 1;
	static var POSITION_ARROW_RIGHT:Number = 2;
	var _maxPositionSet:Boolean = false;
	var _columnID:Number = -1;
	var _captionOn:Boolean = false;
	var _codeOverride:Boolean = false;
	var forceInvisible:Boolean = false;
	var _arrowPosition;
	var _caption;
	var _columnSpan;
	var _component;
	var _currentPosition;
	var _maxPosition;
	var _maxVisible;
	var _model;
	var _scrollType;
	var _visible;
	var _x;
	var _y;
	var allArrowsMC;
	var arrowsMC;
	var bgMC;
	var captionBlipLayer;
	var scrollPosMC;
	var scrollPosTXT;
	var upDownMC;

	function PM_ScrollBase()
	{
		super();
		_global.gfxExtensions = true;
		this.scrollPosTXT = this.scrollPosMC.scrollPosTXT;
		this.scrollPosTXT.autoSize = true;
		this.scrollPosTXT.html = true;
		this.scrollPosMC._visible = false;
		this.upDownMC._visible = false;
		this.allArrowsMC._visible = false;
		this._y = 432;
		this._visible = false;
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.allArrowsMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.upDownMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
		this.INIT_BUTTONS();
	}

	function INIT_BUTTONS()
	{
		this.upDownMC.upMC.onRelease = mx.utils.Delegate.create(this, this.mPressUp);
		this.upDownMC.downMC.onRelease = mx.utils.Delegate.create(this, this.mPressDown);
		this.allArrowsMC.leftMC.onRelease = mx.utils.Delegate.create(this, this.mPressLeft);
		this.allArrowsMC.rightMC.onRelease = mx.utils.Delegate.create(this, this.mPressRight);
		this.allArrowsMC.upMC.onRelease = mx.utils.Delegate.create(this, this.mPressUp);
		this.allArrowsMC.downMC.onRelease = mx.utils.Delegate.create(this, this.mPressDown);
		this.bgMC.onDragOver = this.bgMC.onRollOver = mx.utils.Delegate.create(this, this.mOverScrollbar);
		this.bgMC.onRollOut = this.bgMC.onDragOut = mx.utils.Delegate.create(this, this.mOutScrollbar);
		var __reg3 = [this.upDownMC.upMC, this.upDownMC.downMC, this.allArrowsMC.leftMC, this.allArrowsMC.rightMC, this.allArrowsMC.upMC, this.allArrowsMC.downMC];
		for (var __reg4 in __reg3)
		{
			var __reg2 = __reg3[__reg4];
			__reg2.onDragOver = __reg2.onRollOver = this.bgMC.onRollOver;
			__reg2.onRollOut = __reg2.onDragOut = this.bgMC.onRollOut;
		}
	}

	function mOverScrollbar()
	{
		com.rockstargames.ui.game.GameInterface.call("HOVER_PAUSE_MENU_ITEM",com.rockstargames.ui.game.GameInterface.PAUSE_TYPE,-2,-2,-2);
	}

	function mOutScrollbar()
	{
		com.rockstargames.ui.game.GameInterface.call("HOVER_PAUSE_MENU_ITEM",com.rockstargames.ui.game.GameInterface.PAUSE_TYPE,-1,-1,-1);
	}

	function mPressLeft()
	{
		_level0.TIMELINE.CLICK_SCROLL_COLUMN_ARROW(com.rockstargames.gtav.pauseMenu.pauseComponents.PM_ScrollBase.SCROLL_DIRECTION_LEFT,this._columnID);
	}

	function mPressRight()
	{
		_level0.TIMELINE.CLICK_SCROLL_COLUMN_ARROW(com.rockstargames.gtav.pauseMenu.pauseComponents.PM_ScrollBase.SCROLL_DIRECTION_RIGHT,this._columnID);
	}

	function mPressUp()
	{
		_level0.TIMELINE.CLICK_SCROLL_COLUMN_ARROW(com.rockstargames.gtav.pauseMenu.pauseComponents.PM_ScrollBase.SCROLL_DIRECTION_UP,this._columnID);
	}

	function mPressDown()
	{
		_level0.TIMELINE.CLICK_SCROLL_COLUMN_ARROW(com.rockstargames.gtav.pauseMenu.pauseComponents.PM_ScrollBase.SCROLL_DIRECTION_DOWN,this._columnID);
	}

	function INIT_SCROLL_BAR(visible, columns, scrollType, arrowPosition, override, columnXOffset, forceInvisible)
	{
		this._codeOverride = override;
		this.setColumnSpan(columns);
		this.setArrows(scrollType,arrowPosition);
		if (columnXOffset != undefined)
		{
			this._x = 290 * columnXOffset;
		}
		this.forceInvisible = forceInvisible;
		this._visible = forceInvisible ? false : (visible == undefined ? false : visible);
		this.updateScroll();
	}

	function SET_SCROLL_BAR(currentPosition, maxPosition, maxVisible, caption, forceInvisible)
	{
		this._currentPosition = currentPosition;
		this._maxPosition = maxPosition;
		this._maxVisible = maxVisible;
		this.forceInvisible = forceInvisible;
		if (caption != undefined && caption != "")
		{
			this.SET_CAPTION(caption);
			return;
		}
		this.CLEAR_CAPTION();
	}

	function SET_CAPTION(caption)
	{
		this._captionOn = true;
		this._caption = caption;
		this.updateScroll();
	}

	function CLEAR_CAPTION()
	{
		this._captionOn = false;
		this._caption = undefined;
		this.updateScroll();
	}

	function setColumnID(_cID)
	{
		this._columnID = _cID;
	}

	function displayEnabled()
	{
		return this.forceInvisible ? false : this._currentPosition != -1 || this._maxPosition != -1 || this._maxVisible != -1 || this._captionOn;
	}

	function init(component, columns, scrollType, arrowPosition, codeOverride)
	{
		this._codeOverride = codeOverride;
		this.setComponent(component);
		this.setColumnSpan(columns);
		this.setArrows(scrollType,arrowPosition);
		this.updateScroll();
	}

	function setComponent(component)
	{
		this._component = component == undefined ? null : component;
		this._model = this._component.model;
		this.updateScroll();
	}

	function setColumnSpan(columns)
	{
		if (columns > 0)
		{
			this._visible = this.displayEnabled();
		}
		else
		{
			this._visible = false;
			return undefined;
		}
		this._columnSpan = columns;
		this.bgMC._width = 290 * this._columnSpan - 2;
		this.updateDisplay();
	}

	function setArrows(type, position)
	{
		this._scrollType = type;
		this._arrowPosition = position;
		if ((this._scrollType) === com.rockstargames.gtav.pauseMenu.pauseComponents.PM_ScrollBase.SCROLL_TYPE_ALL)
		{
			this.upDownMC._visible = false;
			this.allArrowsMC._visible = true;
			this.arrowsMC = this.allArrowsMC;
		}
		else if (this._scrollType === com.rockstargames.gtav.pauseMenu.pauseComponents.PM_ScrollBase.SCROLL_TYPE_LEFT_RIGHT)
		{
			this.allArrowsMC._visible = false;
			this.upDownMC._visible = true;
			this.upDownMC._rotation = 90;
			this.arrowsMC = this.upDownMC;
		}
		else if (this._scrollType === com.rockstargames.gtav.pauseMenu.pauseComponents.PM_ScrollBase.SCROLL_TYPE_NONE)
		{
			this.allArrowsMC._visible = false;
			this.upDownMC._visible = false;
			this.arrowsMC = this.upDownMC;
		}
		else
		{
			this._scrollType === com.rockstargames.gtav.pauseMenu.pauseComponents.PM_ScrollBase.SCROLL_TYPE_UP_DOWN;
			this.allArrowsMC._visible = false;
			this.upDownMC._visible = true;
			this.upDownMC._rotation = 0;
			this.arrowsMC = this.upDownMC;
		}
		this.scrollPosMC._visible = false;
		if (this._arrowPosition === com.rockstargames.gtav.pauseMenu.pauseComponents.PM_ScrollBase.POSITION_ARROW_RIGHT)
		{
			this.scrollPosMC._visible = true;
			this.arrowsMC._x = this.bgMC._width - this.arrowsMC._width / 2 - 8;
		}
		else if (this._arrowPosition === com.rockstargames.gtav.pauseMenu.pauseComponents.PM_ScrollBase.POSITION_ARROW_LEFT)
		{
			this.arrowsMC._x = 8 + this.arrowsMC._width / 2;
		}
		else
		{
			this._arrowPosition === com.rockstargames.gtav.pauseMenu.pauseComponents.PM_ScrollBase.POSITION_ARROW_CENTER;
			this.arrowsMC._x = this.bgMC._width / 2;
		}
		this.updateDisplay();
	}

	function updateScroll()
	{
		if (!this._codeOverride)
		{
			this._currentPosition = this._model.getCurrentSelection();
			this._maxPosition = this._model.getCurrentView().maxitems;
			this._maxVisible = this._model.getCurrentView().visibleItems;
		}
		this.updateDisplay();
	}

	function updateDisplay()
	{
		this.scrollPosMC._visible = false;
		if (this.captionBlipLayer != undefined)
		{
			this.captionBlipLayer.removeMovieClip();
		}
		if (this._captionOn)
		{
			this.scrollPosMC._visible = true;
			this.captionBlipLayer = this.scrollPosMC.createEmptyMovieClip("captionBlipLayer", 1000);
			var __reg3 = new com.rockstargames.ui.utils.Text();
			__reg3.setTextWithIcons(this._caption,this.captionBlipLayer,this.scrollPosTXT,0,13.5,0,false);
		}
		else if (this._arrowPosition == com.rockstargames.gtav.pauseMenu.pauseComponents.PM_ScrollBase.POSITION_ARROW_RIGHT && this._maxPosition > 0)
		{
			this.scrollPosMC._visible = true;
			if (this._currentPosition >= 0)
			{
				var __reg2 = this._currentPosition;
				__reg2 = __reg2++ <= this._maxPosition ? __reg2 : this._maxPosition;
				this.scrollPosTXT.text = __reg2 + "/" + this._maxPosition;
			}
			else
			{
				this.scrollPosTXT.text = this._maxPosition + "";
			}
		}
		com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.scrollPosMC.scrollPosTXT,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
		this._visible = this.displayEnabled();
	}

}