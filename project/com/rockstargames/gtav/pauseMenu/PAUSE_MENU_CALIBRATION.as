class com.rockstargames.gtav.pauseMenu.PAUSE_MENU_CALIBRATION extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   function PAUSE_MENU_CALIBRATION()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.SET_BUTTONS();
   }
   function SET_ARROW_ALPHA(arrowID, a)
   {
      var _loc4_ = [this.CONTENT.lArrowMC,this.CONTENT.rArrowMC];
      var _loc2_ = _loc4_[arrowID];
      if(_loc2_ != undefined)
      {
         var _loc3_ = Math.max(0,Math.min(a,100));
         _loc2_._alpha = _loc3_;
      }
   }
   function SET_BUTTONS()
   {
      var _loc2_ = this.CONTENT.attachMovie("mouseButton","mouseButtonL",this.CONTENT.getNextHighestDepth(),{_x:445,_y:455,_width:34,_height:47});
      var _loc3_ = this.CONTENT.attachMovie("mouseButton","mouseButtonR",this.CONTENT.getNextHighestDepth(),{_x:798,_y:455,_width:34,_height:47});
      (com.rockstargames.ui.mouse.MouseBtn)_loc2_.setupGenericMouseInterface(0,0,this.onMouseEvent,[this.CONTENT.lArrowMC]);
      (com.rockstargames.ui.mouse.MouseBtn)_loc3_.setupGenericMouseInterface(1,0,this.onMouseEvent,[this.CONTENT.rArrowMC]);
   }
   function onMouseEvent(evtType, targetMC, args)
   {
      var _loc1_ = args[0];
      switch(evtType)
      {
         case com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_RELEASE:
            _loc1_._yscale = _loc0_ = 75;
            _loc1_._xscale = _loc0_;
            com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc1_,0.05,{_xscale:100,_yscale:100});
            break;
         case com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_ROLL_OUT:
            _loc1_._yscale = _loc0_ = 100;
            _loc1_._xscale = _loc0_;
            break;
         case com.rockstargames.ui.mouse.MOUSE_EVENTS.MOUSE_ROLL_OVER:
            _loc1_._yscale = _loc0_ = 110;
            _loc1_._xscale = _loc0_;
      }
   }
}
