class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuMapItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
   var _showBlips = true;
   var showBlipIndex = 12;
   var initalValueIndex = 4;
   function PauseMenuMapItem()
   {
      super();
      this.selectedValue = 0;
      this.valueIndicatorMC = this.labelMC.valueIndicatorMC;
      this.valueIndicatorMC._visible = false;
      this.valueTF = this.valueIndicatorMC.valueTF;
      this.lMC = this.valueIndicatorMC.lMC;
      this.rMC = this.valueIndicatorMC.rMC;
      this.valueTF.autoSize = "left";
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.newIconMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_SOCIAL_CLUB);
   }
   function __set__data(_d)
   {
      super.__set__data(_d);
      this.valuesLength = this.__get__data()[5] <= 1?1:this.__get__data()[5];
      this._showBlips = this.__get__data()[6] == false?false:true;
      this.selectedValue = this.initialIndex;
      this.updateDisplay();
      return this.__get__data();
   }
   function applyFormattedText(searchString, my_txt)
   {
      var _loc6_ = searchString.indexOf("<C>");
      var _loc8_ = searchString.indexOf("</C>");
      if(_loc6_ != -1 && _loc8_ != -1)
      {
         var _loc1_ = searchString.substring(0,_loc6_);
         var _loc5_ = searchString.substring(_loc6_ + 3,_loc8_);
         var _loc9_ = searchString.substring(_loc8_ + 4);
         var _loc2_ = new TextFormat();
         _loc2_ = my_txt.getTextFormat();
         _loc2_.font = "$Font2";
         _loc2_.size = 13;
         var _loc3_ = new TextFormat();
         _loc3_ = my_txt.getTextFormat();
         _loc3_.font = "$Font2_cond_NOT_GAMERNAME";
         _loc3_.size = 18;
         my_txt.text = _loc1_ + _loc5_ + _loc9_;
         my_txt.setTextFormat(0,_loc1_.length,_loc2_);
         my_txt.setTextFormat(_loc1_.length,_loc1_.length + _loc5_.length,_loc3_);
         my_txt.setTextFormat(_loc1_.length + _loc5_.length,_loc1_.length + _loc5_.length + _loc9_.length,_loc2_);
      }
   }
   function updateDisplay()
   {
      com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextLeft,this.__get__data()[0],false,true);
      this.applyFormattedText(this.__get__data()[0],this.itemTextLeft);
      if(this.valuesLength > 1 && this._highlighted && this._showBlips)
      {
         this.valueIndicatorMC._visible = true;
         com.rockstargames.ui.utils.UIText.setSizedText(this.valueTF,this.selectedValue + 1 + "/" + this.valuesLength,false,true);
         this.rMC._x = Math.round(this.valueTF._x + this.valueTF._width) + 2;
         this.valueIndicatorMC._x = Math.round(this.itemTextLeft._x + this.itemTextLeft._width + 4);
      }
      else
      {
         this.valueIndicatorMC._visible = false;
      }
      this.iconID = this.__get__data()[4];
      if(this.iconID != undefined)
      {
         if(this._showBlips == true && this.iconMC._name != this.iconID)
         {
            this.iconMC.removeMovieClip();
            this.iconMC = this.attachMovie(this.iconID,this.iconID,this.getNextHighestDepth());
         }
         else if(!this._showBlips && this.iconMC != "crossMC")
         {
            this.iconMC.removeMovieClip();
            this.iconMC = this.attachMovie("MapLegendItemCross","crossMC",this.getNextHighestDepth());
         }
         this.iconMC._y = 12.5;
         if(this.valuesLength > 1 && this._highlighted && this._showBlips)
         {
            this.iconMC._x = Math.round(this.valueIndicatorMC._x + this.valueIndicatorMC._width + 21);
         }
         else
         {
            this.iconMC._x = Math.round(this.itemTextLeft._x + this.itemTextLeft._width + 18);
         }
         if(this._showBlips)
         {
            com.rockstargames.ui.utils.Colour.Colourise(this.iconMC,this._data[1],this._data[2],this._data[3]);
         }
         else
         {
            var _loc4_ = new com.rockstargames.ui.utils.HudColour();
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_MENU_GREY,_loc4_);
            com.rockstargames.ui.utils.Colour.Colourise(this.iconMC,_loc4_.r,_loc4_.g,_loc4_.b,_loc4_.a);
         }
      }
      else if(this.iconMC != undefined)
      {
         this.iconMC.removeMovieClip();
      }
      this.newIconMC._visible = this.__get__data()[7];
      if(this.valuesLength > 1 && this._highlighted && this._showBlips)
      {
         this.bgMC._width = this.bMC._width = Math.round(this.valueIndicatorMC._x + this.valueIndicatorMC._width + 33);
      }
      else
      {
         this.bgMC._width = this.bMC._width = Math.round(this.itemTextLeft._x + this.itemTextLeft._width + 30);
      }
      if(this.__get__data()[7])
      {
         var _loc5_ = this.newIconMC._width + 2;
         this.labelMC._x = 5 + _loc5_;
         this.iconMC._x = this.iconMC._x + _loc5_;
         this.bgMC._width = this.bgMC._width + _loc5_;
         this.bMC._width = this.bMC._width + _loc5_;
      }
      this._x = - this.bgMC._width;
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      var _loc2_ = new com.rockstargames.ui.utils.HudColour();
      if(this._highlighted)
      {
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc3_);
         !this._showBlips?com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_MENU_GREY,_loc2_):com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,_loc2_);
      }
      else
      {
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc3_);
         !this._showBlips?com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_MENU_GREY,_loc2_):com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc2_);
      }
      com.rockstargames.ui.utils.Colour.Colourise(this.labelMC,_loc2_.r,_loc2_.g,_loc2_.b,_loc2_.a);
      com.rockstargames.ui.utils.Colour.Colourise(this.bgMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
   }
   function initStoreMethod(func, scope)
   {
      this.storeFunc = func;
      this.storeScope = scope;
   }
   function stepVal(dir)
   {
      var _loc2_ = this.selectedValue + dir;
      this.selectedValue = _loc2_ < this.valuesLength?this.selectedValue + dir >= 0?_loc2_:_loc2_ + this.valuesLength:_loc2_ - this.valuesLength;
      if(this.valuesLength > 1)
      {
         this.storeFunc.apply(this.storeScope,[this.index,this.initalValueIndex,this.selectedValue]);
         com.rockstargames.ui.game.GameInterface.call("SET_MAP_LOCATION",com.rockstargames.ui.game.GameInterface.PAUSE_TYPE,this.__get__uniqueID(),this.selectedValue);
      }
      this.updateDisplay();
   }
   function __set__highlighted(value)
   {
      if(this._highlighted != value)
      {
         this._highlighted = value;
         this.updateDisplay();
      }
      return this.__get__highlighted();
   }
   function __get__highlighted()
   {
      return this._highlighted;
   }
   function __set__showBlips(value)
   {
      if(this.iconID == "radar_centre" || this.iconID == "radar_waypoint")
      {
         return undefined;
      }
      var _loc2_ = value == this._showBlips?false:true;
      this._showBlips = value;
      if(_loc2_)
      {
         this.storeFunc.apply(this.storeScope,[this.index,this.showBlipIndex,this._showBlips]);
         com.rockstargames.ui.game.GameInterface.call("SET_MAP_SHOW_BLIPS",com.rockstargames.ui.game.GameInterface.PAUSE_TYPE,this.__get__uniqueID(),this._showBlips);
      }
      this.updateDisplay();
      return this.__get__showBlips();
   }
   function __get__showBlips()
   {
      return this._showBlips;
   }
   function mPress()
   {
      if(!this.__get__highlighted())
      {
         _level0.TIMELINE.M_PRESS_EVENT(this.index,this.__get__columnID(),false);
      }
      else
      {
         var _loc2_ = this._xmouse;
         var _loc3_ = 48;
         var _loc4_ = this.bgMC._width - _loc3_;
         var _loc5_ = this.bgMC._width - _loc3_;
         if(_loc2_ > _loc5_)
         {
            this.stepVal(1);
         }
         if(_loc2_ < _loc4_)
         {
            this.stepVal(-1);
         }
      }
   }
}
