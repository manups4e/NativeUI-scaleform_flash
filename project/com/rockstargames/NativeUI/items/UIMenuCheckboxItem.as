class com.rockstargames.NativeUI.items.UIMenuCheckboxItem extends com.rockstargames.NativeUI.items.BaseMenuItem
{
	static var CHECKBOX_STYLE_CROSS = 0;
	static var CHECKBOX_STYLE_TICK = 1;
	var checkbox;
	var tickStyle;
	var _checked;

	function UIMenuCheckboxItem(str, substr, parentMenu, style, _active, mainColor, highlightColor, textColor, textHighlightColor)
	{
		super(parentMenu,str,substr);
		this.itemMC = this.parentMC.attachMovie("UIMenuCheckboxItem", "checkboxMenuItem", this.parentMC.getNextHighestDepth());
		this.backgroundMC = this.itemMC.bgMC;
		this.leftTextTF = this.itemMC.labelMC.labelTF;
		this.leftTextTF.antiAliasType = "advanced";
		this.leftTextTF.selectable = false;
		this.checkbox = this.itemMC.checkBoxMC;
		this.tickStyle = style;
		this.checked = _active;
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

	function set checked(bool)
	{
		if (bool)
		{
			this.checkbox.emptyMC._visible = false;
			this.checkbox.checkBG._visible = true;
			switch (this.tickStyle)
			{
				case 0 :
					this.checkbox.crossMC._visible = true;
					this.checkbox.tickMC._visible = false;
					break;
				case 1 :
					this.checkbox.tickMC._visible = true;
					this.checkbox.crossMC._visible = false;
					break;
				default :
					this.checkbox.crossMC._visible = true;
					this.checkbox.tickMC._visible = false;
					break;
			}
		}
		else
		{
			this.checkbox.tickMC._visible = false;
			this.checkbox.crossMC._visible = false;
			this.checkbox.checkBG._visible = false;
			this.checkbox.emptyMC._visible = true;
		}
		this._checked = bool;
	}

	function get checked()
	{
		return _checked;
	}

	function set highlighted(_h)
	{
		super.highlighted = _h;
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.checkbox.tickMC,!_h ? this._highlightColor : this._mainColor);
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.checkbox.crossMC,!_h ? this._highlightColor : this._mainColor);
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.checkbox.checkBG,!_h ? this._textColor : this._textHighlightColor);
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.checkbox.emptyMC,!_h ? this._textColor : this._textHighlightColor);
	}
	function get highlighted()
	{
		return super.highlighted;
	}
}