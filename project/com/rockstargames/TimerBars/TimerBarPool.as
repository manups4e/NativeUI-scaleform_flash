class com.rockstargames.TimerBars.TimerBarPool
{
	var CONTENT;
	var _ibDrawing;
	var Bars;
	var totalBars = 0;
	function TimerBarPool(mc)
	{
		this.CONTENT = mc;
		this._ibDrawing = false;
		this.Bars = new Array();
		this.totalBars = 0;
	}

	function AddTimerBar(id, param0, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12, param13)
	{
		var bar = new com.rockstargames.TimerBars.TimerBar(this.CONTENT, id, param0, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12, param13);
		this.totalBars = this.Bars.push(bar);
		this.updateItemsDrawing();
	}

	function updateItemsDrawing()
	{
		for (var bar in this.Bars)
		{
			this.Bars[bar].itemMC._y = 720 - (bar * 27.55) - (_ibDrawing ? 27.55 : 0);
			this.Bars[bar].itemMC._x = 1280 - this.Bars[bar].itemMC._width;
		}
	}

	function set IbDrawing(bool)
	{
		this._ibDrawing = bool;
		this.updateItemsDrawing();
	}
	function get IbDrawing()
	{
		return this._ibDrawing;
	}

	function Clear()
	{
		for (var bar in this.Bars)
		{
			this.Bars[bar].itemMC.removeMovieClip();
		}
		this.Bars = new Array();
		this.totalBars = 0;
	}
}