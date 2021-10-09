class com.rockstargames.NativeUI.panels.BasePanel
{
	var parentItem;
	var _enabled;
	var bgMC;
	var itemMC;

	function BasePanel(parent)
	{
		this.parentItem = parent;
	}
	
	function setRightText(tf, str, autoShrink, sizeOffset, sizeOverride)
	{
		tf.wordWrap = false;
		tf.multiline = false;
		tf.html = true;
		tf.autoSize = "right";
		var _loc3_ = 0;
		if (sizeOffset != undefined)
		{
			_loc3_ = sizeOffset;
		}
		var _loc2_ = com.rockstargames.ui.utils.UIText.SIZE - _loc3_;
		if (sizeOverride != undefined)
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


	function set isVisible(_h)
	{
		this.itemMC._visible = _h;
	}

	function get isVisible()
	{
		return this.itemMC._visible;
	}
}