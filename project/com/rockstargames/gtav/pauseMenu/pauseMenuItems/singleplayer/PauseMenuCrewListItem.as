class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewListItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
   static var AS_REGULAR = 0;
   static var AS_NOTIFICATION = 1;
   static var AS_CHECKBOX = 2;
   static var AS_DISABLED = 3;
   function PauseMenuCrewListItem()
   {
      super();
      this.itemTextLeft = this.labelMC.titleTF;
      this.itemTextLeft.textAutoSize = "shrink";
      this.setBgWidthLong(false);
   }
   function setBgWidthLong(b)
   {
      var _loc2_ = !b?288:578;
      this.bMC._width = _loc2_;
   }
   function __set__data(_d)
   {
      super.__set__data(_d);
      this.itemTextLeft._width = 277;
      switch(this.type)
      {
         case com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewListItem.AS_REGULAR:
         case com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewListItem.AS_DISABLED:
            if(this.notificationMC != undefined)
            {
               this.notificationMC.removeMovieClip();
               this.notificationMC = null;
            }
            if(this.tickBoxMC)
            {
               this.tickBoxMC.removeMovieClip();
               this.tickBoxMC = null;
            }
            break;
         case com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewListItem.AS_NOTIFICATION:
            if(this.tickBoxMC)
            {
               this.tickBoxMC.removeMovieClip();
               this.tickBoxMC = null;
            }
            if(this.initialIndex != 0)
            {
               if(this.notificationMC == undefined)
               {
                  this.notificationMC = this.attachMovie("crewsNotification","myNotice",this.getNextHighestDepth(),{_x:265,_y:4});
               }
               this.notificationMC.numTF.text = this.initialIndex;
               this.notificationMC.numTF.autoSize = "left";
               this.notificationMC.numTF.multiline = false;
               this.notificationMC.numTF.wordWrap = false;
               this.notificationMC.bgMC._width = this.notificationMC.numTF._width + 4;
               this.notificationMC._x = 288 - this.notificationMC.bgMC._width - 5;
            }
            else if(this.notificationMC != undefined)
            {
               this.notificationMC.removeMovieClip();
               this.notificationMC = null;
            }
            break;
         case com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewListItem.AS_CHECKBOX:
            if(this.notificationMC != undefined)
            {
               this.notificationMC.removeMovieClip();
               this.notificationMC = null;
            }
            if(Boolean(this.__get__data()[1]))
            {
               if(!this.tickBoxMC)
               {
                  this.tickBoxMC = this.attachMovie("tickBox","myTickBox",this.getNextHighestDepth(),{_x:273.5,_y:12.5});
               }
               this.tickBoxMC.tickMC._visible = Boolean(this.__get__data()[2]);
               this.itemTextLeft._width = 277 - this.tickBoxMC._width;
            }
            else if(this.tickBoxMC)
            {
               this.tickBoxMC.removeMovieClip();
               this.tickBoxMC = null;
            }
      }
      this.__set__highlighted(this._highlighted);
      return this.__get__data();
   }
   function __set__highlighted(_h)
   {
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      var _loc2_ = new com.rockstargames.ui.utils.HudColour();
      if(_h)
      {
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc3_);
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,_loc2_);
      }
      else
      {
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc3_);
         com.rockstargames.ui.utils.Colour.setHudColour(!(this.isSelectable || this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewListItem.AS_DISABLED)?com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREY:com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc2_);
      }
      if(this.bgMC)
      {
         if(this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewListItem.AS_DISABLED)
         {
            _loc3_.a = 20;
         }
         com.rockstargames.ui.utils.Colour.Colourise(this.bgMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      }
      if(this.labelMC)
      {
         if(this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewListItem.AS_DISABLED)
         {
            _loc2_.a = 50;
         }
         com.rockstargames.ui.utils.Colour.Colourise(this.labelMC,_loc2_.r,_loc2_.g,_loc2_.b,_loc2_.a);
      }
      if(this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewListItem.AS_CHECKBOX && this.tickBoxMC)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.tickBoxMC,_loc2_.r,_loc2_.g,_loc2_.b,_loc2_.a);
      }
      this._highlighted = _h;
      return this.__get__highlighted();
   }
   function mOver()
   {
      if(this.type != com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewListItem.AS_DISABLED)
      {
         _level0.TIMELINE.M_OVER_EVENT(this.index,this.__get__columnID(),this);
      }
   }
   function mOut()
   {
      if(this.type != com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewListItem.AS_DISABLED)
      {
         _level0.TIMELINE.M_OUT_EVENT(this.index,this.__get__columnID());
      }
   }
   function mPress()
   {
      if(this.type != com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewListItem.AS_DISABLED)
      {
         if(!this.__get__highlighted())
         {
            _level0.TIMELINE.M_PRESS_EVENT(this.index,this.__get__columnID(),false);
         }
         else
         {
            _level0.TIMELINE.M_PRESS_EVENT(this.index,this.__get__columnID(),true);
         }
      }
   }
}
