class com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuMissionHelpListItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuTextListItem
{
   function PauseMenuMissionHelpListItem()
   {
      super();
   }
   function mInit()
   {
   }
   function __set__data(_d)
   {
      this.index = _d[0];
      this.menuID = _d[1];
      this.uniqueID = _d[2];
      this.type = _d[3];
      this.initialIndex = _d[4];
      this.isSelectable = _d[5];
      if(_d.length >= 7)
      {
         this._data = _d.slice(6);
      }
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.labelMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      this.bgMC._visible = false;
      if(this.blipLayer != undefined)
      {
         this.blipLayer.removeMovieClip();
      }
      this.blipLayer = this.labelMC.createEmptyMovieClip("blipLayer",1000);
      this.itemTextLeft.autoSize = true;
      var _loc3_ = new com.rockstargames.ui.utils.Text();
      _loc3_.setTextWithIcons(this._data[0],this.blipLayer,this.itemTextLeft,0,13,3,false);
      this.snapBGGrid(this.bgMC);
      return this.__get__data();
   }
   function snapBGGrid(bgMC)
   {
      var _loc2_ = this.labelMC._y + this.itemTextLeft.textHeight;
      bgMC._height = _loc2_;
   }
}
