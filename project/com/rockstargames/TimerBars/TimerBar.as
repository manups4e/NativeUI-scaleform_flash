class com.rockstargames.TimerBars.TimerBar
{
	var itemMC;
	var backgroundMC;
	var backgroundMC_colored;
	var leftTextTF;
	var RLabelMC;
	var type;
	var rightTextTF;
	var _sliderColor;
	var bar;
	var m_fPadding;
	var m_bgMC;

	function TimerBar(mc, id, param0, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12, param13)
	{
		this.type = id;
		this.itemMC = mc.attachMovie("TimerBar", "timerBar_" + mc.getNextHighestDepth(), mc.getNextHighestDepth());
		this.leftTextTF = this.itemMC.labelMC.labelTF;
		this.leftTextTF.antiAliasType = "advanced";
		this.leftTextTF.selectable = false;
		this.leftTextTF.autoSize = "right";

		com.rockstargames.ui.utils.UIText.setSizedText(this.leftTextTF,param0,false);
		//this.itemMC.labelMC.setMask(this.itemMC.labelMC.maskMC);
		//com.rockstargames.ScaleformUI.utils.MovieClipHandler.ApplyHexColour(this.backgroundMC,-1174405120);
		com.rockstargames.ScaleformUI.utils.MovieClipHandler.ApplyHexColour(this.itemMC.bg_colored,-1174405120);
		this.itemMC.bg_colored._alpha = 30;

		this.backgroundMC = this.itemMC.bgMC.attachMovie("txdLoader", "bgMC", this.itemMC.bgMC.getNextHighestDepth);
		com.rockstargames.ScaleformUI.utils.MovieClipHandler.SetClip(this.backgroundMC,"timerbars","all_black_bg",288,25);

		this.backgroundMC_colored = this.itemMC.bg_colored.attachMovie("txdLoader", "bgMC", this.itemMC.bg_colored.getNextHighestDepth);
		com.rockstargames.ScaleformUI.utils.MovieClipHandler.SetClip(this.backgroundMC_colored,"timerbars","all_black_bg",288,25);

		switch (id)
		{
			case 0 :
				this.itemMC.RLabelMC._x = 271.95;
				this.itemMC.RLabelMC._visible = true;
				this.rightTextTF = this.itemMC.RLabelMC.labelTF;
				break;
			case 1 :
				this._sliderColor = param2;
				this.bar = this.itemMC.attachMovie("GenericColourBar", "progress_bar", this.itemMC.getNextHighestDepth(), {_y:7.50});
				var _loc1_ = new com.rockstargames.ui.utils.HudColour();
				com.rockstargames.ScaleformUI.utils.MovieClipHandler.HexToARGB(this._sliderColor,_loc1_);
				this.bar.initCustom(_loc1_,100,10);
				this.bar._visible = true;
				this.itemMC.RLabelMC._visible = false;
				this.bar.percentDecimal(param1,false);
				this.bar._x = 280 - this.bar._width;
				break;

		}
		com.rockstargames.ScaleformUI.utils.MovieClipHandler.UpdateFont(this.leftTextTF,"$Font2",13);
	}

	function onLoadBg()
	{
		this.backgroundMC._width = 288;
		this.backgroundMC._height = 25;
	}

	function SetRightText(str)
	{
		this.setRightText(this.rightTextTF,"TEST");
	}

	function setRightText(tf, str, autoShrink, sizeOffset, sizeOverride)
	{
		tf.wordWrap = false;
		tf.multiline = false;
		tf.html = true;
		tf.autoSize = "right";
		var _loc3_ = 0;
		if ((sizeOffset != undefined))
		{
			_loc3_ = sizeOffset;
		}
		var _loc2_ = com.rockstargames.ui.utils.UIText.SIZE - _loc3_;
		if ((sizeOverride != undefined))
		{
			_loc2_ = sizeOverride;
		}
		tf.htmlText = "<FONT SIZE=\'" + _loc2_ + "\'>" + str + "</FONT>";
		tf.verticalAlign = "center";
		if (autoShrink)
		{
			tf.textAutoSize = "shrink";
		}
	}

	function Update(param0, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12, param13)
	{
		switch (this.type)
		{
			case 0 :

				this.setRightText(this.rightTextTF,param0,param1);
				com.rockstargames.ScaleformUI.utils.MovieClipHandler.UpdateFont(this.rightTextTF,"$Font2",param1);
				var colonIndex = param0.lastIndexOf(":");
				if (param3 != undefined && param3 != -986896)
				{
					com.rockstargames.ScaleformUI.utils.MovieClipHandler.ApplyHexColourToTF(this.rightTextTF,param3);
					this.itemMC.bg_colored._visible = true;
					com.rockstargames.ScaleformUI.utils.MovieClipHandler.ApplyHexColour(this.itemMC.bg_colored,param3);
					this.itemMC.bg_colored._alpha = 30;
				}
				else
				{
					this.itemMC.bg_colored._visible = false;
				}
				if (colonIndex != -1)
				{
					this.rightTextTF.autoSize = true;
					if (param2)
					{
						var newFont = this.rightTextTF.getTextFormat();
						newFont.size = 12;
						this.rightTextTF.setTextFormat(colonIndex,param0.length,newFont);
						this.itemMC.RLabelMC._x = 205;
					}
					else
					{
						this.itemMC.RLabelMC._x = 190;
					}
				}
				else
				{
					this.rightTextTF.autoSize = "right";
					this.itemMC.RLabelMC._x = 288 - 15 - this.itemMC.RLabelMC._width;
				}

				break;
			case 1 :
				if (this._sliderColor != param1)
				{
					this._sliderColor = param1;
					var hudColour = new com.rockstargames.ui.utils.HudColour();
					com.rockstargames.ScaleformUI.utils.MovieClipHandler.HexToARGB(this._sliderColor,hudColour);
					com.rockstargames.ui.utils.Colour.Colourise(this.bar.barfillMC,hudColour.r,hudColour.g,hudColour.b,hudColour.a);
					com.rockstargames.ui.utils.Colour.Colourise(this.bar.baralphaMC,hudColour.r,hudColour.g,hudColour.b,30);
					var _loc3_ = new com.rockstargames.ui.utils.HudColour();
					com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,_loc3_);
					com.rockstargames.ui.utils.Colour.Colourise(this.bar.blackMC,_loc3_.r,_loc3_.g,_loc3_.b,50);
				}
				this.bar.percentDecimal(param0,false);
				break;
		}
	}

	function CheckRestricted(src:String, restricted:String):Boolean
	{
		return !src.split("").some(function (ch:String):Boolean
		{
		return restricted.indexOf(ch) !== -1;
		});
	}

	function set Value(value)
	{
		switch (this.type)
		{
			case 0 :
				this.setRightText(this.rightTextTF,value,16);
				break;
		}
	}
}