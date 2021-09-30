class com.rockstargames.ui.core.BaseComponentInfo
{
	var _enumId;
	var _status;
	var _listener;
	var _functionCache;
	var _intendedVisibleState;
	var _displayList;
	var _displayListPriority;
	var _mc;
	var _hasGfx;
	var _position;
	var _size;
	var _colour;
	var _loader;

	function BaseComponentInfo(newID)
	{
		this._enumId = newID;
		this._status = 0;
		this._listener = {};
		this._functionCache = [];
		this._position = [];
		this._size = [];
		this._colour = [];
		this._intendedVisibleState = true;
		this._displayList = -1;
		this._displayListPriority = -1;
		this._mc = new MovieClip();
		this._loader = new MovieClipLoader();
		this._hasGfx = true;
	}
	function sanitise()
	{
		this._mc = new MovieClip();
		this._status = 0;
		this._listener = {};
		this._displayList = -1;
		this._displayListPriority = -1;
		this._position = [];
		this._size = [];
		this._colour = [];
		this._functionCache = [];
		this._hasGfx = true;
	}
}