class com.rockstargames.ui.mouse.MOUSE_EVENTS
{
	static var MOUSE_DRAG_OUT:Number = 0;
	static var MOUSE_DRAG_OVER:Number = 1;
	static var MOUSE_DOWN:Number = 2;
	static var MOUSE_MOVE:Number = 3;
	static var MOUSE_UP:Number = 4;
	static var MOUSE_PRESS:Number = 5;
	static var MOUSE_RELEASE:Number = 6;
	static var MOUSE_RELEASE_OUTSIDE:Number = 7;
	static var MOUSE_ROLL_OUT:Number = 8;
	static var MOUSE_ROLL_OVER:Number = 9;
	static var MOUSE_WHEEL_UP:Number = 10;
	static var MOUSE_WHEEL_DOWN:Number = 11;
	static var UI_MOVIE_VIDEO_EDITOR:Number = 0;
	static var UI_MOVIE_ONLINE_POLICY:Number = 1;
	static var UI_MOVIE_INSTRUCTIONAL_BUTTONS:Number = 2;
	static var UI_MOVIE_REPORT_MENU:Number = 3;
	static var UI_MOVIE_GENERIC:Number = 4;
	var SF_BASE_CLASS_MOUSE:Number = 10;
	var DEFAULT_BUTTON_TYPE:Number = 0;
	var _ui_movie:Number = -1;
	var _interfaceType:Number = -1;

	function MOUSE_EVENTS()
	{
		this.INTERFACE_TYPE(this.SF_BASE_CLASS_MOUSE);
	}

	function set UI_MOVIE(uiMovie)
	{
		this._ui_movie = uiMovie;
	}

	function get UI_MOVIE()
	{
		return this._ui_movie;
	}

	function set INTERFACE_TYPE(iType)
	{
		this._interfaceType = iType;
	}

	function get INTERFACE_TYPE()
	{
		return this._interfaceType;
	}

	function triggerEvent(params)
	{
		params.unshift("MOUSE_EVENT",this.INTERFACE_TYPE(),this.UI_MOVIE());
		flash.external.ExternalInterface.call.apply(null,params);
	}
}