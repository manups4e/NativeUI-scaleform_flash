class com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsView extends com.rockstargames.ui.components.GUIView
{
   var STAT_BAR_W = 280;
   var STAT_BAR_H = 18;
   var ATTACHMENT_BAR_W = 126;
   var HIDE_STAT_VALUE = -1;
   var batchW = 0;
   var batchH = 106;
   var batchCols = 3;
   var batchRows = 2;
   function PauseMPMenuWeaponsView()
   {
      super();
   }
   function displayView()
   {
      super.displayView();
      this.container.progStatsMC.damageBarMC.init(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,this.STAT_BAR_W,this.STAT_BAR_H);
      this.container.progStatsMC.fireRateBarMC.init(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,this.STAT_BAR_W,this.STAT_BAR_H);
      this.container.progStatsMC.accuracyBarMC.init(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,this.STAT_BAR_W,this.STAT_BAR_H);
      this.container.progStatsMC.rangeBarMC.init(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,this.STAT_BAR_W,this.STAT_BAR_H);
      this.container.progStatsMC.clipSizeBarMC.init(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,this.STAT_BAR_W,this.STAT_BAR_H);
   }
   function __set__params(_p)
   {
      super.__set__params(_p);
      this.container = _p.container;
      this.batchCols = _p.batchCols;
      this.batchRows = _p.batchRows;
      this.batchW = _p.batchW;
      com.rockstargames.gtav.utils.GTAVUIUtils.colourRankIcon(this.container.rankIconMC);
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE,_loc3_);
      com.rockstargames.ui.utils.Colour.Colourise(this.container.progStatsMC.damageAttBarMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      com.rockstargames.ui.utils.Colour.Colourise(this.container.progStatsMC.fireRateAttBarMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      com.rockstargames.ui.utils.Colour.Colourise(this.container.progStatsMC.accuracyAttBarMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      com.rockstargames.ui.utils.Colour.Colourise(this.container.progStatsMC.rangeAttBarMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      com.rockstargames.ui.utils.Colour.Colourise(this.container.progStatsMC.clipSizeAttBarMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
      this.container.rankNumTF.textAutoSize = "shrink";
      this.showDescription(false);
      this.showRank(false);
      return this.__get__params();
   }
   function addDisplayItem(i, _dataArray)
   {
      var _loc4_ = this.viewLinkageList[0];
      var _loc2_ = this.viewContainer[_loc4_ + i + "MC"];
      if(_loc2_ != undefined)
      {
         (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem)_loc2_.dispose();
      }
      _loc2_ = this.viewContainer.attachMovie(_loc4_,_loc4_ + i + "MC",i);
      var _loc7_ = i % this.batchCols * (this.batchW + this.rowSpacing);
      var _loc6_ = Math.floor(i / this.batchCols) * (this.batchH + this.columnSpacing);
      _loc2_._x = _loc7_;
      _loc2_._y = _loc6_;
      var _loc5_ = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem)_loc2_;
      _loc5_.__set__data(_dataArray);
      this.itemList[i] = _loc5_;
      this.itemY = this.itemY + (_loc2_.bgMC._height + this.rowSpacing);
   }
   function moveHorz(dir)
   {
      var _loc2_ = this.__get__index() + dir;
      var _loc3_ = false;
      if(dir < 0)
      {
         if(_loc2_ == -1 || _loc2_ == 2 || _loc2_ == 5)
         {
            _loc2_ = this.index;
         }
      }
      if(dir > 0)
      {
         if(_loc2_ == 3 || _loc2_ == 6 || _loc2_ == 9)
         {
            _loc2_ = this.index;
         }
      }
      this.__set__index(_loc2_);
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
   }
   function setDescription(data)
   {
      if(data[0] == undefined)
      {
         this.showDescription(false);
         this.showRank(false);
      }
      else
      {
         this.showDescription(true);
         var _loc6_ = _level0.TIMELINE.isAsianLang;
         com.rockstargames.ui.utils.UIText.setSizedText(this.container.weaponTF,data[0],_loc6_);
         com.rockstargames.ui.utils.UIText.setDescText(this.container.descTF,data[1]);
         var _loc3_ = this.container.progStatsMC;
         var _loc5_ = this.container.textStatsMC;
         com.rockstargames.ui.utils.UIText.setSizedText(_loc5_.killsValTF,data[2] != -1?data[2]:"");
         com.rockstargames.ui.utils.UIText.setSizedText(_loc5_.deathsValTF,data[3] != -1?data[3]:"");
         var _loc4_ = data[4];
         if(_loc4_ == -1)
         {
            _loc4_ = "";
         }
         else if(_loc4_ == undefined)
         {
            _loc4_ = "0";
         }
         else
         {
            _loc4_ = com.rockstargames.ui.utils.MathStar.toFixedRound(_loc4_,2);
         }
         com.rockstargames.ui.utils.UIText.setSizedText(_loc5_.headshotsValTF,_loc4_);
         com.rockstargames.ui.utils.UIText.setSizedText(_loc5_.kdRatioValTF,data[14] != -1?data[14]:"");
         com.rockstargames.ui.utils.UIText.setSizedText(_loc5_.accuracyValTF,data[5] != -1?String(com.rockstargames.ui.utils.MathStar.toFixedRound(data[5],2)) + "%":"");
         this.setBar(_loc3_.damageBarMC,_loc3_.damageAttBarMC,data[6],data[10]);
         this.setBar(_loc3_.fireRateBarMC,_loc3_.fireRateAttBarMC,data[7],data[11]);
         this.setBar(_loc3_.accuracyBarMC,_loc3_.accuracyAttBarMC,data[9],data[12]);
         this.setBar(_loc3_.rangeBarMC,_loc3_.rangeAttBarMC,data[15],data[16]);
         this.setText(_loc3_.clipTF,_loc3_.clipAttTF,data[8],data[13]);
         if(data[17])
         {
            this.showRank(true);
            this.container.rankNumTF.text = data[17];
         }
         else
         {
            this.showRank(false);
         }
      }
   }
   function showDescription(show)
   {
      this.container.weaponTF._visible = show;
      this.container.descTF._visible = show;
      this.container.textStatsMC._visible = show;
      this.container.progStatsMC._visible = show;
   }
   function showRank(show)
   {
      this.container.rankNumTF._visible = show;
      this.container.rankIconMC._visible = show;
   }
   function setBar(barmc, attmc, base, attpct)
   {
      if(base > 100)
      {
         base = 100;
      }
      attmc._visible = barmc._visible = base != this.HIDE_STAT_VALUE;
      if(base + attpct > 100)
      {
         attpct = 100 - base;
      }
      if(attpct >= 0)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(attmc,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLUE);
      }
      else
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(attmc,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED);
         base = base + attpct;
         if(base < 0)
         {
            base = 0;
         }
      }
      barmc.percent(base);
      var _loc5_ = Math.round(142 + this.ATTACHMENT_BAR_W * base / 100);
      var _loc6_ = this.ATTACHMENT_BAR_W * (Math.abs(attpct) / 100);
      attmc._width = _loc6_;
      attmc._x = _loc5_;
   }
   function setText(baseTF, attTF, baseVal, attVal)
   {
      baseTF._visible = attTF._visible = this.HIDE_STAT_VALUE != baseVal;
      if(baseVal == this.HIDE_STAT_VALUE)
      {
         return undefined;
      }
      baseTF.autoSize = true;
      attTF.autoSize = true;
      attTF._visible = attVal != 0;
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(attTF,attVal <= 0?com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED:com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLUE);
      var _loc6_ = attVal <= 0?"":"+";
      attTF.text = "(" + _loc6_ + attVal + ")";
      var _loc5_ = 271;
      attTF._x = _loc5_ - attTF.textWidth;
      baseTF.text = "" + baseVal;
      baseTF._x = _loc5_ - baseTF.textWidth - (!attTF._visible?0:attTF.textWidth + 4);
   }
   function focusHighlightStyle(targetIndex)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.itemList.length)
      {
         this.itemList[_loc2_].highlighted = _loc2_ == targetIndex;
         _loc2_ = _loc2_ + 1;
      }
      this.highlightedItem = targetIndex;
   }
   function destroy()
   {
      com.rockstargames.ui.utils.Debug.log("*****************************************************************************");
      com.rockstargames.ui.utils.Debug.log("PauseMPMenuWeaponsView::destroy [" + arguments + "]");
      com.rockstargames.ui.utils.Debug.log("*****************************************************************************");
      super.destroy();
   }
}
