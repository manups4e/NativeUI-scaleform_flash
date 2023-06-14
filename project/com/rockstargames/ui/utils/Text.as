class com.rockstargames.ui.utils.Text
{
	var SIZE = 13;
	var SIZE_GTAG = 18;
	function Text()
	{
	}

	function setTextWithIcons(text, movieClipToAttachBlips, txtField, fontStyle, pointSize, leading, centerAligned, translateText)
	{
		if (translateText == undefined)
		{
			translateText = false;
		}
		com.rockstargames.ui.game.GameInterface.call("SET_FORMATTED_TEXT_WITH_ICONS",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,text,movieClipToAttachBlips,txtField,fontStyle,pointSize,leading,centerAligned,translateText);
	}

	function setSizedText(tf, str, autoShrink, autoSize, sizeOffset, sizeOverride)
	{
		tf.wordWrap = false;
		tf.multiline = false;
		tf.html = true;
		var _loc4_ = 0;
		if (sizeOffset != undefined)
		{
			_loc4_ = sizeOffset;
		}
		var _loc3_ = this.SIZE - _loc4_;
		if (sizeOverride != undefined)
		{
			_loc3_ = sizeOverride;
		}
		tf.htmlText = "<FONT SIZE=\'" + _loc3_ + "\'>" + str + "</FONT>";
		tf.verticalAlign = "center";
		if (autoShrink)
		{
			tf.textAutoSize = "shrink";
		}
		else if (autoSize)
		{
			tf.autoSize = true;
		}
	}
	function setDescText(tf, str, autoSize)
	{
		tf.wordWrap = true;
		tf.multiline = true;
		tf.html = true;
		tf.htmlText = "<FONT SIZE=\'" + this.SIZE + "\'>" + str + "</FONT>";
		if (autoSize != undefined && autoSize == true)
		{
			tf.autoSize = true;
		}
	}
	static function setTextWithTranslation(txtField, textLabel, scriptType, isHTML)
	{
		if (isHTML == undefined)
		{
			isHTML = false;
		}
		if (scriptType == undefined)
		{
			com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,textLabel,txtField,isHTML);
		}
		else
		{
			com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",scriptType,textLabel,txtField,isHTML);
		}
	}
	static function capText()
	{
		var _loc10_ = arguments[0];
		var _loc11_ = arguments[1];
		var _loc4_ = _loc11_;
		var _loc6_ = _loc10_.getNewTextFormat();
		var _loc3_ = _loc6_.getTextExtent(_loc4_);
		var _loc5_ = _loc3_.textFieldWidth;
		var _loc7_ = _loc10_._width;
		if (_loc5_ < _loc7_)
		{
			return _loc4_;
		}
		var _loc9_ = _loc4_.length;
		_loc3_ = _loc6_.getTextExtent("...");
		var _loc8_ = _loc3_.textFieldWidth;
		var _loc2_ = 0;
		while (_loc2_ < _loc9_)
		{
			_loc3_ = _loc6_.getTextExtent(_loc4_.slice(0, _loc2_));
			_loc5_ = _loc3_.textFieldWidth;
			if (_loc5_ > _loc7_ - _loc8_)
			{
				return _loc4_.slice(0, _loc2_ - 1) + "...";
			}
			_loc2_ = _loc2_ + 1;
		}
	}
	static function scaleText()
	{
		var _loc7_ = arguments[0];
		var _loc2_ = arguments[1];
		var _loc12_ = _loc2_;
		var _loc11_ = arguments[2];
		var _loc9_ = arguments[3];
		if (_loc9_ == undefined)
		{
			_loc9_ = "left";
		}
		var _loc15_ = arguments[4];
		var _loc8_ = false;
		var _loc5_ = 0;
		while (_loc5_ < 3)
		{
			var _loc4_ = _loc2_.indexOf("<");
			if (_loc4_ == -1)
			{
				break;
			}
			var _loc3_ = _loc2_.indexOf(">");
			if (_loc3_ == -1)
			{
				break;
			}
			_loc8_ = true;
			var _loc6_ = _loc2_.substr(0, _loc4_) + _loc2_.substr(_loc3_ + 1);
			_loc2_ = _loc6_;
			_loc5_ = _loc5_ + 1;
		}
		var _loc13_ = _loc7_.getNewTextFormat();
		var _loc14_ = _loc13_.getTextExtent(_loc2_);
		var _loc10_ = _loc14_.textFieldWidth;
		_loc7_.autoSize = _loc9_;
		_loc7_.wordWrap = false;
		if (_loc10_ > _loc11_)
		{
			_loc7_._xscale = _loc11_ / _loc10_ * 100;
		}
		else
		{
			_loc7_._xscale = 100;
		}
		if (_loc8_ == true)
		{
			_loc7_.htmlText = _loc12_;
		}
		else
		{
			_loc7_.text = _loc2_;
		}
	}
}