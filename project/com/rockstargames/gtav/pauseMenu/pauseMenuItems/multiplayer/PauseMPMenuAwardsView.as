class com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuAwardsView extends com.rockstargames.ui.components.GUIView
{
   var batchW = 0;
   var batchH = 106;
   var batchCols = 3;
   var batchRows = 2;
   function PauseMPMenuAwardsView()
   {
      super();
   }
   function __set__params(_p)
   {
      super.__set__params(_p);
      this.container = _p.container;
      this.batchCols = _p.batchCols;
      this.batchRows = _p.batchRows;
      this.batchW = _p.batchW;
      var _loc5_ = this.container.descMC.colWhiteMC;
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc3_);
      if(_loc5_ != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(_loc5_,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      }
      return this.__get__params();
   }
   function addDisplayItem(i, _dataArray)
   {
      var _loc5_ = this.viewLinkageList[0];
      var _loc2_ = this.viewContainer.attachMovie(_loc5_,"a" + i + "MC",i);
      var _loc7_ = i % this.batchCols * (this.batchW + this.rowSpacing);
      var _loc6_ = Math.floor(i / this.batchCols) * (this.batchH + this.columnSpacing);
      _loc2_._x = _loc7_;
      _loc2_._y = _loc6_;
      var _loc4_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuAwardsItem)_loc2_;
      _loc4_.__set__data(_dataArray);
      this.itemList[i] = _loc4_;
      this.itemY = this.itemY + (_loc2_.bgMC._height + this.rowSpacing);
   }
   function moveHorz(dir)
   {
      var _loc2_ = this.__get__index() + dir;
      var _loc3_ = false;
      if(dir < 0)
      {
         if(_loc2_ == -1 || _loc2_ == 3 || _loc2_ == 7)
         {
            _loc2_ = this.index;
         }
      }
      if(dir > 0)
      {
         if(_loc2_ == 4 || _loc2_ == 8 || _loc2_ == 12)
         {
            _loc2_ = this.index;
         }
      }
      this.__set__index(_loc2_);
      this.setDescription();
      return _loc3_;
   }
   function moveVert(dir)
   {
      var _loc2_ = this.__get__index() + dir * this.batchCols;
      if(_loc2_ < 0)
      {
         _loc2_ = _loc2_ + this.batchCols * this.batchRows;
      }
      if(_loc2_ >= this.batchCols * this.batchRows)
      {
         _loc2_ = _loc2_ - this.batchCols * this.batchRows;
      }
      this.__set__index(_loc2_);
      this.setDescription();
   }
   function __set__index(_i)
   {
      super.__set__index(_i);
      this.setDescription();
      return this.__get__index();
   }
   function __get__index()
   {
      return this._index;
   }
   function setDescription(num)
   {
      var _loc3_ = this.dataList[this.__get__index()].slice(6);
      var _loc2_ = this.container.descMC.colWhiteMC;
      var _loc6_ = this.container.descMC.colMC;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc2_.hexMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE);
      if(num == -1)
      {
         _loc2_.titleTF.text = "";
         _loc2_.descTF.text = "";
         _loc2_.progressTF.text = "";
         _loc2_.awardsTF.text = "";
         _loc2_.progressValMC.progressValTF.text = "";
         _loc2_.awardsValTF.text = "";
         _loc2_.hexMC._visible = false;
      }
      else if(_loc3_ != undefined)
      {
         com.rockstargames.ui.utils.UIText.setSizedText(_loc2_.titleTF,_loc3_[0]);
         com.rockstargames.ui.utils.UIText.setDescText(_loc2_.descTF,_loc3_[1],false);
         var _loc7_ = _loc3_[4];
         var _loc13_ = _loc3_[5];
         var _loc9_ = _loc3_[6];
         var _loc10_ = _loc3_[7];
         var _loc8_ = _loc3_[8];
         var _loc11_ = _loc3_[9];
         var _loc12_ = _loc3_[10];
         if(_loc9_ != undefined)
         {
            com.rockstargames.ui.utils.UIText.setSizedText(_loc2_.progressTF,_loc9_,true);
         }
         var _loc5_ = _loc13_ < 100;
         _loc2_.awardsTF._visible = _loc5_;
         _loc2_.hexMC._visible = _loc5_;
         _loc2_.awardsValTF._visible = _loc5_;
         if(_loc8_ != undefined && _loc5_)
         {
            com.rockstargames.ui.utils.UIText.setSizedText(_loc2_.awardsTF,_loc8_,true);
         }
         if(_loc10_ != undefined)
         {
            com.rockstargames.ui.utils.UIText.setSizedText(_loc2_.progressValMC.progressValTF,_loc10_,false,true);
            _loc2_.progressValMC._x = 578 - _loc2_.progressValMC.progressValTF.textWidth - 10;
            com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc2_.progressValMC,_loc7_);
         }
         if(_loc11_ != undefined && _loc5_)
         {
            com.rockstargames.ui.utils.UIText.setSizedText(_loc2_.awardsValTF,_loc11_,false,true);
            _loc2_.awardsValTF._x = _loc2_.hexMC._x - _loc2_.hexMC._width / 2 - (TextField)_loc2_.awardsValTF.textWidth;
            _loc2_.hexMC._visible = true;
         }
         else
         {
            _loc2_.hexMC._visible = false;
         }
         if(_loc12_ != undefined)
         {
            com.rockstargames.ui.utils.UIText.setSizedText(_loc6_.colValTF,_loc12_,false,true);
            _loc6_._x = 572 - _loc6_._width;
         }
         var _loc4_ = new com.rockstargames.ui.utils.HudColour();
         if(_loc7_ != undefined)
         {
            com.rockstargames.ui.utils.Colour.setHudColour(_loc7_,_loc4_);
         }
         if(_loc6_ != undefined)
         {
            com.rockstargames.ui.utils.Colour.Colourise(_loc6_,_loc4_.r,_loc4_.g,_loc4_.b,_loc4_.a);
         }
      }
   }
   function setAwardsText(tf, str, alignleft)
   {
      tf.text = str;
      tf.autoSize = "left";
      tf.wordWrap = false;
      tf.multiline = false;
   }
   function focusHighlightStyle(targetIndex)
   {
      var _loc3_ = undefined;
      var _loc2_ = 0;
      _loc2_ = 0;
      while(_loc2_ < this.itemList.length)
      {
         _loc3_ = this.itemList[_loc2_];
         _loc3_.__set__highlighted(_loc2_ == targetIndex);
         _loc2_ = _loc2_ + 1;
      }
      this.highlightedItem = targetIndex;
   }
}
