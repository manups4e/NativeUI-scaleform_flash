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
	var leftBadgeMC;
	var rightBadgeId = com.rockstargames.ScaleformUI.utils.Badges.NONE;
	var leftBadgeId = com.rockstargames.ScaleformUI.utils.Badges.NONE;
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
	var Arrow;
	var _max;
	var _multiplier;
	var divider;
	var _sliderColor = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE;
	var _slider;
	var customLeftArrow;
	var customRightArrow;
	var hover = -1;
	var jumpable = false;
	var mouseCatcher;
	static var DEFAULT_SCROLL_SPEED = 50;
	var inverseScrollSpeed;
	var goalX;
	var duration;
	var scrollTimeout;
	var labelFont;
	var rightLabelFont;
	var menuIndex;
	var wasH = false;
	var rightTextY = 0;

	function UIMenuItem(id, index, str, substr, parentMenu, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12, param13)
	{
		super(parentMenu,str,substr,param1);
		this.blinkDesc = param2;
		this.itemMC = this.parentMC.attachMovie("UIMenuItem", "menuItem_" + this.parentMC.getNextHighestDepth(), this.parentMC.getNextHighestDepth());
		this.backgroundMC = this.itemMC.bgMC;
		this.itemMC.rightArrow._visible = this.itemMC.leftArrow._visible = false;
		this.leftTextTF = this.itemMC.labelMC.labelTF;
		this.leftTextTF.antiAliasType = "advanced";
		this.leftTextTF.selectable = false;
		this.rightTextTF = this.itemMC.RLabelMC.labelTF;
		this.rightText = "";
		this._type = id;
		this.jumpable = false;
		this.menuIndex = index;
		//this.itemMC.mouseCatcher.swapDepths(this.itemMC.RLabelMC);

		if (str != undefined)
		{
			this.leftTextTF.autoSize = "left";
			com.rockstargames.ui.utils.UIText.setSizedText(this.leftTextTF,str,false);
			this.itemMC.labelMC.setMask(this.itemMC.labelMC.maskMC);
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
		/*
		if (this._textColor != com.rockstargames.ui.utils.HudColour.NONE && this._textHighlightColor != com.rockstargames.ui.utils.HudColour.NONE)
		{
		com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.leftTextTF,!this.highlighted ? this._textColor : this._textHighlightColor);
		}
		*/
		this.itemMC.attachMovie("mouseCatcher","mouseCatcher",itemMC.getNextHighestDepth(),{_width:itemMC._width, _height:itemMC._height});
		this.itemMC.mouseCatcher.setupGenericMouseInterface(this.menuIndex,0,this.onMouseEvent,[this, this._parentMenu]);
	}

	function refreshLabelFonts()
	{
		this.updateLabelFont(this.labelFont[0],this.labelFont[1]);
		this.updateRightLabelFont(this.rightLabelFont[0],this.rightLabelFont[1]);
	}

	function updateLabelFont(fontName, fontId)
	{
		this.labelFont = new Array(fontName, fontId);
		this.leftTextTF.embedFonts = true;
		this.leftTextTF.antiAliasType = "advanced";
		this.leftTextTF.selectable = false;
		var newFont = this.leftTextTF.getTextFormat();
		newFont.font = this.labelFont[0];
		this.leftTextTF.setNewTextFormat(newFont);
		this.leftTextTF.setTextFormat(newFont);
	}

	function updateRightLabelFont(fontName, fontId)
	{
		this.rightLabelFont = new Array(fontName, fontId);
		this.rightTextTF.embedFonts = true;
		this.rightTextTF.antiAliasType = "advanced";
		this.rightTextTF.selectable = false;
		var newFont = this.rightTextTF.getTextFormat();
		newFont.font = this.rightLabelFont[0];
		this.rightTextTF.setNewTextFormat(newFont);
		this.rightTextTF.setTextFormat(newFont);
	}

	function checkScroll()
	{
		if (this.leftTextTF.textWidth > this.itemMC.labelMC.maskMC._width)
		{
			this.inverseScrollSpeed = 1 / com.rockstargames.ScaleformUI.items.UIMenuItem.DEFAULT_SCROLL_SPEED;
			this.goalX = (this.leftTextTF._width - this.itemMC.labelMC.maskMC._width);
			this.duration = this.goalX * this.inverseScrollSpeed;
			this.scrollTimeout = setTimeout(this.startScroll, 2000, this);
		}
	}

	// this function is called out of scope of the item itself, use this.something won't do anything!
	function onMouseEvent(evtType, targetMC, args)
	{
		var item = args[0];
		var menu = args[1];
		switch (evtType)
		{
			case com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_ROLL_OUT :
				item.mOut();
				break;
			case com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_ROLL_OVER :
				if (item._type == 6)
				{
					if (item.jumpable)
					{
						return;
					}
				}
				item.mOver();
				break;
			case com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_PRESS :
				break;
			case com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_RELEASE :
				break;
			case com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_RELEASE_OUTSIDE :
				break;
		}
	}

	function startScroll(item)
	{
		item.inverseScrollSpeed = 1 / com.rockstargames.ScaleformUI.items.UIMenuItem.DEFAULT_SCROLL_SPEED;
		item.goalX = (item.leftTextTF._width - item.itemMC.labelMC.maskMC._width);
		item.duration = item.goalX * item.inverseScrollSpeed;
		com.rockstargames.ui.tweenStar.TweenStarLite.to(item.leftTextTF,item.duration,{_x:-item.goalX, onCompleteScope:item, onComplete:item.completeScroll, onCompleteArgs:["scroll"]});
	}

	function goBackScroll(item)
	{
		item.inverseScrollSpeed = 1 / com.rockstargames.ScaleformUI.items.UIMenuItem.DEFAULT_SCROLL_SPEED;
		item.goalX = (item.leftTextTF._width - item.itemMC.labelMC.maskMC._width);
		item.duration = item.goalX * item.inverseScrollSpeed;
		com.rockstargames.ui.tweenStar.TweenStarLite.to(item.leftTextTF,item.duration,{_x:0, onCompleteScope:item, onComplete:item.completeScroll, onCompleteArgs:["back"]});
	}

	function completeScroll(arg)
	{
		this.scrollTimeout = setTimeout(arg == "scroll" ? this.goBackScroll : this.startScroll, 3000, this);
	}

	function updateLabelWidth()
	{
		switch (this._type)
		{
			case 0 :
				this.itemMC.labelMC.maskMC._width = this.itemMC.RLabelMC._x - this.itemMC.RLabelMC._width - this.itemMC.labelMC._x - 5;
				break;
			case 2 :
				this.itemMC.labelMC.maskMC._width = this.checkbox._x - this.itemMC.labelMC._x - 5;
				break;
			case 1 :
			case 3 :
			case 4 :
				this.itemMC.labelMC.maskMC._width = this.itemMC.leftArrow._x - this.itemMC.labelMC._x - 5;
				break;
		}
		//this.checkScroll();
	}

	function SetRightText(str)
	{
		this.rightText = str;
		this.setRightText(this.rightTextTF,this.rightText);
		this.updateLabelWidth();
		this.refreshLabelFonts();
	}

	function SetRightBadge(id)
	{
		this.rightBadgeId = id;
		if (this.rightBadgeId != com.rockstargames.ScaleformUI.utils.Badges.NONE)
		{
			this.rightBadgeMC = this.itemMC.attachMovie("txdLoader", "RightBadge", this.itemMC.getNextHighestDepth());
			var sprite_name = com.rockstargames.ScaleformUI.utils.Badges.getSpriteNameById(id, this.highlighted);
			var sprite_txd = com.rockstargames.ScaleformUI.utils.Badges.GetSpriteDictionary(id);
			this.SetClip(this.rightBadgeMC,sprite_txd,sprite_name,24,24,this.rightBadgeLoaded);
			this.itemMC.RLabelMC._x -= 25;

		}
		else
		{
			if (this.rightBadgeMC.isLoaded)
			{
				this.rightBadgeMC.removeTxdRef();
				this.rightBadgeMC.removeMovieClip();
				this.itemMC.RLabelMC._x += 25;
			}
		}
		this.updateLabelWidth();
	}

	function SetLeftBadge(id)
	{
		this.leftBadgeId = id;
		if (this.leftBadgeId != com.rockstargames.ScaleformUI.utils.Badges.NONE)
		{
			this.leftBadgeMC = this.itemMC.attachMovie("txdLoader", "LeftBadge", this.itemMC.getNextHighestDepth());
			var sprite_name = com.rockstargames.ScaleformUI.utils.Badges.getSpriteNameById(id, this.highlighted);
			var sprite_txd = com.rockstargames.ScaleformUI.utils.Badges.GetSpriteDictionary(id);
			this.SetClip(this.leftBadgeMC,sprite_txd,sprite_name,24,24,this.leftBadgeLoaded);
			this.itemMC.labelMC._x = 28.25;
		}
		else
		{
			if (this.leftBadgeMC.isLoaded)
			{
				this.leftBadgeMC.removeTxdRef();
				this.leftBadgeMC.removeMovieClip();
				this.itemMC.labelMC._x = 3.25;
			}
		}
		this.updateLabelWidth();
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

	function rightBadgeLoaded()
	{
		this.rightBadgeMC._visible = true;
		this.rightBadgeMC._width = 24;
		this.rightBadgeMC._height = 24;
		this.rightBadgeMC._x = 263.5;
		this.rightBadgeMC._y = 0.5;
		//this.rightBadgeMC._alpha = 0;
		//com.rockstargames.ui.tweenStar.TweenStarLite.to(this.rightBadgeMC,0.2,{_alpha:100});
		this.updateLabelWidth();
	}

	function rightBadgeLoaded_withAnim()
	{
		this.rightBadgeLoaded();
		this.rightBadgeMC._alpha = 0;
		com.rockstargames.ui.tweenStar.TweenStarLite.to(this.rightBadgeMC,0.2,{_alpha:100});
		this.updateLabelWidth();
	}

	function leftBadgeLoaded()
	{
		this.leftBadgeMC._visible = true;
		this.leftBadgeMC._width = 24;
		this.leftBadgeMC._height = 24;
		this.leftBadgeMC._x = 0.5;
		this.leftBadgeMC._y = 0.5;
		this.updateLabelWidth();
	}

	function leftBadgeLoaded_withAnim()
	{
		this.leftBadgeLoaded();
		this.leftBadgeMC._alpha = 0;
		com.rockstargames.ui.tweenStar.TweenStarLite.to(this.leftBadgeMC,0.2,{_alpha:100});
		this.updateLabelWidth();
	}

	function checkLoaded()
	{
		this.checkbox._width = 24;
		this.checkbox._height = 24;
		this.checkbox._x = 263.5;
		this.checkbox._y = 0.5;
		this.checkbox._visible = true;
		//this.rightBadgeMC._alpha = 0;
		//com.rockstargames.ui.tweenStar.TweenStarLite.to(this.rightBadgeMC,0.2,{_alpha:100});
		this.updateLabelWidth();
	}

	function checkLoaded_withAnim()
	{
		this.checkLoaded();
		this.checkbox._alpha = 0;
		com.rockstargames.ui.tweenStar.TweenStarLite.to(this.checkbox,0.2,{_alpha:100});
		this.updateLabelWidth();
	}

	function addPanel(_panel)
	{
		this.panels.push(_panel);
	}

	function removePanel(id)
	{
		var panel = this.panels[id];
		panel.Clear();
		this.panels.splice(id,1);
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
		this.updateLabelWidth();
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
		this.itemMC.leftArrow._x = this.itemMC.RLabelMC._x - 6;
		this.itemMC.rightArrow._visible = this.itemMC.leftArrow._visible = true;
		this.rightTextTF._y = 0;
		this.updateLabelWidth();
	}

	function get textIndex()
	{
		return this.selectedIndex;
	}

	function set highlighted(_h)
	{
		super.highlighted = _h;
		if (this.rightBadgeMC.isLoaded)
		{
			var txd = com.rockstargames.ScaleformUI.utils.Badges.GetSpriteDictionary(this.rightBadgeId);
			var sprite_name = com.rockstargames.ScaleformUI.utils.Badges.getSpriteNameById(this.rightBadgeId, _h);
			this.SetClip(this.rightBadgeMC,txd,sprite_name,24,24,this.rightBadgeLoaded);
			if (this.rightBadgeId == 1 || this.rightBadgeId == 4 || this.rightBadgeId == 26)
			{
				com.rockstargames.ui.utils.Colour.ApplyHudColour(this.rightBadgeMC,com.rockstargames.ScaleformUI.utils.Badges.BadgeToColor(this.rightBadgeId, _h));
			}
		}
		if (this.leftBadgeMC.isLoaded)
		{
			var txd = com.rockstargames.ScaleformUI.utils.Badges.GetSpriteDictionary(this.leftBadgeId);
			var sprite_name = com.rockstargames.ScaleformUI.utils.Badges.getSpriteNameById(this.leftBadgeId, _h);
			this.SetClip(this.leftBadgeId,txd,sprite_name,24,24,this.leftBadgeLoaded);
			if (this.leftBadgeId == 1 || this.leftBadgeId == 4 || this.leftBadgeId == 26)
			{
				com.rockstargames.ui.utils.Colour.ApplyHudColour(this.leftBadgeMC,com.rockstargames.ScaleformUI.utils.Badges.BadgeToColor(this.leftBadgeId, _h));
			}
		}

		if (this._type == 1)
		{
			com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.rightTextTF,this._enabled ? (!_h ? this._textColor : this._textHighlightColor) : com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREY);
		}

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
				this.updateLabelWidth();
				this.checkScroll();
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
				clearTimeout(this.scrollTimeout);
				com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.leftTextTF);
				this.leftTextTF._x = 0;
				this.updateLabelWidth();
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
		this.refreshLabelFonts();
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

	function Select()
	{
		if (this._type == 1 || this._type == 3 || this._type == 4)
		{
			if (this.itemMC.leftArrow.hitTest(_xmouse, _ymouse, false))
			{
				this.hover = 0;
				this._hovered = true;
			}
			else if (this.itemMC.rightArrow.hitTest(_xmouse, _ymouse, false))
			{
				this.hover = 1;
				this._hovered = true;
			}
			else
			{
				this.hover = -1;
				this._hovered = false;
			}
		}

		if (this._enabled)
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
		}
		return this.Value;
	}
	
	function set Width(w)
	{
		this.itemMC._width = w;
		for (var pan in this.panels)
		{
			this.panels[pan].Width = w;
		}
	}

	function Clear()
	{
		clearTimeout(this.scrollTimeout);
		com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.leftTextTF);
		this.itemMC.mouseCatcher.dispose();
		if (this.rightBadgeMC.isLoaded)
		{
			this.rightBadgeMC.removeTxdRef();
			this.rightBadgeMC.removeMovieClip();
		}
		if (this.leftBadgeMC.isLoaded)
		{
			this.rightBadgeMC.removeTxdRef();
			this.rightBadgeMC.removeMovieClip();
		}
		if (this.checkbox.isLoaded)
		{
			this.checkbox.removeTxdRef();
			this.checkbox.removeMovieClip();
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