class com.rockstargames.ui.core.ScreenLayoutManager
{
   var safearea = new Object();
   var screenRatioWide = 1;
   var screenRatioNonWide = 1.33333;
   var ratio = 1;
   var screenSize = 0;
   static var SAFE_ZONE_A = new Array(0,64,36);
   static var SAFE_ZONE_B = new Array(1,96,54);
   static var SAFE_ZONE_C = new Array(2,0,0);
   static var SCREEN_FORMAT_WIDE = 0;
   static var SCREEN_FORMAT_NON_WIDE = 1;
   function ScreenLayoutManager(_screenSize)
   {
      this.setSafeZone();
      this.screenSize = _screenSize;
   }
   function addToScreen(linkageID, instanceName, containerMC, position, onPixel)
   {
      var _loc3_ = containerMC.getNextHighestDepth();
      var _loc2_ = containerMC.attachMovie(linkageID,instanceName,_loc3_);
      var _loc4_ = _loc2_._width * this.ratio;
      var _loc6_ = _loc2_._height * this.ratio;
      _loc2_._width = _loc4_;
      this.positionToScreen(_loc2_,position,onPixel);
      return _loc2_;
   }
   function positionToScreen(mc, position, onPixel)
   {
      switch(position)
      {
         case "LT":
         case "xLT":
            mc._x = this.SL;
            mc._y = this.ST;
            break;
         case "RT":
            mc._x = this.__get__SR() - mc._width;
            mc._y = this.ST;
            break;
         case "LB":
            mc._x = this.SL;
            mc._y = this.__get__SB() - mc._height;
            break;
         case "RB":
            mc._x = this.__get__SR() - mc._width;
            mc._y = this.__get__SB() - mc._height;
            break;
         case "CC":
            mc._x = (this.__get__SR() + this.safearea.width) * 0.5 - mc._width * 0.5;
            mc._y = (this.__get__SB() + this.safearea.height) * 0.5 - mc._height * 0.5;
            break;
         case "CB":
            mc._x = (this.__get__SR() + this.safearea.width) * 0.5 - mc._width * 0.5;
            mc._y = this.__get__SB() - mc._height;
            break;
         case "CT":
            mc._x = (this.__get__SR() + this.safearea.width) * 0.5 - mc._width * 0.5;
            mc._y = this.ST;
            break;
         case "xRT":
            mc._x = this.SR;
            mc._y = this.ST;
            break;
         case "xLB":
            mc._x = this.SL;
            mc._y = this.SB;
            break;
         case "xRB":
            mc._x = this.SR;
            mc._y = this.SB;
            break;
         case "xCC":
            mc._x = (this.__get__SR() + this.safearea.width) * 0.5;
            mc._y = (this.__get__SB() + this.safearea.height) * 0.5;
            break;
         case "xCB":
            mc._x = (this.__get__SR() + this.safearea.width) * 0.5;
            mc._y = this.SB;
            break;
         case "xCT":
            mc._x = (this.__get__SR() + this.safearea.width) * 0.5;
            mc._y = this.ST;
      }
      if(onPixel)
      {
         mc._x = Math.round(mc._x);
         mc._y = Math.round(mc._y);
      }
   }
   function setRatio(ratioEnum)
   {
      switch(ratioEnum)
      {
         case com.rockstargames.ui.core.ScreenLayoutManager.SCREEN_FORMAT_WIDE:
            this.ratio = this.screenRatioWide;
            break;
         case com.rockstargames.ui.core.ScreenLayoutManager.SCREEN_FORMAT_NON_WIDE:
            this.ratio = this.screenRatioNonWide;
      }
   }
   function setSafeZone()
   {
      var _loc3_ = arguments[0];
      switch(Number(_loc3_[0]))
      {
         case com.rockstargames.ui.core.ScreenLayoutManager.SAFE_ZONE_A[0]:
            this.safearea.width = com.rockstargames.ui.core.ScreenLayoutManager.SAFE_ZONE_A[1];
            this.safearea.height = com.rockstargames.ui.core.ScreenLayoutManager.SAFE_ZONE_A[2];
            break;
         case com.rockstargames.ui.core.ScreenLayoutManager.SAFE_ZONE_B[0]:
            this.safearea.width = com.rockstargames.ui.core.ScreenLayoutManager.SAFE_ZONE_B[1];
            this.safearea.height = com.rockstargames.ui.core.ScreenLayoutManager.SAFE_ZONE_B[2];
            break;
         case com.rockstargames.ui.core.ScreenLayoutManager.SAFE_ZONE_C[0]:
            this.safearea.width = _loc3_[1];
            this.safearea.height = _loc3_[2];
            break;
         default:
            this.safearea.width = 0;
            this.safearea.height = 0;
      }
   }
   function __get__ST()
   {
      return 0 + this.safearea.height;
   }
   function __get__SB()
   {
      return 720 - this.safearea.height;
   }
   function __get__SR()
   {
      return 1280 - this.safearea.width;
   }
   function __get__SL()
   {
      return 0 + this.safearea.width;
   }
}
