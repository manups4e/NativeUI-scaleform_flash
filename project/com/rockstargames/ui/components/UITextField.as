class com.rockstargames.ui.components.UITextField extends MovieClip
{
	static var PT_TO_PADDING = 0.18;
	var _visible;
	var attachMovie;
	var createTextField;
	var getNextHighestDepth;
	var m_bShowBG;
	var m_bgMC;
	var m_fPadding;
	var m_tf;

	function UITextField(ptSize)
	{
		super();
		this.m_bShowBG = false;
	}
	function init(size, font, eHudColour, bShowBG)
	{
		if (!this.m_tf)
		{
			this.m_tf = this.createTextField("m_tf", this.getNextHighestDepth(), 0, 0, 10, 10);
			this.m_tf.embedFonts = true;
			this.m_tf.autoSize = true;
		}
		var _loc2_ = new TextFormat();
		_loc2_.font = font;
		_loc2_.size = size;
		this.m_tf.setNewTextFormat(_loc2_);
		this.m_fPadding = size * com.rockstargames.ui.components.UITextField.PT_TO_PADDING;
		this.setTextColour(eHudColour);
		this.showBG(bShowBG);
	}
	function showBG(bShowBG)
	{
		this.m_bShowBG = bShowBG;
		if (this.m_bShowBG)
		{
			if (!this.m_bgMC)
			{
				this.m_bgMC = this.attachMovie("textBG", "m_bgMC", this.getNextHighestDepth(), {_y:2});
				if (this.m_tf)
				{
					this.m_bgMC.swapDepths(this.m_tf);
				}
			}
			this.resizeBG();
		}
		else if (this.m_bgMC)
		{
			this.m_bgMC._visible = false;
		}
	}
	function setText(text)
	{
		if (text == "")
		{
			this._visible = false;
		}
		else
		{
			this._visible = true;
			this.m_tf.text = text;
			if (this.m_bShowBG)
			{
				this.resizeBG();
			}
		}
	}
	function setTextColour(eHudColour)
	{
		com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.m_tf,eHudColour);
	}
	function setBgColour(eHudColour)
	{
		com.rockstargames.ui.utils.Colour.ApplyHudColour(this.m_bgMC,eHudColour);
	}
	function resizeBG()
	{
		this.m_tf._x = this.m_fPadding * 0.5;
		this.m_bgMC._width = this.m_tf.textWidth + this.m_fPadding * 2 + 1;
		this.m_bgMC._height = this.m_tf.textHeight;
	}
}