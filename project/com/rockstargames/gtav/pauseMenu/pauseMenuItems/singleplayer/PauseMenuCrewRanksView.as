class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewRanksView extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuViewBase
{
   var titleHeight = 25;
   function PauseMenuCrewRanksView()
   {
      super();
   }
   function addDisplayItem(i, _dataArray)
   {
      var _loc4_ = this.viewLinkageList[0];
      var _loc3_ = this.viewContainer.attachMovie(_loc4_,_loc4_ + i + "MC",i);
      _loc3_._y = this.itemY;
      var _loc2_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewRankItem)_loc3_;
      _loc2_.__set__data(_dataArray);
      this.itemList[i] = _loc2_;
      this.itemY = this.itemY + (_loc2_.bgMC._height + this.rowSpacing);
   }
   function __set__params(_p)
   {
      super.__set__params(_p);
      if(_p.titleHeight != undefined)
      {
         this.titleHeight = _p.titleHeight;
      }
      return this.__get__params();
   }
}
