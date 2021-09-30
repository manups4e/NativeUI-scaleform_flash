class com.rockstargames.ui.components.GUIView
{
	var viewID = 0;
	var viewIndex = 0;
	var viewContainerX = 0;
	var viewContainerY = 0;
	var viewMaskHeight = 0;
	var viewLinkageList = new Array();
	var rowSpacing = 10;
	var columnSpacing = 10;
	var itemY = 0;
	var visibleItems = 1;
	var highlightedItem = 0;
	var _highlighted = false;
	var _index = 0;
	var _maxitems = 0;
	var _params = 0;
	var itemList = new Array();
	var dataList = new Array();
	var itemSelectStyle = 0;
	var topEdge = 0;
	static var FOCUS_SELECTSTYLE = 0;
	static var LOCKED_SELECTSTYLE = 1;
	static var REORDER_SELECTSTYLE = 2;
	static var SCROLL_SELECTSTYLE = 3;
	static var SCROLLALL_SELECTSTYLE = 4;
	var viewContainer;

	function GUIView(_mc)
	{
		this.dataList = new Array();
		this.itemList = new Array();
		this.viewLinkageList = new Array();
	}
	function displayView()
	{
		if (this.itemSelectStyle == com.rockstargames.ui.components.GUIView.SCROLL_SELECTSTYLE)
		{
			if (this.dataList.length < this.visibleItems)
			{
				this.visibleItems = this.dataList.length;
			}
		}
		if (this.itemSelectStyle == com.rockstargames.ui.components.GUIView.SCROLLALL_SELECTSTYLE)
		{
			this.visibleItems = this.dataList.length;
		}
		this.itemY = 0;
		var _loc2_ = 0;
		while (_loc2_ < this.dataList.length)
		{
			if (_loc2_ < this.visibleItems || this.itemSelectStyle == com.rockstargames.ui.components.GUIView.FOCUS_SELECTSTYLE)
			{
				this.addDisplayItem(_loc2_,this.dataList[_loc2_]);
			}
			_loc2_ = _loc2_ + 1;
		}
	}
	function addItem(i, _dataArray)
	{
		this.dataList[i] = _dataArray;
	}
	function addDisplayItem(i, _dataArray)
	{
		if (this.viewLinkageList[i] == undefined)
		{
			this.viewLinkageList[i] = this.viewLinkageList[i - 1];
		}
		var _loc4_ = this.viewLinkageList[i];
		var _loc3_ = this.viewContainer.attachMovie(_loc4_, _loc4_ + i + "MC", i);
		_loc3_._y = this.itemY;
		var _loc5_ = com.rockstargames.ui.components.GUIMenuItem(_loc3_);
		_loc5_.__set__data(_dataArray);
		this.itemList[i] = _loc5_;
		this.itemY = this.itemY + (_loc3_._height + this.rowSpacing);
	}
	function addDisplayItemOnce(i, _dataArray)
	{
		if (this.itemSelectStyle == com.rockstargames.ui.components.GUIView.SCROLL_SELECTSTYLE)
		{
			if (this.dataList.length > this.visibleItems)
			{
				this.visibleItems = this.dataList.length;
			}
		}
		if (this.itemSelectStyle == com.rockstargames.ui.components.GUIView.SCROLLALL_SELECTSTYLE)
		{
			this.visibleItems = this.dataList.length;
		}
		this.addDisplayItem(i,this.dataList[i]);
	}
	function __set__params(_p)
	{
		var _loc3_ = _p.container;
		var _loc4_ = _loc3_.getNextHighestDepth();
		this.viewContainer = _loc3_.createEmptyMovieClip("dataViewMC" + _loc4_, _loc4_);
		if (_p.id != undefined)
		{
			this.viewID = _p.id;
		}
		if (_p.linkage != undefined)
		{
			this.viewLinkageList = _p.linkage;
		}
		if (_p.x != undefined)
		{
			this.viewContainer._x = this.viewContainerX = _p.x;
		}
		if (_p.y != undefined)
		{
			this.viewContainer._y = this.viewContainerY = _p.y;
		}
		if (_p.maskHeight != undefined)
		{
			this.viewMaskHeight = _p.maskHeight;
		}
		if (_p.rowSpacing != undefined)
		{
			this.rowSpacing = _p.rowSpacing;
		}
		if (_p.columnSpacing != undefined)
		{
			this.columnSpacing = _p.columnSpacing;
		}
		if (_p.selectstyle != undefined)
		{
			this.itemSelectStyle = _p.selectstyle;
		}
		if (_p.visibleItems != undefined && this.itemSelectStyle != com.rockstargames.ui.components.GUIView.FOCUS_SELECTSTYLE)
		{
			this.visibleItems = _p.visibleItems;
		}
		this._params = _p;
		return this.__get__params();
	}
	function __get__params()
	{
		return this._params;
	}
	function updateParams(_p)
	{
		if (_p.id != undefined)
		{
			this.viewID = this._params.id = _p.id;
		}
		if (_p.linkage != undefined)
		{
			this.viewLinkageList = this._params.linkage = _p.linkage;
		}
		if (_p.x != undefined)
		{
			this.viewContainer._x = this.viewContainerX = this._params.x = _p.x;
		}
		if (_p.y != undefined)
		{
			this.viewContainer._y = this.viewContainerY = this._params.y = _p.y;
		}
		if (_p.maskHeight != undefined)
		{
			this.viewMaskHeight = this._params.maskHeight = _p.maskHeight;
		}
		if (_p.rowSpacing != undefined)
		{
			this.rowSpacing = this._params.rowSpacing = _p.rowSpacing;
		}
		if (_p.columnSpacing != undefined)
		{
			this.columnSpacing = this._params.columnSpacing = _p.columnSpacing;
		}
		if (_p.selectstyle != undefined)
		{
			this.itemSelectStyle = this._params.selectstyle = _p.selectstyle;
		}
		if (_p.visibleItems != undefined && this.itemSelectStyle != com.rockstargames.ui.components.GUIView.FOCUS_SELECTSTYLE)
		{
			this.visibleItems = this._params.visibleItems = _p.visibleItems;
		}
	}
	function __get__index()
	{
		return this._index;
	}
	function __set__index(_i)
	{
		switch (this.itemSelectStyle)
		{
			case com.rockstargames.ui.components.GUIView.FOCUS_SELECTSTYLE :
				this.focusHighlightStyle(_i);
				break;
			case com.rockstargames.ui.components.GUIView.LOCKED_SELECTSTYLE :
				this.lockedHighlightStyle(_i);
				break;
			case com.rockstargames.ui.components.GUIView.REORDER_SELECTSTYLE :
				this.reorderHighlightStyle(_i);
				break;
			case com.rockstargames.ui.components.GUIView.SCROLL_SELECTSTYLE :
				this.scrollHighlightStyle(_i);
				break;
			case com.rockstargames.ui.components.GUIView.SCROLLALL_SELECTSTYLE :
				this.scrollAllHighlightStyle(_i);
		}
		this._index = _i;
		return this.__get__index();
	}
	function direction(targetIndex)
	{
		var _loc2_ = targetIndex - this._index;
		if (this.__get__maxitems() > 1)
		{
			if (targetIndex == 0 && this._index == this.__get__maxitems() - 1)
			{
				_loc2_ = 1;
			}
			if (targetIndex == this.__get__maxitems() - 1 && this._index == 0)
			{
				_loc2_ = -1;
			}
		}
		return _loc2_;
	}
	function focusHighlightStyle(targetIndex)
	{
		var _loc3_ = undefined;
		var _loc2_ = 0;
		_loc2_ = 0;
		while (_loc2_ < this.itemList.length)
		{
			_loc3_ = this.itemList[_loc2_];
			_loc3_.__set__highlighted(_loc2_ == targetIndex);
			_loc2_ = _loc2_ + 1;
		}
		this.highlightedItem = targetIndex;
	}
	function lockedHighlightStyle(targetIndex)
	{
		this.itemList[0].highlighted = true;
		var _loc3_ = this.direction(targetIndex);
		if (_loc3_ != 0)
		{
			_loc3_ != 1 ? this.dataList.splice(0, 0, this.dataList.pop()) : this.dataList.splice(this.__get__maxitems(), 0, this.dataList.shift());
			var _loc2_ = 0;
			_loc2_ = 0;
			while (_loc2_ < this.itemList.length)
			{
				this.itemList[_loc2_].data = this.dataList[_loc2_];
				_loc2_ = _loc2_ + 1;
			}
		}
	}
	function reorderHighlightStyle(targetIndex)
	{
		var _loc5_ = this.direction(targetIndex);
		if (_loc5_ != 0)
		{
			var _loc3_ = targetIndex;
			if (_loc3_ > this.dataList.length - this.itemList.length)
			{
				targetIndex = this.dataList.length - this.itemList.length;
			}
			_loc3_ = _loc3_ - targetIndex;
			var _loc2_ = 0;
			_loc2_ = 0;
			while (_loc2_ < this.itemList.length)
			{
				this.itemList[_loc2_].data = this.dataList[_loc2_ + targetIndex];
				this.itemList[_loc2_].highlighted = _loc3_ == _loc2_;
				_loc2_ = _loc2_ + 1;
			}
			this.highlightedItem = _loc3_;
		}
	}
	function scrollHighlightStyle(targetIndex)
	{
		var _loc5_ = this.direction(targetIndex);
		if (_loc5_ != 0)
		{
			var _loc3_ = targetIndex;
			var _loc2_ = 0;
			var _loc4_ = 0;
			if (_loc5_ > 0)
			{
				if (_loc3_ >= this.topEdge + this.visibleItems)
				{
					this.topEdge = this.topEdge + 1;
					_loc4_ = this.topEdge;
				}
				else
				{
					_loc4_ = this.topEdge;
					if (_loc4_ == this.dataList.length - this.visibleItems && _loc3_ == 0)
					{
						_loc4_ = 0;
						this.topEdge = 0;
					}
				}
				_loc3_ = _loc3_ - this.topEdge;
			}
			else
			{
				if (_loc3_ < this.topEdge)
				{
					this.topEdge = this.topEdge - 1;
					_loc4_ = this.topEdge;
				}
				else
				{
					_loc4_ = this.topEdge;
					if (_loc4_ == 0 && _loc3_ == this.dataList.length - 1)
					{
						_loc4_ = _loc3_ - this.visibleItems + 1;
						this.topEdge = _loc3_ - this.visibleItems + 1;
					}
				}
				_loc3_ = _loc3_ - this.topEdge;
			}
			_loc2_ = 0;
			while (_loc2_ < this.itemList.length)
			{
				this.itemList[_loc2_].data = this.dataList[_loc4_ + _loc2_];
				this.itemList[_loc2_].highlighted = _loc3_ == _loc2_;
				_loc2_ = _loc2_ + 1;
			}
			this.highlightedItem = _loc3_;
		}
	}
	function scrollAllHighlightStyle(targetIndex)
	{
		var _loc8_ = this.direction(targetIndex);
		if (_loc8_ != 0)
		{
			var _loc6_ = com.rockstargames.ui.components.GUIMenuItem(this.itemList[targetIndex]);
			var _loc4_ = 0;
			var _loc5_ = _loc6_._y + _loc6_._height - this.rowSpacing;
			var _loc7_ = _loc6_._y;
			if (_loc8_ > 0)
			{
				if (_loc5_ > this.topEdge + this.viewMaskHeight)
				{
					_loc4_ = this.viewMaskHeight - _loc5_;
					this.topEdge = _loc5_ - this.viewMaskHeight;
					this.viewContainer._y = _loc4_;
				}
				else if (this._index == this.itemList.length - 1 && targetIndex == 0)
				{
					_loc4_ = 0;
					this.topEdge = 0;
					this.viewContainer._y = _loc4_;
				}
			}
			else if (_loc7_ < this.topEdge)
			{
				_loc4_ = -_loc7_;
				this.topEdge = _loc7_;
				this.viewContainer._y = _loc4_;
			}
			else if (this._index == 0 && targetIndex == this.itemList.length - 1)
			{
				_loc4_ = this.viewMaskHeight - _loc5_;
				this.topEdge = this.viewContainer._height - this.viewMaskHeight;
				this.viewContainer._y = _loc4_;
			}
			var _loc2_ = 0;
			_loc2_ = 0;
			while (_loc2_ < this.itemList.length)
			{
				this.itemList[_loc2_].highlighted = _loc2_ == targetIndex;
				_loc2_ = _loc2_ + 1;
			}
			this.highlightedItem = targetIndex;
		}
	}
	function __get__maxitems()
	{
		this._maxitems = this.dataList.length;
		return this._maxitems;
	}
	function __set__highlighted(_h)
	{
		this._highlighted = _h;
		var _loc2_ = 0;
		while (_loc2_ < this.itemList.length)
		{
			this.itemList[_loc2_].highlighted = false;
			_loc2_ = _loc2_ + 1;
		}
		return this.__get__highlighted();
	}
	function __get__highlighted()
	{
		return this._highlighted;
	}
	function destroy()
	{
		var _loc2_ = 0;
		while (_loc2_ < this.itemList.length)
		{
			this.itemList[_loc2_].removeMovieClip();
			_loc2_ = _loc2_ + 1;
		}
		this.itemList = [];
		this.dataList = [];
	}
}