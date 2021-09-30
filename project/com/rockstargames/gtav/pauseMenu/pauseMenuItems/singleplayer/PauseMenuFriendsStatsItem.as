class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFriendsStatsItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
   function PauseMenuFriendsStatsItem()
   {
      super();
      this.medalMC._visible = false;
      this.itemTextRight = this.labelMC.valueTF;
   }
   function __set__data(_d)
   {
      super.__set__data(_d);
      if(this.__get__data()[1] != undefined && this.__get__data()[1] != "")
      {
         com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextRight,this.__get__data()[1],true);
      }
      if(this.initialIndex == 0)
      {
         this.bgMC._visible = false;
      }
      this.snapBGGrid(this.bgMC);
      var _loc3_ = com.rockstargames.gtav.constants.PauseMenuColoursLUT.BLACK_ALPHA_30;
      com.rockstargames.ui.utils.Colour.Colourise(this.bgMC,_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4]);
      return this.__get__data();
   }
   function __set__highlighted(_h)
   {
      var _loc2_ = com.rockstargames.gtav.constants.PauseMenuColoursLUT.WHITE;
      if(_h)
      {
         var _loc3_ = com.rockstargames.gtav.constants.PauseMenuColoursLUT.BLACK;
         com.rockstargames.ui.utils.Colour.Colourise(this.labelMC,_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4]);
         com.rockstargames.ui.utils.Colour.Colourise(this.bgMC,_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4]);
      }
      else
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.labelMC,_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4]);
         var _loc4_ = com.rockstargames.gtav.constants.PauseMenuColoursLUT.BLACK_ALPHA_30;
         com.rockstargames.ui.utils.Colour.Colourise(this.bgMC,_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4]);
      }
      this._highlighted = _h;
      return this.__get__highlighted();
   }
}
