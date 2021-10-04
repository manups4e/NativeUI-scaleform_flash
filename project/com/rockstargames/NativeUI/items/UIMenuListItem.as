class com.rockstargames.NativeUI.items.UIMenuListItem extends com.rockstargames.NativeUI.items.BaseMenuItem
{
	var _index;
	var rightTextTF;
	var itemList = [];
	var leftArrow;
	var leftArrowPos = 257.0;
	var rightArrow;
	var stringItems;

	function UIMenuListItem(str, substr, parentMenu, listItems, __index, mainColor, highlightColor, textColor, textHighlightColor)
	{
		super(parentMenu,str,substr);
		this.itemMC = this.parentMC.attachMovie("UIMenuListItem", "listMenuItem", this.parentMC.getNextHighestDepth());
		this.backgroundMC = this.itemMC.bgMC;
		this.itemList = listItems.split(",");
		this.leftArrow = this.itemMC.leftArrow;
		this.rightArrow = this.itemMC.rightArrow;
		this.leftTextTF = this.itemMC.labelMC.labelTF;
		this.leftTextTF.antiAliasType = "advanced";
		this.leftTextTF.selectable = false;
		this.rightTextTF = this.itemMC.RLabelMC.labelTF;
		this.rightTextTF.antiAliasType = "advanced";
		this.rightTextTF.selectable = false;
		this.index = __index;
		this.stringItems = listItems;
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
	}

	function get index()
	{
		return this._index % this.itemList.length;
	}

	function set index(val)
	{
		this._index = 100000000 - (100000000 % this.itemList.length) + val;
		this.setRightText(this.rightTextTF,this.itemList[this.index]);
		leftArrow._x = (this.leftArrowPos + 5) - this.itemMC.RLabelMC.labelTF.textWidth;
		com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.rightTextTF, this._textHighlightColor);
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
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.leftArrow,!_h ? com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE : com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.rightArrow,!_h ? com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE : com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
		com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.rightTextTF,!_h ? this._textColor : this._textHighlightColor);
	}

	function setListFromString()
	{

	}
}