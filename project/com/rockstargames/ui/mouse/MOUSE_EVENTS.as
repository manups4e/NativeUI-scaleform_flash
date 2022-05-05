class com.rockstargames.ui.mouse.MOUSE_EVENTS
{
	static var MOUSE_DRAG_OUT = 0;
	static var MOUSE_DRAG_OVER = 1;
	static var MOUSE_DOWN = 2;
	static var MOUSE_MOVE = 3;
	static var MOUSE_UP = 4;
	static var MOUSE_PRESS = 5;
	static var MOUSE_RELEASE = 6;
	static var MOUSE_RELEASE_OUTSIDE = 7;
	static var MOUSE_ROLL_OUT = 8;
	static var MOUSE_ROLL_OVER = 9;
	static var MOUSE_WHEEL_UP = 10;
	static var MOUSE_WHEEL_DOWN = 11;
	static var UI_MOVIE_VIDEO_EDITOR = 0;
	static var UI_MOVIE_ONLINE_POLICY = 1;
	static var UI_MOVIE_INSTRUCTIONAL_BUTTONS = 2;
	static var UI_MOVIE_REPORT_MENU = 3;
	static var UI_MOVIE_GENERIC = 4;
	var SF_BASE_CLASS_MOUSE = 10;
	var DEFAULT_BUTTON_TYPE = 0;
	var _ui_movie = -1;
	var _interfaceType = -1;

	function MOUSE_EVENTS()
	{
		this.INTERFACE_TYPE = this.SF_BASE_CLASS_MOUSE;
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
		params.unshift("MOUSE_EVENT",this.INTERFACE_TYPE,this.UI_MOVIE);
		flash.external.ExternalInterface.call.apply(null,params);
	}
}