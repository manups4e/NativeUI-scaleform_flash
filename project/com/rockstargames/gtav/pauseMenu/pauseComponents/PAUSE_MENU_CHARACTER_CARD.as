class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_CHARACTER_CARD extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
   function PAUSE_MENU_CHARACTER_CARD()
   {
      super();
      this.dbgID = "PAUSE_MENU_CHARACTER_CARD";
      _global.gfxExtensions = true;
   }
   function INITIALISE(mc)
   {
      if(mc != undefined)
      {
         super.INITIALISE(mc);
      }
      else
      {
         this.CONTENT = this;
      }
      this.SET_FOCUS(false);
      var _loc4_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc4_);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.statsMC.statsBG,_loc4_.r,_loc4_.g,_loc4_.b,_loc4_.a);
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc3_);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.statsMC.statsLabelContainer,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      this.hudColorEnum = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE;
      this.highlightBitmask = new com.rockstargames.ui.utils.BitMask();
      this.CONTENT.statsMC._visible = false;
      this.model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuHeritageCardModel();
      this.model.createView(0,{id:0,x:0,y:405,rowSpacing:2,columnSpacing:0,container:this.CONTENT,linkage:["heritageCardItem"],visibleItems:1,selectstyle:com.rockstargames.ui.components.GUIView.SCROLL_SELECTSTYLE});
   }
   function RESIZE_BG(i)
   {
      var _loc3_ = 2;
      var _loc2_ = 430 - i - _loc3_;
      this.CONTENT.statsMC.statsBG._height = _loc2_;
      this.CONTENT.statsMC.statsBG._y = 430 - _loc2_ - 243;
   }
   function SET_TITLE(str)
   {
      if(arguments[1] != undefined)
      {
         this.hudColorEnum = arguments[1];
      }
      var _loc10_ = arguments[2];
      var _loc9_ = 243;
      if(_loc10_ == true)
      {
         _loc9_ = 243;
      }
      this.CONTENT.statsMC._y = _loc9_;
      var _loc7_ = 3;
      var _loc8_ = 10;
      var _loc3_ = _loc7_;
      while(_loc3_ < arguments.length)
      {
         var _loc4_ = this.CONTENT.statsMC.statsLabelContainer["stat" + (_loc3_ - _loc7_)];
         if(_loc4_ != undefined)
         {
            com.rockstargames.ui.utils.UIText.setSizedText(_loc4_,arguments[_loc3_],true);
            var _loc6_ = true;
            var _loc5_ = _loc8_ - _loc7_ + _loc3_;
            if(arguments[_loc5_] != undefined)
            {
               _loc6_ = arguments[_loc5_];
            }
            _loc4_._alpha = _loc6_ != false?100:30;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function SET_DESCRIPTION(bitmask)
   {
      this.highlightBitmask.__set__bitfield(bitmask == undefined?0:bitmask);
      if(bitmask != undefined)
      {
         var _loc3_ = 0;
         while(_loc3_ < arguments.length - 1)
         {
            var _loc4_ = this.CONTENT.statsMC["statBarN" + _loc3_];
            if(_loc4_ != undefined)
            {
               _loc4_.init(this.hudColorEnum,123);
               var _loc6_ = arguments[_loc3_ + 1] * 100;
               var _loc5_ = com.rockstargames.gtav.utils.GTAVUIUtils.getAdjustedSegmentPct(_loc6_,23,2,5);
               _loc4_.percent(_loc5_,false);
            }
            _loc3_ = _loc3_ + 1;
         }
         if(!this.CONTENT.statsMC._visible)
         {
            this.CONTENT.statsMC._visible = true;
         }
      }
      else
      {
         this.CONTENT.statsMC._visible = false;
      }
   }
}
