class com.rockstargames.ui.utils.DisplayConfig
{
    var isAsian;
    var isCircleAccept;
    var isHiDef;
    var isWideScreen;
    var safeBottom;
    var safeLeft;
    var safeRight;
    var safeTop;
    var screenHeight;
    var screenWidth;
	var actualWidth;
	var actualHeight;

	function DisplayConfig()
	{
		this.screenWidth = 1280;
		this.screenHeight = 720;
		this.safeTop = 0.05;
		this.safeBottom = 0.95;
		this.safeLeft = 0.05;
		this.safeRight = 0.95;
		this.isWideScreen = true;
		this.isCircleAccept = false;
		this.isHiDef = true;
		this.isAsian = false;
		this.actualWidth = 1280;
		this.actualHeight = 720;
	}
}