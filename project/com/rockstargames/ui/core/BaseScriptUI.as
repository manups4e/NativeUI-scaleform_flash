class com.rockstargames.ui.core.BaseScriptUI extends MovieClip
{

	var BOUNDING_BOX;
	var CONTENT;
	var TIMELINE;
	var _isWideScreen;
	
	function BaseScriptUI()
	{
		super();
	}
	function INITIALISE(mc)
	{
		this.TIMELINE = mc;
		this.CONTENT = this.TIMELINE.attachMovie("CONTENT", "CONTENT", this.TIMELINE.getNextHighestDepth());
		this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX", "BOUNDING_BOX", this.TIMELINE.getNextHighestDepth());
		this.BOUNDING_BOX._visible = false;
	}
	function SET_WIDESCREEN(isWideScreen)
	{
		this._isWideScreen = isWideScreen;
	}
}