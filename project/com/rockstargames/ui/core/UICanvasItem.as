class com.rockstargames.ui.core.UICanvasItem
{
	var mc;
	var originalBounds;
	var scaledBounds;
	var gridPos;
	var anchor;
	var offset;
	function UICanvasItem()
	{
	}
	function init(_mc, _gridPos, _anchor, _offset)
	{
		this.mc = _mc;
		this.originalBounds = new flash.geom.Rectangle(0, 0, this.mc._width, this.mc._height);
		this.scaledBounds = new flash.geom.Rectangle(0, 0, this.mc._width, this.mc._height);
		this.gridPos = _gridPos;
		this.anchor = _anchor;
		this.offset = _offset;
	}
	function setScale(scale)
	{
		this.mc._xscale = this.mc._yscale = scale * 100;
		var _loc4_ = this.originalBounds.width * scale;
		var _loc3_ = this.originalBounds.height * scale;
		this.scaledBounds = new flash.geom.Rectangle(0, 0, _loc4_, _loc3_);
	}
	function setPosition(gridList)
	{
		var _loc2_ = gridList[this.gridPos];
		var _loc4_ = this.offset.x;
		var _loc3_ = this.offset.y;
		switch (this.anchor)
		{
			case 0 :
			default :
				_loc4_ = _loc4_ + _loc2_.x;
				_loc3_ = _loc3_ + _loc2_.y;
				break;
			case 1 :
				_loc4_ = _loc4_ + (_loc2_.x + _loc2_.width * 0.5 - this.scaledBounds.width * 0.5);
				_loc3_ = _loc3_ + _loc2_.y;
				break;
			case 2 :
				_loc4_ = _loc4_ + (_loc2_.x + _loc2_.width - this.scaledBounds.width);
				_loc3_ = _loc3_ + _loc2_.y;
				break;
			case 3 :
				_loc4_ = _loc4_ + _loc2_.x;
				_loc3_ = _loc3_ + (_loc2_.y + _loc2_.height * 0.5 - this.scaledBounds.height * 0.5);
				break;
			case 4 :
				_loc4_ = _loc4_ + (_loc2_.x + _loc2_.width * 0.5 - this.scaledBounds.width * 0.5);
				_loc3_ = _loc3_ + (_loc2_.y + _loc2_.height * 0.5 - this.scaledBounds.height * 0.5);
				break;
			case 5 :
				_loc4_ = _loc4_ + (_loc2_.x + _loc2_.width - this.scaledBounds.width);
				_loc3_ = _loc3_ + (_loc2_.y + _loc2_.height * 0.5 - this.scaledBounds.height * 0.5);
				break;
			case 6 :
				_loc4_ = _loc4_ + _loc2_.x;
				_loc3_ = _loc3_ + (_loc2_.y + _loc2_.height - this.scaledBounds.height);
				break;
			case 7 :
				_loc4_ = _loc4_ + (_loc2_.x + _loc2_.width * 0.5 - this.scaledBounds.width * 0.5);
				_loc3_ = _loc3_ + (_loc2_.y + _loc2_.height - this.scaledBounds.height);
				break;
			case 8 :
				_loc4_ = _loc4_ + (_loc2_.x + _loc2_.width - this.scaledBounds.width);
				_loc3_ = _loc3_ + (_loc2_.y + _loc2_.height - this.scaledBounds.height);
		}
		this.mc._x = _loc4_;
		this.mc._y = _loc3_;
	}
}