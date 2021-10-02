class com.rockstargames.NativeUI.items.UIMenuCheckboxItem extends com.rockstargames.NativeUI.items.BaseMenuItem
{
	static var CHECKBOX_STYLE_CROSS = 0;
	static var CHECKBOX_STYLE_TICK = 1;
	var checkbox;
	var tickStyle;
	var _checked;

	function UIMenuCheckboxItem(str, substr, parentMenu, style, _active)
	{
		super(parentMenu,str,substr);
		this.itemMC = this.parentMC.attachMovie("UIMenuCheckboxItem", "checkboxMenuItem", this.parentMC.getNextHighestDepth());
		this.backgroundMC = this.itemMC.bgMC;
		this.leftTextTF = this.itemMC.labelMC.labelTF;
		this.leftTextTF.antiAliasType = "advanced";
		this.leftTextTF.selectable = false;
		this.leftTextTF._width = 205;
		this.checkbox = this.itemMC.checkBoxMC;
		this.tickStyle = style;
		this.checked = _active;
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
		super.highlighted =_h;
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.checkbox.tickMC,!_h ? com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK : com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.checkbox.crossMC,!_h ? com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK : com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.checkbox.checkBG,!_h ? com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE : com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.checkbox.emptyMC,!_h ? com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE : com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
	}
}