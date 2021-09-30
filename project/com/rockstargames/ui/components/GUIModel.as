dynamic class com.rockstargames.ui.components.GUIModel
{
	var dataList = new Array();
	var viewList = new Array();
	var viewIndex:Number = 0;
	var _scrollBar;

	function GUIModel()
	{
		this.dataList = [];
		this.viewList = [];
	}

	function getCurrentView(forceTarget)
	{
		var __reg2 = forceTarget == undefined ? this.viewList[this.viewIndex] : this.viewList[forceTarget];
		return __reg2;
	}

	function getCurrentSelection(forceTarget)
	{
		var __reg2 = this.getCurrentView(forceTarget);
		return __reg2.__get__index();
	}

	function set scrollBar(s)
	{
		this._scrollBar = s;
	}

	function get scrollBar()
	{
		return this._scrollBar;
	}

	function createView(_viewIndex, _params)
	{
		var __reg2 = this.viewList[_viewIndex];
		if (__reg2 == undefined)
		{
			__reg2 = new com.rockstargames.ui.components.GUIView();
		}
		__reg2.viewIndex = _viewIndex;
		__reg2.__set__params(_params);
		this.viewList[_viewIndex] = __reg2;
	}

	function addDataToView(_viewIndex, _itemIndex, _dataArray)
	{
		var __reg2 = this.viewList[_viewIndex];
		__reg2.addItem(_itemIndex,_dataArray);
	}

	function updateSlot(_viewIndex, _itemIndex, _dataArray)
	{
		this.addDataToView(_viewIndex,_itemIndex,_dataArray);
		var __reg2 = this.getCurrentView(_viewIndex);
		var __reg3 = _itemIndex - __reg2.__get__index() + __reg2.highlightedItem;
		__reg2.itemList[__reg3].data = _dataArray;
	}

	function addSlot(_viewIndex, _itemIndex, _dataArray)
	{
		this.addDataToView(_viewIndex,_itemIndex,_dataArray);
		var __reg2 = this.getCurrentView(_viewIndex);
		__reg2.addDisplayItemOnce(_itemIndex,_dataArray);
	}

	function removeDataFromSlot(_viewIndex, _slotIndex)
	{
		var __reg2 = this.viewList[_viewIndex];
		__reg2.destroy();
		this.viewIndex = 0;
		this.getCurrentView(_viewIndex).__set__index(0);
	}

	function displayView(_viewIndex, _itemIndex)
	{
		var __reg2 = this.viewList[_viewIndex];
		__reg2.viewIndex = _viewIndex;
		__reg2.displayView();
	}

	function focusView(_viewIndex, clearOtherViews)
	{
		if (clearOtherViews)
		{
			var __reg2 = 0;
			while (__reg2 < this.viewList.length)
			{
				var __reg3 = this.viewList[__reg2];
				__reg3.__set__highlighted(__reg2 == _viewIndex);
				++__reg2;
			}
		}
		else
		{
			this.viewList[_viewIndex].highlighted = true;
		}
		this.viewIndex = _viewIndex;
	}

	function nextView()
	{
		var __reg2 = this.viewIndex + 1;
		if (__reg2 > this.viewList.length - 1)
		{
			__reg2 = 0;
		}
		this.setView(__reg2);
	}

	function prevView()
	{
		var __reg2 = this.viewIndex - 1;
		if (__reg2 < 0)
		{
			__reg2 = this.viewList.length - 1;
		}
		this.setView(__reg2);
	}

	function setView(_viewIndex)
	{
		this.viewIndex = _viewIndex;
		this.focusView(this.viewIndex,1);
	}

	function nextItem()
	{
		var __reg2 = this.getCurrentView();
		var __reg3 = __reg2.__get__index() + 1;
		if (__reg3 > __reg2.__get__maxitems() - 1)
		{
			__reg3 = 0;
		}
		this.setItem(__reg2,__reg3);
	}

	function prevItem()
	{
		var __reg2 = this.getCurrentView();
		var __reg3 = __reg2.__get__index() - 1;
		if (__reg3 < 0)
		{
			__reg3 = __reg2.__get__maxitems() - 1;
		}
		this.setItem(__reg2,__reg3);
	}

	function setItem(_currentView, _itemIndex)
	{
		_currentView.__set__index(_itemIndex);
		if (this.__get__scrollBar() != undefined)
		{
			if (_itemIndex < _currentView.__get__maxitems() - _currentView.visibleItems + 1)
			{
				this.__get__scrollBar().__set__scrollpercent(100 * (_itemIndex / _currentView.__get__maxitems()));
				return;
			}
			this.__get__scrollBar().__set__scrollpercent(100 * ((_currentView.__get__maxitems() - _currentView.visibleItems) / _currentView.__get__maxitems()));
		}
	}

}