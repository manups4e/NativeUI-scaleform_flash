class com.rockstargames.gtav.utils.GTAVUIUtils
{
	function GTAVUIUtils()
	{
	}
	static function getAdjustedSegmentPct(pct, segmentW, gapW, numSegments)
	{
		var _loc1_ = segmentW * numSegments;
		var _loc2_ = _loc1_ + gapW * (numSegments - 1);
		var _loc5_ = 100 / numSegments;
		var _loc4_ = pct / 100;
		var _loc6_ = (Math.floor(pct / _loc5_) * gapW + _loc4_ * _loc1_) / _loc2_ * 100;
		return _loc6_;
	}
	static function parseHTMLForFonts(str, stdPtSize)
	{
		str = str.split("<C>").join("<FONT FACE=\'" + com.rockstargames.gtav.utils.GTAVUIConfig.CONDENSED_FONT + "\' SIZE=\'" + (stdPtSize + 3) + "\'>");
		str = str.split("</C>").join("<FONT FACE=\'" + com.rockstargames.gtav.utils.GTAVUIConfig.DEFAULT_FONT + "\' SIZE=\'" + stdPtSize + "\'>");
		return str;
	}
	static function colourRankIcon(rankMC)
	{
		com.rockstargames.ui.utils.Colour.ApplyHudColour(rankMC.innerMC,116);
		com.rockstargames.ui.utils.Colour.ApplyHudColour(rankMC.bgMC,2);
	}
	static function trimTextToFit(str, tf)
	{
		var _loc1_ = str;
		var _loc3_ = "...";
		if (tf.multiline)
		{
			tf.text = _loc1_;
			if (tf.textHeight > tf._height)
			{
				_loc1_ = _loc1_.substr(0, _loc1_.length * tf._height / tf.textHeight);
				tf.text = _loc1_ + _loc3_;
				if (tf.textHeight <= tf._height)
				{
					while (tf.textHeight <= tf._height)
					{
						_loc1_ = _loc1_ + str.charAt(_loc1_.length);
						tf.text = _loc1_ + _loc3_;
					}
					_loc1_ = _loc1_.substr(0, _loc1_.length - 1);
				}
				else
				{
					while (tf.textHeight > tf._height)
					{
						_loc1_ = _loc1_.substr(0, _loc1_.length - 1);
						tf.text = _loc1_ + _loc3_;
					}
				}
				_loc1_ = _loc1_ + _loc3_;
			}
		}
		return _loc1_;
	}
	static function trimTextToFitNumLines(str, tf, numLines)
	{
		var _loc2_ = str;
		if (tf.autoSize != "none")
		{
			var _loc3_ = "...";
			tf.text = _loc2_;
			if (tf.bottomScroll - tf.scroll + 1 > numLines)
			{
				_loc2_ = _loc2_.substr(0, _loc2_.length * tf._height / tf.textHeight);
				tf.text = _loc2_ + _loc3_;
				if (tf.bottomScroll - tf.scroll + 1 <= numLines)
				{
					while (tf.textHeight <= tf._height)
					{
						_loc2_ = _loc2_ + str.charAt(_loc2_.length);
						tf.text = _loc2_ + _loc3_;
						trace("tf.bottomScroll - tf.scroll: " + tf.bottomScroll - tf.scroll);
					}
					_loc2_ = _loc2_.substr(0, _loc2_.length - 1);
				}
				else
				{
					while (tf.bottomScroll - tf.scroll + 1 > numLines)
					{
						_loc2_ = _loc2_.substr(0, _loc2_.length - 1);
						tf.text = _loc2_ + _loc3_;
						trace("tf.bottomScroll - tf.scroll: " + tf.bottomScroll - tf.scroll);
					}
				}
				_loc2_ = _loc2_ + _loc3_;
			}
		}
		return _loc2_;
	}
	static function getFontSizeToFitSingle(str, tf)
	{
		tf.text = str;
		var _loc2_ = tf.getTextFormat();
		if (tf.multiline)
		{
			do
			{
				tf.setNewTextFormat(_loc2_);
				tf.text = str;
				_loc2_.size = _loc2_.size - 1;
			} while (tf.bottomScroll - tf.scroll > 0 && _loc2_.size > 0);

		}
		return _loc2_.size;
	}
}