dynamic class com.rockstargames.ui.mouse.MouseBtn extends MovieClip implements com.rockstargames.ui.mouse.MouseBtnInterface
{
    var optionalMouseArgs = new Array();
    var _isMouseEnabled: Boolean = true;
    var MOUSE_EVT;
    var callback;
    var callbackArgs;

	function MouseBtn()
	{
		super();
		this.MOUSE_EVT = new com.rockstargames.ui.mouse.MOUSE_EVENTS();
		this.init();
	}
	function setupMouseInterface(_uiID, _interfaceID, _optionalMouseArgs)
	{
		if (_uiID != undefined)
		{
			this.MOUSE_EVT.UI_MOVIE = _uiID;
		}
		if (_interfaceID != undefined)
		{
			this.MOUSE_EVT.INTERFACE_TYPE = _interfaceID;
		}
		if (_optionalMouseArgs != undefined)
		{
			this.optionalMouseArgs = _optionalMouseArgs;
		}
	}
	function setupGenericMouseInterface(_itemID, _itemContext, _callback, _callbackArgs)
	{
		if (_itemContext == undefined)
		{
			_itemContext = -1;
		}
		this.setupMouseInterface(com.rockstargames.ui.mouse.MOUSE_EVENTS.UI_MOVIE_GENERIC,this.MOUSE_EVT.SF_BASE_CLASS_MOUSE,[_itemID, _itemContext]);
		if (_callback)
		{
			this.callback = _callback;
			if (_callbackArgs)
			{
				this.callbackArgs = _callbackArgs;
			}
		}
	}
	function set isMouseEnabled(b)
	{
		this._isMouseEnabled = b;
	}
	function get isMouseEnabled()
	{
		return this._isMouseEnabled;
	}
	function init()
	{
		this.onRollOver = com.rockstargames.ui.utils.DelegateStar.create(this, this.sendMouseEvent, com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_ROLL_OVER);
		this.onRollOut = com.rockstargames.ui.utils.DelegateStar.create(this, this.sendMouseEvent, com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_ROLL_OUT);
		this.onDragOver = com.rockstargames.ui.utils.DelegateStar.create(this, this.sendMouseEvent, com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_DRAG_OVER);
		this.onDragOut = com.rockstargames.ui.utils.DelegateStar.create(this, this.sendMouseEvent, com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_DRAG_OUT);
		this.onPress = com.rockstargames.ui.utils.DelegateStar.create(this, this.sendMouseEvent, com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_PRESS);
		this.onRelease = com.rockstargames.ui.utils.DelegateStar.create(this, this.sendMouseEvent, com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_RELEASE);
		this.onReleaseOutside = com.rockstargames.ui.utils.DelegateStar.create(this, this.sendMouseEvent, com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_RELEASE_OUTSIDE);
	}
	function sendMouseEvent(id)
	{
		var _loc4_ = [id, this._name];
		var _loc3_ = this.optionalMouseArgs.length;
		if (_loc3_ > 0)
		{
			for (var _loc2_ in this.optionalMouseArgs)
			{
				_loc4_.push(this.optionalMouseArgs[_loc2_]);
			}
		}
		if (com.rockstargames.gtav.levelDesign.SCALEFORMUI.MouseEnabled)
		{
			if (this.callback)
			{
				this.callback.apply(this,[id, this, this.callbackArgs]);
			}
			this.MOUSE_EVT.triggerEvent(_loc4_);
		}
	}
	function dispose()
	{
		if (this.onRollOver)
		{
			delete this.onRollOver;
			delete this.onRollOut;
			delete this.onDragOver;
			delete this.onDragOut;
			delete this.onPress;
			delete this.onRelease;
			delete this.onReleaseOutside;
		}
	}
}