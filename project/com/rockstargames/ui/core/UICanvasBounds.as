class com.rockstargames.ui.core.UICanvasBounds extends com.rockstargames.ui.core.BaseScriptUI
{
	var screenRect;
	var safeRect;
	var gridRect;
	var subGridRect;
	var canvasItems = new Array();
	var grids = new Array();
	var baseWidth = 1920;
	var baseHeight = 1080;
	var screenScale = 1;
	var safePercent = 10;
	var debugList = [];
	var scaleItems = true;
	var debugDraw = true;
	var canvasMC;
	static var instance = null;
	static var EXACTFIT = "exactFit";
	static var SHOWALL = "showAll";
	static var NOBORDER = "noBorder";
	static var NOSCALE = "noScale";

	function UICanvasBounds(mc)
	{
		super();
		this.canvasMC = mc;
		this.screenRect = new flash.geom.Rectangle(0, 0, 1280, 720);
		this.safeRect = new flash.geom.Rectangle(0, 0, 1280, 720);
		this.gridRect = new flash.geom.Rectangle(0, 0, 432, 324);
		this.subGridRect = new flash.geom.Rectangle(0, 0, 54, 54);
		this.canvasItems = [];
		this.grids = [];
		var _loc5_ = 9;
		var _loc3_ = 0;
		while (_loc3_ < _loc5_)
		{
			var _loc4_ = this.gridRect;
			this.grids.push(this.gridRect);
			_loc3_ = _loc3_ + 1;
		}
		this.update(this.screenRect,this.safeRect);
	}
	function setScale(scale)
	{
		var _loc1_ = 0;
		if (scale != undefined)
		{
			_loc1_ = scale;
		}
		var _loc2_ = ["exactFit", "showAll", "noBorder", "noScale"];
		Stage.scaleMode = _loc2_[_loc1_];
	}
	function update(_screenRect, _safeRect)
	{
		this.screenRect = _screenRect;
		this.safeRect = _safeRect;
		com.rockstargames.ui.utils.Debug.log("screenRect " + this.screenRect);
		com.rockstargames.ui.utils.Debug.log("safeRect " + this.safeRect);
		this.screenScale = this.screenRect.height / this.baseHeight;
		com.rockstargames.ui.utils.Debug.log("screenScale " + this.screenScale);
		this.setSafePercent(this.safePercent);
		this.canvasMC._parent.detailsMC.actTF.text = "Actual: " + Stage.originalRect;
		this.canvasMC._parent.detailsMC.dimTF.text = "Screen: " + this.screenRect;
		this.canvasMC._parent.detailsMC.safeTF.text = "Safe: " + this.newsafeRect;
		this.canvasMC._parent.detailsMC.titleTF.text = "Scale: " + Math.round(this.screenScale * 100);
		this.canvasMC._parent.detailsMC.perTF.text = "%: " + this.screenScale;
		this.canvasMC._parent.borderMC._x = this.safeRect.x;
		this.canvasMC._parent.borderMC._y = this.safeRect.y;
		this.canvasMC._parent.borderMC._width = this.safeRect.width;
		this.canvasMC._parent.borderMC._height = this.safeRect.height;
		this.rePositionGrid();
		this.rePositionCanvasItems();
	}
	function setSafePercent(percent)
	{
		if (percent > 10)
		{
			percent = 10;
		}
		var _loc2_ = percent / 2 / 100;
		var _loc6_ = this.screenRect.x + this.screenRect.width * _loc2_;
		var _loc4_ = this.screenRect.y + this.screenRect.height * _loc2_;
		var _loc7_ = this.screenRect.width - this.screenRect.width * _loc2_ * 2;
		var _loc5_ = this.screenRect.height - this.screenRect.height * _loc2_ * 2;
		this.newsafeRect = new flash.geom.Rectangle(_loc6_, _loc4_, _loc7_, _loc5_);
		this.safeRect = this.newsafeRect;
		this.safePercent = percent;
	}
	function rePositionGrid()
	{
		var _loc6_ = 0;
		var _loc5_ = 0;
		var _loc8_ = this.gridRect.width * this.screenScale;
		var _loc7_ = this.gridRect.height * this.screenScale;
		var _loc2_ = 0;
		while (_loc2_ < this.grids.length)
		{
			var _loc9_ = this.grids[_loc2_];
			var _loc3_ = Math.floor(_loc2_ / 3);
			var _loc4_ = Math.floor(_loc2_ % 3);
			if (_loc3_ == 0)
			{
				_loc5_ = this.safeRect.top;
			}
			if (_loc3_ == 1)
			{
				_loc5_ = this.safeRect.top + this.safeRect.height / 2 - _loc7_ / 2;
			}
			if (_loc3_ == 2)
			{
				_loc5_ = this.safeRect.bottom - _loc7_;
			}
			if (_loc4_ == 0)
			{
				_loc6_ = this.safeRect.left;
			}
			if (_loc4_ == 1)
			{
				_loc6_ = this.safeRect.left + this.safeRect.width / 2 - _loc8_ / 2;
			}
			if (_loc4_ == 2)
			{
				_loc6_ = this.safeRect.right - _loc8_;
			}
			this.grids[_loc2_] = new flash.geom.Rectangle(_loc6_, _loc5_, _loc8_, _loc7_);
			_loc2_ = _loc2_ + 1;
		}
		if (this.debugDraw)
		{
			this.drawGrid();
		}
	}
	function drawGrid()
	{
		var _loc2_ = 0;
		while (_loc2_ < this.grids.length)
		{
			var _loc3_ = this.debugList[_loc2_];
			if (_loc3_ != null)
			{
				_loc3_.removeMovieClip();
			}
			_loc3_ = this.drawRect(this.grids[_loc2_]);
			this.debugList[_loc2_] = _loc3_;
			_loc2_ = _loc2_ + 1;
		}
	}
	function drawRect(rect)
	{
		var _loc10_ = this.canvasMC.getNextHighestDepth();
		var _loc5_ = this.canvasMC.createEmptyMovieClip("dMC" + _loc10_, _loc10_);
		_loc5_.clear();
		_loc5_.lineStyle(1,16763904,50);
		_loc5_.beginFill(16763904,30);
		_loc5_.moveTo(rect.x,rect.y);
		_loc5_.lineTo(rect.x + rect.width,rect.y);
		_loc5_.lineTo(rect.x + rect.width,rect.y + rect.height);
		_loc5_.lineTo(rect.x,rect.y + rect.height);
		_loc5_.lineTo(rect.x,rect.y);
		var _loc9_ = this.gridRect.width / this.subGridRect.width;
		var _loc8_ = this.gridRect.height / this.subGridRect.height;
		var _loc6_ = rect.width / _loc9_;
		var _loc7_ = rect.height / _loc8_;
		var _loc4_ = 0;
		while (_loc4_ < _loc8_)
		{
			_loc5_.moveTo(rect.x,rect.y + _loc4_ * _loc7_);
			_loc5_.lineTo(rect.x + rect.width,rect.y + _loc4_ * _loc7_);
			_loc4_ = _loc4_ + 1;
		}
		var _loc3_ = 0;
		while (_loc3_ < _loc9_)
		{
			_loc5_.moveTo(rect.x + _loc3_ * _loc6_,rect.y);
			_loc5_.lineTo(rect.x + _loc3_ * _loc6_,rect.y + rect.height);
			_loc3_ = _loc3_ + 1;
		}
		return _loc5_;
	}
	function rePositionCanvasItems()
	{
		if (this.canvasItems.length > 0)
		{
			var _loc3_ = 0;
			while (_loc3_ < this.canvasItems.length)
			{
				var _loc2_ = this.canvasItems[_loc3_];
				if (_loc2_ != undefined)
				{
					if (this.scaleItems)
					{
						_loc2_.setScale(this.screenScale);
					}
					_loc2_.setPosition(this.grids);
				}
				_loc3_ = _loc3_ + 1;
			}
		}
	}
	function addCanvasItem(_mc, _gridItem, _anchor, _offset)
	{
		if (_offset == null)
		{
			_offset = new flash.geom.Point(0, 0);
		}
		if (_mc != undefined)
		{
			var _loc2_ = new com.rockstargames.ui.core.UICanvasItem();
			_loc2_.init(_mc,_gridItem,_anchor,_offset);
			this.canvasItems.push(_loc2_);
		}
	}
	function removeCanvasItem(_mc)
	{
		var _loc2_ = 0;
		while (_loc2_ < this.canvasItems.length)
		{
			var _loc3_ = this.canvasItems[_loc2_];
			if (_loc3_.mc == _mc)
			{
				this.canvasItems.splice(_loc2_,1);
				break;
			}
			_loc2_ = _loc2_ + 1;
		}
	}
}