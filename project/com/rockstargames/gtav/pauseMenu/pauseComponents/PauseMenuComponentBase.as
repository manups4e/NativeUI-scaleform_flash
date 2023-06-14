class com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase extends com.rockstargames.ui.components.GUIController
{
	var titleHeight:Number = 27;
	var preloadTxds:Boolean = false;
	var _columnID:Number = -1;
	var columnIsFocused:Boolean = false;
	var dbgID:String = "";
	var dbgOn:Boolean = false;
	var canJump:Boolean = true;
	var canWheelScroll:Boolean = false;
	var canMouseNav:Boolean = false;
	var footerScrollOverrideIndex:Number = -1;
	var CONTENT;
	var model;
	var scrollBase;

	function PauseMenuComponentBase()
	{
		super();
	}

	function dbg(dbgStr)
	{
		if (this.dbgOn)
		{
			com.rockstargames.ui.utils.Debug.log("*** SCALEFORM | " + this.dbgID + " : " + dbgStr);
		}
	}

	function debug()
	{
	}

	function set columnID(_cID)
	{
		com.rockstargames.ui.utils.Debug.log("SET INDUVIDUAL COLUMNID to: " + _cID);
		this._columnID = _cID;
		this.setScrollColumnID();
	}

	function get columnID()
	{
		return this._columnID;
	}

	function SET_DATA_SLOT(_viewIndex, _slotIndex)
	{
		this.model.addDataToView(0,_viewIndex,arguments);
		if (this.scrollBase != undefined)
		{
			this.scrollBase.updateScroll();
		}
	}

	function SET_DATA_SLOT_EMPTY(viewIndex, itemIndex)
	{
		super.SET_DATA_SLOT_EMPTY(viewIndex,itemIndex);
		this.model.getCurrentView().topEdge = 0;
		if (this.scrollBase != undefined)
		{
			this.scrollBase.updateScroll();
		}
	}

	function ADD_SLOT(_viewIndex, _slotIndex)
	{
		this.model.addSlot(0,_viewIndex,arguments);
		if (this.scrollBase != undefined)
		{
			this.scrollBase.updateScroll();
		}
	}

	function UPDATE_SLOT(_viewIndex, _slotIndex)
	{
		this.model.updateSlot(0,_viewIndex,arguments);
		if (this.scrollBase != undefined)
		{
			this.scrollBase.updateScroll();
		}
	}

	function CLEAR_HIGHLIGHT()
	{
		this.model.getCurrentView().highlightedItem = 0;
		this.model.getCurrentView().topEdge = 0;
		this.model.getCurrentView().index = 0;
	}

	function SHOW_COLUMN(bool)
	{
		this.CONTENT._visible = bool;
		if (this.scrollBase != undefined)
		{
			this.scrollBase.updateScroll();
		}
	}

	function SET_COLUMN_CAN_JUMP(b)
	{
		this.canJump = b;
	}

	function ON_FOCUS_PAGE_CONTENT(bFocused)
	{
	}

	function SET_TITLE(str)
	{
	}

	function SET_DESCRIPTION()
	{
	}

	function SET_HIGHLIGHT(i)
	{
	}

	function SET_STATE(i)
	{
	}

	function SET_FOCUS(isFocused)
	{
		this.columnIsFocused = isFocused;
		com.rockstargames.ui.utils.Debug.log("COLUMN SET FOCUS columnID: " + this.columnID + " = SET isFocused to: " + isFocused);
		this.SEND_COLUMN_PARAMS();
		var __reg4 = this.model.getCurrentView().itemList;
		var __reg2 = 0;
		while (__reg2 < __reg4.length)
		{
			var __reg3 = __reg4[__reg2];
			__reg3.highlighted = isFocused ? this.model.getCurrentView().highlightedItem == __reg2 : false;
			++__reg2;
		}
		if (this.scrollBase != undefined)
		{
			this.scrollBase.updateScroll();
			this.scrollBase._visible = isFocused && this.scrollBase.displayEnabled();
		}
	}

	function SEND_COLUMN_PARAMS()
	{
		var __reg4 = this.model.getCurrentView().itemList;
		com.rockstargames.ui.utils.Debug.log(" ====== SEND_COLUMN_PARAMS: items: " + __reg4.length);
		var __reg2 = 0;
		while (__reg2 < __reg4.length)
		{
			var __reg3 = __reg4[__reg2];
			__reg3.columnID = this.columnID;
			com.rockstargames.ui.utils.Debug.log(__reg2 + "  " + __reg3 + " = SET COLUMNID to: " + __reg3.columnID);
			++__reg2;
		}
		this.setScrollColumnID();
	}

	function setScrollColumnID()
	{
		if (this.scrollBase != undefined)
		{
			if (this.footerScrollOverrideIndex > 0)
			{
				this.scrollBase.setColumnID(this.footerScrollOverrideIndex);
				return;
			}
			this.scrollBase.setColumnID(this.columnID);
		}
	}

	function INIT_SCROLL_BAR(visible, columns, scrollType, arrowPosition, override, xColOffset)
	{
		if (this.scrollBase == undefined)
		{
			this.scrollBase = com.rockstargames.gtav.pauseMenu.pauseComponents.PM_ScrollBase(this.CONTENT.attachMovie("PM_ScrollBase", "scrollBase", this.CONTENT.getNextHighestDepth()));
		}
		if (!override)
		{
			this.scrollBase.setComponent(this);
		}
		this.scrollBase.INIT_SCROLL_BAR(visible,columns,scrollType,arrowPosition,override,xColOffset);
		this.setScrollColumnID();
	}

	function SET_SCROLL_BAR(currentPosition, maxPosition, maxVisible, caption)
	{
		if (this.scrollBase != undefined)
		{
			this.scrollBase.SET_SCROLL_BAR.apply(this.scrollBase,arguments);
		}
	}

	function getTxdData()
	{
		var __reg1 = undefined;
		return __reg1;
	}

	function SET_INPUT_EVENT(direction)
	{
		super.SET_INPUT_EVENT(direction);
		if (this.scrollBase != undefined)
		{
			this.scrollBase.updateScroll();
		}
	}

	function ON_DESTROY()
	{
	}

	function onDisplayUpdate()
	{
	}

}