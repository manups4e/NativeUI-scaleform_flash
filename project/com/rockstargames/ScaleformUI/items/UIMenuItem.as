class com.rockstargames.ScaleformUI.items.UIMenuItem extends com.rockstargames.ScaleformUI.items.BaseMenuItem
{
	static var CHECKBOX_STYLE_CROSS = 0;
	static var CHECKBOX_STYLE_TICK = 1;
	var _heritage = false;
	var bar;
	var checkbox;
	var tickStyle;
	var _checked;
	var rightTextTF;
	var rightText;
	var rightBadgeMC;
	var rightBadgeId = com.rockstargames.ScaleformUI.utils.Badges.NONE;
	var _data;
	var _type;
	var selectedIndex;
	var selectedValue;
	var defaultLabelColourEnum;
	var multiListIndex:Number = 0;
	var multiListItems = new Array();
	var barIndex:Number = 0;
	var barValsList = new Array();
	var index;
	var _highlighted;
	var txd_loader;
	var _checkBoxHovered;
	var leftArrow;
	var rightArrow;
	var _max;
	var _multiplier;
	var divider;
	var _sliderColor = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE;
	var _slider;
	var customLeftArrow;
	var customRightArrow;
	var hover = -1;
	var jumpable = false;

	function UIMenuItem(id, str, substr, parentMenu, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12, param13)
	{
		super(parentMenu,str,substr,param1);
		this.blinkDesc = param2;
		this.itemMC = this.parentMC.attachMovie("UIMenuItem", "menuItem_" + this._parentMenu.itemCount + 1, this.parentMC.getNextHighestDepth());
		this.backgroundMC = this.itemMC.bgMC;
		this.itemMC.rightArrow._visible = this.itemMC.leftArrow._visible = false;
		this.leftTextTF = this.itemMC.labelMC.labelTF;
		this.leftTextTF.antiAliasType = "advanced";
		this.leftTextTF.selectable = false;
		this.rightTextTF = this.itemMC.RLabelMC.labelTF;
		this.rightText = "";
		this._type = id;
		this.jumpable = false;

		if (str != undefined)
		{
			this.leftTextTF.autoSize = "none";
			com.rockstargames.ui.utils.UIText.setSizedText(this.leftTextTF,str,true);
		}

		switch (id)
		{
			case 0 :// base item
				this.itemMC.RLabelMC._x = 271.95;
				this.itemMC.RLabelMC._visible = true;
				this._mainColor = param3;
				this._highlightColor = param4;
				this._textColor = param5;
				this._textHighlightColor = param6;
				break;
			case 1 :// list item
				this.itemMC.RLabelMC._visible = true;
				this.multiListItems = param3.split(",");
				this.textIndex = param4;
				this._mainColor = param5;
				this._highlightColor = param6;
				this._textColor = param7;
				this._textHighlightColor = param8;
				break;
			case 2 :// checkbox item
				this.itemMC.RLabelMC._visible = false;
				this.checkbox = this.itemMC.attachMovie("txdLoader", "checkBox", this.itemMC.getNextHighestDepth());
				this.tickStyle = param3;
				this.Checked = param4;
				this._mainColor = param5;
				this._highlightColor = param6;
				this._textColor = param7;
				this._textHighlightColor = param8;
				break;
			case 3 :// slider item
				this._mainColor = param6;
				this._highlightColor = param7;
				this._textColor = param8;
				this._textHighlightColor = param9;
				this._sliderColor = param10;
				this._multiplier = param4;
				this.itemMC.rightArrow._visible = this.itemMC.leftArrow._visible = true;
				var steps = param3;
				if (steps == "" || steps == undefined)
				{
					steps = 1;
				}
				this.barValsList = [];
				var i = 0;
				while (i < steps + 1)
				{
					this.barValsList.push(100 / steps * i);
					i++;
				}
				var colourIndex = this._sliderColor;
				if (colourIndex == undefined)
				{
					colourIndex = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREEN;
				}
				this.bar = this.itemMC.attachMovie("GenericColourBar", "progress_bar", this.itemMC.getNextHighestDepth(), {_y:9.80});
				this.bar.init(colourIndex,100);
				this.bar._visible = true;
				this.bar._alpha = !this.highlighted ? 50 : 100;
				this.bar._x = this.itemMC.rightArrow._x - this.bar._width - 2;
				this.itemMC.leftArrow._x = this.bar._x - 8;
				this.itemMC.RLabelMC._visible = false;
				this.bar.percent(50);
				this.sliderscale = param5;
				this._heritage = param11;
				if (this._heritage)
				{
					this.itemMC.leftArrow.gotoAndStop(2);
					this.itemMC.rightArrow.gotoAndStop(2);
					this.itemMC.rightArrow._x -= 2;
					this.bar._x = this.itemMC.rightArrow._x - this.bar._width - 5;
					this.itemMC.leftArrow._x = this.bar._x - 8;
				}
				var separator = this.itemMC.attachMovie("separator", "_separator_", this.itemMC.getNextHighestDepth());
				separator._x = this.bar._x + this.bar._width / 2;
				separator._y = this.bar._y + this.bar._height / 2;
				break;
			case 4 :// progress item
				this._mainColor = param6;
				this._highlightColor = param7;
				this._textColor = param8;
				this._textHighlightColor = param9;
				this._sliderColor = param10;
				this.itemMC.rightArrow._visible = this.itemMC.leftArrow._visible = true;
				this._multiplier = param4;
				var steps = param3;
				if (steps == "" || steps == undefined)
				{
					steps = 1;
				}
				this.barValsList = [];
				var i = 0;
				while (i < steps + 1)
				{
					this.barValsList.push(100 / steps * i);
					i++;
				}
				var colourIndex = this._sliderColor;
				if (colourIndex == undefined)
				{
					colourIndex = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREEN;
				}
				this.bar = this.itemMC.attachMovie("GenericColourBar", "progress_bar", this.itemMC.getNextHighestDepth(), {_y:9.80});
				this.bar.init(colourIndex,100);
				this.bar._visible = true;
				this.bar._alpha = !this.highlighted ? 50 : 100;
				this.bar._x = this.itemMC.rightArrow._x - this.bar._width - 2;
				this.itemMC.leftArrow._x = this.bar._x - 8;
				this.itemMC.RLabelMC._visible = false;
				this.barscale = param5;
				break;
			case 6 :// separator
				this.itemMC.RLabelMC._visible = false;
				this.itemMC.rightArrow._visible = this.itemMC.leftArrow._visible = false;
				this.leftTextTF.autoSize = "center";
				this.itemMC.labelMC._x = this.itemMC.labelMC._x + 70;
				com.rockstargames.ui.utils.UIText.setSizedText(this.leftTextTF,str,true);
				this.jumpable = param3;
				this._mainColor = param4;
				this._highlightColor = param5;
				this._textColor = param6;
				this._textHighlightColor = param7;
				break;
		}
		if (this._textColor != com.rockstargames.ui.utils.HudColour.NONE && this._textHighlightColor != com.rockstargames.ui.utils.HudColour.NONE)
		{
			com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.leftTextTF,!this.highlighted ? this._textColor : this._textHighlightColor);
		}
		this.initBaseMouseInterface();
		this.itemMC.leftArrow.onRollOver = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOverI, this.itemMC.leftArrow);
		this.itemMC.leftArrow.onRollOut = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOutI, this.itemMC.leftArrow);
		this.itemMC.rightArrow.onRollOver = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOverI, this.itemMC.rightArrow);
		this.itemMC.rightArrow.onRollOut = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOutI, this.itemMC.rightArrow);
		this.checkbox.onRollOver = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOverI, this.checkbox);
		this.checkbox.onRollOut = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOutI, this.checkbox);
		// DA RIVEDERE:         
		// this.blinkDesc = _blink;

	}


	function SetRightText(str)
	{
		this.rightText = str;
		this.setRightText(this.rightTextTF,this.rightText);
	}

	function SetRightBadge(id)
	{
		this.rightBadgeId = id;
		if (this.rightBadgeId != com.rockstargames.ScaleformUI.utils.Badges.NONE)
		{
			this.rightBadgeMC = this.itemMC.attachMovie("txdLoader", "badge", this.itemMC.getNextHighestDepth());
			var sprite_name = com.rockstargames.ScaleformUI.utils.Badges.getSpriteNameById(id, this.highlighted);
			var sprite_txd = com.rockstargames.ScaleformUI.utils.Badges.GetSpriteDictionary(id);
			this.SetClip(this.rightBadgeMC,sprite_txd,sprite_name,24,24,this.badgeLoaded);
		}
		else
		{
			if (this.rightBadgeMC.isLoaded)
			{
				this.rightBadgeMC.removeTxdRef();
			}
		}
	}

	function SetClip(targetMC, textureDict, textureName, w, h, callback)
	{
		var _loc12_ = true;
		if (targetMC.textureFilename != textureName && targetMC.textureDict != textureDict)
		{
			var _loc12_ = false;
		}
		targetMC.init("ScaleformUI",textureDict,textureName,w,h);
		var _loc7_ = 4;
		var _loc5_ = String(targetMC).split(".");
		var _loc8_ = _loc5_.slice(_loc5_.length - _loc7_).join(".");
		com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(targetMC);
		targetMC._alpha = 100;
		targetMC.requestTxdRef(_loc8_,_loc12_,callback,this);
	}

	function badgeLoaded()
	{
		this.rightBadgeMC._visible = true;
		this.rightBadgeMC._width = 24;
		this.rightBadgeMC._height = 24;
		this.rightBadgeMC._x = 263.5;
		this.rightBadgeMC._y = 0.5;
		//this.rightBadgeMC._alpha = 0;
		//com.rockstargames.ui.tweenStar.TweenStarLite.to(this.rightBadgeMC,0.2,{_alpha:100});
	}
	function badgeLoaded_withAnim()
	{
		this.badgeLoaded();
		this.rightBadgeMC._alpha = 0;
		com.rockstargames.ui.tweenStar.TweenStarLite.to(this.rightBadgeMC,0.2,{_alpha:100});
	}
	
	function checkLoaded(){
		this.checkbox._width = 24;
		this.checkbox._height = 24;
		this.checkbox._x = 263.5;
		this.checkbox._y = 0.5;
		this.checkbox._visible = true;
		//this.rightBadgeMC._alpha = 0;
		//com.rockstargames.ui.tweenStar.TweenStarLite.to(this.rightBadgeMC,0.2,{_alpha:100});
	}
	function checkLoaded_withAnim(){
		this.checkLoaded();
		this.checkbox._alpha = 0;
		com.rockstargames.ui.tweenStar.TweenStarLite.to(this.checkbox,0.2,{_alpha:100});
	}

	function addPanel(_panel)
	{
		this.panels.push(_panel);
	}

	function getSprite(_highlighted, _style, _checked)
	{
		return _highlighted ? (_checked ? (_style == com.rockstargames.ScaleformUI.items.UIMenuCheckboxItem.CHECKBOX_STYLE_TICK ? "shop_box_tickb" : "shop_box_crossb") : "shop_box_blankb") : _checked ? (_style == com.rockstargames.ScaleformUI.items.UIMenuCheckboxItem.CHECKBOX_STYLE_TICK ? "shop_box_tick" : "shop_box_cross") : "shop_box_blank";
	}

	function addSidePanel(panel)
	{
		this.sidePanel = panel;
	}
	function removeSidePanel(panel)
	{
		this.sidePanel.itemMC.removeMovieClip();
	}


	function set Checked(val)
	{
		this._checked = val;
		var sprite_name = this.getSprite(this._highlighted, this.tickStyle, this._checked);
		this.SetClip(this.checkbox,"commonmenu",sprite_name,24,24,this.checkLoaded_withAnim);
	}

	function get Checked()
	{
		return _checked;
	}

	function set barscale(bi)
	{
		this.barIndex = bi;
		if (this.barIndex > this.barValsList.length - 1)
		{
			this.barIndex = this.barValsList.length - 1;
		}
		else if (this.barIndex < 0)
		{
			this.barIndex = 0;
		}
		this.selectedIndex = this.barIndex;
		this.selectedValue = this.barValsList[this.barIndex];
		this.bar.percent(this.selectedValue,true);
	}

	function get barscale()
	{
		return this.selectedIndex;
	}

	function set sliderscale(bi)
	{
		this.barIndex = bi;
		if (this.barIndex > this.barValsList.length - 1)
		{
			this.barIndex = this.barValsList.length - 1;
		}
		else if (this.barIndex < 0)
		{
			this.barIndex = 0;
		}
		this.selectedIndex = this.barIndex;
		this.selectedValue = this.barValsList[this.barIndex];
		this.bar.setFillX(50 * (this.selectedValue / 100));
	}

	function get sliderscale()
	{
		return this.selectedIndex;
	}

	function set textIndex(ti)
	{
		this.multiListIndex = ti;
		if (this.multiListIndex > this.multiListItems.length - 1)
		{
			this.multiListIndex -= this.multiListItems.length;
		}
		else if (this.multiListIndex < 0)
		{
			this.multiListIndex += this.multiListItems.length;
		}

		this.selectedIndex = this.multiListIndex;
		this.selectedValue = this.multiListItems[this.multiListIndex];
		this.rightText = this.selectedValue;
		com.rockstargames.ui.utils.UIText.setSizedText(this.rightTextTF,this.rightText);
		this.rightTextTF.autoSize = true;
		this.itemMC.RLabelMC._x = this.itemMC.rightArrow._x - this.rightTextTF._width;
		this.itemMC.leftArrow._x = this.rightTextTF._x - 6;
		this.itemMC.rightArrow._visible = this.itemMC.leftArrow._visible = true;
	}

	function get textIndex()
	{
		return this.selectedIndex;
	}

	function set highlighted(_h)
	{
		super.highlighted = _h;
		if (this.rightBadgeMC != undefined)
		{
			var txd = com.rockstargames.ScaleformUI.utils.Badges.GetSpriteDictionary(this.rightBadgeId);
			var sprite_name = com.rockstargames.ScaleformUI.utils.Badges.getSpriteNameById(this.rightBadgeId, _h);
			this.SetClip(this.rightBadgeMC,txd,sprite_name,24,24,this.badgeLoaded);
			if (this.rightBadgeId == 1 || this.rightBadgeId == 4 || this.rightBadgeId == 26)
			{
				com.rockstargames.ui.utils.Colour.ApplyHudColour(this.rightBadgeMC,com.rockstargames.ScaleformUI.utils.Badges.BadgeToColor(this.rightBadgeId, _h));
			}
		}
		com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.rightTextTF,this._enabled ? (!_h ? this._textColor : this._textHighlightColor) : com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREY);
		if (this._enabled)
		{
			if (_h)
			{
				if (this._type == 1)
				{
					this.itemMC.rightArrow._visible = this.itemMC.leftArrow._visible = true;
					this.itemMC.RLabelMC._x = this.itemMC.rightArrow._x - this.rightTextTF._width;
					this.itemMC.leftArrow._x = this.itemMC.RLabelMC._x - 6;
				}
				else if (this._type == 3 || this._type == 4)
				{
					this.itemMC.rightArrow._visible = this.itemMC.leftArrow._visible = true;
					this.bar._alpha = 100;
				}
				else if (this._type == 2)
				{
					var sprite_name = this.getSprite(true, this.tickStyle, this.Checked);
					this.SetClip(this.checkbox,"commonmenu",sprite_name,24,24,this.checkLoaded);
				}
			}
			else
			{
				if (this._type == 1)
				{
					this.itemMC.rightArrow._visible = this.itemMC.leftArrow._visible = false;
					this.itemMC.RLabelMC._x = 288 - this.rightTextTF._width - 2;
				}
				else if (this._type == 3 || this._type == 4)
				{
					this.itemMC.rightArrow._visible = this.itemMC.leftArrow._visible = false;
					this.bar._alpha = 50;
				}
				else if (this._type == 2)
				{
					var sprite_name = this.getSprite(false, this.tickStyle, this.Checked);
					this.SetClip(this.checkbox,"commonmenu",sprite_name,24,24,this.checkLoaded);
				}
			}
			for (var _panel in this.panels)
			{
				this.panels[_panel].isVisible = _h;
			}
			if (this.sidePanel != undefined)
			{
				this.sidePanel.isVisible = _h;
			}
		}
	}

	function mOverI(mc)
	{
		if (this._type == 2)
		{
			if (this.highlighted)
			{
				this.hover = 1;
				this._hovered = true;
			}
		}
		else if (mc == this.itemMC.leftArrow)
		{
			this.hover = 0;
			this._hovered = true;
		}
		else if (mc == this.itemMC.rightArrow)
		{
			this.hover = 1;
			this._hovered = true;
		}
	}
	function mOutI(mc)
	{
		if (this._type == 2)
		{
			if (this.highlighted)
			{
				this.hover = -1;
				this._hovered = false;
			}
		}
		else
		{
			this.hover = -1;
			this._hovered = false;
		}
	}

	function get Value()
	{
		var ret;
		switch (this._type)
		{
			case 0 :
				ret = -1;
				break;
			case 1 :
				ret = this.textIndex;
				break;
			case 2 :
				ret = this.Checked;
			case 3 :
				ret = this.sliderscale;
				break;
			case 4 :
				ret = this.barscale;
				break;
		}
		return ret;
	}

	function set Value(value)
	{
		switch (this._type)
		{
			case 1 :
				this.textIndex = value;
				break;
			case 2 :
				this.Checked = value;
			case 3 :
				this.sliderscale = value;
				break;
			case 4 :
				this.barscale = value;
				break;
		}
	}

	function Select(posX, posY)
	{
		if (this.highlighted)
		{
			switch (this._type)
			{
				case 1 :
					if (this.hover == 0)
					{
						this.textIndex--;
					}
					else if (this.hover == 1)
					{
						this.textIndex++;
					}
					break;
				case 2 :
					if (this.hover == 1)
					{
						this.Checked = !this.Checked;
					}
					break;
				case 3 :
					switch (this.hover)
					{
						case 0 :
							this.sliderscale -= this._multiplier;
							break;
						case 1 :
							this.sliderscale += this._multiplier;
							break;
					}
					break;

				case 4 :
					switch (this.hover)
					{
						case 0 :
							this.barscale--;
							break;
						case 1 :
							this.barscale++;
							break;
					}
					break;
			}
		}
		return this.Value;
	}

	function Clear()
	{
		if (this.rightBadgeMC != undefined)
		{
			if (this.rightBadgeMC.isLoaded)
			{
				this.rightBadgeMC.removeTxdRef();
			}
		}
		for (var pan in this.panels)
		{
			this.panels[pan].Clear();
		}
		if (this.sidePanel != undefined)
		{
			this.sidePanel.Clear();
		}
		this.itemMC.removeMovieClip();
	}
}