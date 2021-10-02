class com.rockstargames.NativeUI.items.UIMenuItem extends com.rockstargames.NativeUI.items.BaseMenuItem
{
	var rightTextTF;
	var rightText;
	var rightBadge;
	var _data;

	function UIMenuItem(str, substr, parentMenu)
	{
		super(parentMenu,str,substr);
		this.itemMC = this.parentMC.attachMovie("UIMenuItem", "menuItem", this.parentMC.getNextHighestDepth());
		this.backgroundMC = this.itemMC.bgMC;
		this.leftTextTF = this.itemMC.labelMC.labelTF;
		this.leftTextTF.antiAliasType = "advanced";
		this.leftTextTF.selectable = false;
		this.rightTextTF = this.itemMC.RLabelMC.labelTF;

		com.rockstargames.ui.utils.UIText.setSizedText(this.leftTextTF,this.leftText,true,true);
		/*
		com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.leftTextTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
		*/
	}

	function SetRightText(str)
	{
		com.rockstargames.ui.utils.UIText.setSizedText(this.rightTextTF,str,true,true);
	}
}