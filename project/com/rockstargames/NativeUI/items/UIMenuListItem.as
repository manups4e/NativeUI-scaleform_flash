class com.rockstargames.NativeUI.items.UIMenuListItem extends com.rockstargames.NativeUI.items.BaseMenuItem
{
	var _index;
	var rightTextTF;
	var itemList = [];
	var leftArrow;
	var leftArrowPos = 257.0;
	var rightArrow;
	var stringItems;
	var arrow_loader;
	function UIMenuListItem(str, substr, parentMenu, listItems, __index, mainColor, highlightColor, textColor, textHighlightColor)
	{
		super(parentMenu,str,substr);
		this.itemMC = this.parentMC.attachMovie("UIMenuListItem", "listMenuItem_" + this._parentMenu.itemCount + 1, this.parentMC.getNextHighestDepth());
		this.backgroundMC = this.itemMC.bgMC;
		this.itemList = listItems.split(",");
		this.leftArrow = this.itemMC.leftArrow;
		this.rightArrow = this.itemMC.rightArrow;
		this.SetClip(this.leftArrow.arrowMC,"commonmenu","arrowleft");
		this.SetClip(this.rightArrow.arrowMC,"commonmenu","arrowright");
		this.leftTextTF = this.itemMC.labelMC.labelTF;
		this.leftTextTF.antiAliasType = "advanced";
		this.leftTextTF.selectable = false;
		this.rightTextTF = this.itemMC.RLabelMC.labelTF;
		this.rightTextTF.antiAliasType = "advanced";
		this.rightTextTF.selectable = false;
		this.index = __index;
		this.stringItems = listItems;
		leftArrow._x = (this.leftArrowPos + 8) - this.itemMC.RLabelMC.labelTF.textWidth;
		this.rightArrow._x = 266 + 9;
		this.leftArrow._y = 7;
		this.rightArrow._y = 7;

		if (mainColor != undefined)
		{
			this._mainColor = mainColor;
		}
		if (highlightColor != undefined)
		{
			this._highlightColor = highlightColor;
		}
		if (textColor != undefined)
		{
			this._textColor = textColor;
		}
		if (textHighlightColor != undefined)
		{
			this._textHighlightColor = textHighlightColor;
		}
		com.rockstargames.ui.utils.UIText.setSizedText(this.leftTextTF,this.leftText,true,true);
		this.initBaseMouseInterface();
		this.leftArrow.onRollOver = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOverArrow, this.leftArrow);
		this.leftArrow.onRollOut = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOutArrow, this.leftArrow);
		this.rightArrow.onRollOver = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOverArrow, this.rightArrow);
		this.rightArrow.onRollOut = com.rockstargames.ui.utils.DelegateStar.create(this, this.mOutArrow, this.rightArrow);
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.rightArrow, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.leftArrow,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
	}

	function mOverArrow(mc)
	{
		mc._width += 2;
		mc._height += 2;
	}
	function mOutArrow(mc)
	{
		mc._width -= 2;
		mc._height -= 2;
	}

	function SetClip(targetMC, textureDict, textureName)
	{
		this.arrow_loader = new MovieClipLoader();
		this.arrow_loader.addListener(this);
		var _loc2_ = "img://" + textureDict + "/" + textureName;
		this.arrow_loader.loadClip(_loc2_,targetMC);
	}
	function onLoadInit(target_mc)
	{
		target_mc._width = 16;
		target_mc._height = 16;
		//com.rockstargames.ui.utils.Colour.ApplyHudColour(target_mc,!this.highlighted ? this._textColor : this._textHighlightColor); 
		delete this.arrow_loader;
	}

	function get index()
	{
		return this._index % this.itemList.length;
	}

	function set index(val)
	{
		this._index = 100000000 - (100000000 % this.itemList.length) + val;
		this.setRightText(this.rightTextTF,this.itemList[this.index]);
		leftArrow._x = (this.leftArrowPos + 8) - this.itemMC.RLabelMC.labelTF.textWidth;
		com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.rightTextTF,this._textHighlightColor);
	}

	function addItem(item)
	{
		return this.itemList.push(item);
	}

	function removeItem(index)
	{
		return this.itemList.splice(index, 1);
	}

	function set highlighted(_h)
	{
		super.highlighted = _h;
		this.leftArrow._visible = _h;
		this.rightArrow._visible = _h;
		com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.rightTextTF,!_h ? this._textColor : this._textHighlightColor);
	}
}