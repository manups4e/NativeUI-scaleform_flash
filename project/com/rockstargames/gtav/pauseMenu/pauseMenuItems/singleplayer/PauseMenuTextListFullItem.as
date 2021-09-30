class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuTextListFullItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
   function PauseMenuTextListFullItem()
   {
      super();
      this.mInit();
      this.itemTextLeft = this.labelMC.titleTF;
      this.itemTextRight = this.labelMC.valueTF;
      this.solidMC = this.bgMC.solidMC;
      this.gradMC = this.bgMC.gradMC;
      this.gradMC._visible = false;
   }
   function __set__data(_d)
   {
      super.__set__data(_d);
      if(this.__get__data()[1] != undefined && this.__get__data()[1] != "")
      {
         com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextRight,this.__get__data()[1]);
      }
      switch(this.type)
      {
         case 1:
            this.gradMC._visible = true;
            this.solidMC._visible = false;
            this.itemTextLeft._x = (this.bgMC._width - this.itemTextLeft._width) / 2 - this.labelMC._x;
            break;
         case 0:
         default:
            this.gradMC._visible = false;
            this.solidMC._visible = true;
            this.itemTextLeft._x = 10;
      }
      return this.__get__data();
   }
   function __set__highlighted(_h)
   {
      var _loc3_ = undefined;
      var _loc2_ = undefined;
      if(_h)
      {
         _loc3_ = com.rockstargames.gtav.constants.PauseMenuColoursLUT.WHITE;
         _loc2_ = com.rockstargames.gtav.constants.PauseMenuColoursLUT.BLACK;
      }
      else
      {
         _loc3_ = com.rockstargames.gtav.constants.PauseMenuColoursLUT.BLACK_ALPHA_50;
         if(this.isSelectable == 1)
         {
            _loc2_ = com.rockstargames.gtav.constants.PauseMenuColoursLUT.WHITE;
         }
         else
         {
            _loc2_ = com.rockstargames.gtav.constants.PauseMenuColoursLUT.GREYED;
         }
      }
      com.rockstargames.ui.utils.Colour.Colourise(this.bgMC,_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4]);
      com.rockstargames.ui.utils.Colour.Colourise(this.labelMC,_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4]);
      this._highlighted = _h;
      return this.__get__highlighted();
   }
   function snapBGGrid(bgMC)
   {
      var _loc2_ = Math.ceil(this.itemTextLeft.textHeight / 27);
      bgMC._height = _loc2_ * 27 - 2;
   }
}
