class com.rockstargames.ui.components.GUIController extends com.rockstargames.gtav.levelDesign.BaseScriptUI implements com.rockstargames.ui.components.IController
{
	var model;
	function GUIController()
	{
		super();
	}
	function GET_CURRENT_SELECTION()
	{
		return this.model.getCurrentSelection();
	}
	function SET_DATA_SLOT(_viewIndex, _slotIndex)
	{
		var _loc3_ = arguments.slice(2);
		this.model.addDataToView(_viewIndex,_slotIndex,_loc3_);
	}
	function UPDATE_DATA_SLOT(_viewIndex, _slotIndex)
	{
		var _loc3_ = arguments.slice(2);
		this.model.updateSlot(_viewIndex,_slotIndex,_loc3_);
	}
	function ADD_SLOT(_viewIndex, _slotIndex)
	{
		var _loc3_ = arguments.slice(2);
		this.model.addSlot(_viewIndex,_slotIndex,_loc3_);
	}
	function SET_DATA_SLOT_EMPTY(viewIndex, itemIndex)
	{
		this.model.removeDataFromSlot(viewIndex,itemIndex);
	}
	function DISPLAY_VIEW(viewIndex, itemIndex)
	{
		if (itemIndex == undefined)
		{
			itemIndex = 0;
		}
		this.model.displayView(viewIndex,itemIndex);
	}
	function FOCUS_VIEW(viewIndex, clearOtherViews)
	{
		if (clearOtherViews == undefined)
		{
			clearOtherViews = 1;
		}
		this.model.focusView(viewIndex,clearOtherViews);
	}
	function SET_INPUT_EVENT(direction)
	{
		switch (direction)
		{
			case com.rockstargames.ui.game.GamePadConstants.DPADUP :
				this.model.prevItem();
				break;
			case com.rockstargames.ui.game.GamePadConstants.DPADRIGHT :
				this.model.nextView();
				break;
			case com.rockstargames.ui.game.GamePadConstants.DPADDOWN :
				this.model.nextItem();
				break;
			case com.rockstargames.ui.game.GamePadConstants.DPADLEFT :
				this.model.prevView();
		}
	}
}