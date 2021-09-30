class com.rockstargames.gtav.pauseMenu.pauseComponents.MP_CORONA_PLAYER_INFO extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
   function MP_CORONA_PLAYER_INFO()
   {
      super();
      this.dbgID = "MP_CORONA_PLAYER_INFO";
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
      this.model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuCoronaPlayerInfoModel();
      this.model.createView(0,{id:0,x:0,y:0,container:this.CONTENT,linkage:["playerInfoItem"],visibleItems:16});
   }
   function SHOW_COLUMN(bool)
   {
      super.SHOW_COLUMN(true);
   }
   function setColumnDependent(columnMC)
   {
      this.dependentColumnMC = columnMC;
   }
   function DISPLAY_VIEW(viewIndex, itemIndex)
   {
      super.DISPLAY_VIEW.apply(this,arguments);
      this.checkForCollisions();
   }
   function UPDATE_SLOT(_viewIndex, _slotIndex)
   {
      super.UPDATE_SLOT.apply(this,arguments);
      this.checkCollisionAgainst(this.model.getCurrentView().itemList[_viewIndex]);
   }
   function onDisplayUpdate()
   {
      this.checkForCollisions();
   }
   function checkForCollisions()
   {
      var _loc3_ = this.model.getCurrentView().itemList;
      var _loc4_ = _loc3_.length;
      var _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         this.checkCollisionAgainst(_loc3_[_loc2_]);
         _loc2_ = _loc2_ + 1;
      }
   }
   function checkCollisionAgainst(itemMC)
   {
      itemMC._visible = itemMC.getLeftPosition() >= 288 || itemMC._y >= this.dependentColumnMC.getVisibleHeight();
      if(!itemMC._visible)
      {
         com.rockstargames.ui.utils.Debug.log("Hiding Player Info Item: x:" + itemMC.getLeftPosition() + ", y:" + itemMC._y);
      }
   }
}
