class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuReplayListItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuVerticalListItem
{
   function PauseMenuReplayListItem()
   {
      super();
      this.iconMC._visible = false;
   }
   function __set__data(_d)
   {
      super.__set__data(_d);
      switch(this.type)
      {
         case 1:
            this.multiListItems = this.__get__data().slice(1);
            com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextLeft,this._data[0]);
            this.__set__textIndex(this.initialIndex);
            this.iconMC._visible = false;
            break;
         case 3:
            var _loc3_ = new com.rockstargames.ui.utils.HudColour();
            com.rockstargames.ui.utils.Colour.setHudColour(this.__get__data()[1],_loc3_);
            if(this.iconMC != undefined)
            {
               com.rockstargames.ui.utils.Colour.Colourise(this.iconMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
               this.iconMC._visible = true;
            }
            break;
         default:
            this.iconMC._visible = false;
      }
      return this.__get__data();
   }
}
