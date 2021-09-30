class com.rockstargames.gtav.utils.GRID_LAYOUT extends com.rockstargames.ui.core.UICanvas
{
	var CANVAS;
	function GRID_LAYOUT(mc)
	{
		super();
		_global.gfxExtensions = true;
	}
	function INITIALISE(mc)
	{
		super.INITIALISE(mc);
		this.CANVAS.addCanvasItem(this.CONTENT.detailsMC,4,4);
	}
	function SET_INFO(b)
	{
		this.CONTENT.detailsMC._visible = b;
	}
	function SET_SAFE(i)
	{
		this.CANVAS.setSafePercent(i);
		this.onStageResize();
	}
	function SET_SCALE(i)
	{
		this.CANVAS.setScale(i);
	}
}