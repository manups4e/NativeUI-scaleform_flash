class com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsTextItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
   var multiListIndex = 0;
   var multiListItems = new Array();
   var barIndex = 0;
   var barValsList = new Array();
   var _lastInList = false;
   static var facebookType = 3;
   static var strBlipType = 5;
   static var ruledType = 6;
   function PauseMenuSettingsTextItem()
   {
      super();
      this.itemTextRight = this.labelMC.valueTF;
      this.labelMC.rMC._visible = this.labelMC.lMC._visible = false;
      this.isAdjustable = true;
      this.defaultLabelColourEnum = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE;
      _global.gfxExtensions = true;
   }
   function __set__data(_d)
   {
      super.__set__data(_d);
      this.itemTextLeft._x = 5;
      if(this.blipLayer)
      {
         this.blipLayer.removeMovieClip();
      }
      if(this.blipLayerBG)
      {
         this.blipLayerBG.removeMovieClip();
      }
      if(this._data[0] != undefined)
      {
         if(this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsTextItem.strBlipType)
         {
            this.blipLayerBG = this.createEmptyMovieClip("blipLayerBG",1000);
            this.blipLayer = this.createEmptyMovieClip("blipLayer",1002);
            var TextWithBlips = new com.rockstargames.ui.utils.Text();
            TextWithBlips.setTextWithIcons(this._data[0],this.blipLayer,this.itemTextLeft,0,com.rockstargames.ui.utils.UIText.SIZE,2,false);
            TextWithBlips.setTextWithIcons(this._data[0],this.blipLayerBG,this.itemTextLeft,0,com.rockstargames.ui.utils.UIText.SIZE,2,false);
            for(var eltName in this.blipLayerBG)
            {
               with(this.blipLayerBG[eltName])
               {
                  _width = _width + 2
                  _height = _height + 2.5
                  _x = _x + 0.25
                  _y = _y + 0.5
                  
               };
            }
            com.rockstargames.ui.utils.Colour.ApplyHudColour(this.blipLayerBG,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
         }
         else
         {
            this.itemTextLeft.autoSize = "none";
            this.itemTextLeft._width = 390;
            com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextLeft,this._data[0],true);
         }
      }
      if(this.fbMC != undefined)
      {
         this.fbMC.removeMovieClip();
      }
      var FacebookLinkage = -1155176764;
      if(this.menuID == FacebookLinkage + this.menuPrefOffset)
      {
         this.type = com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsTextItem.facebookType;
      }
      this.maskMC._visible = false;
      this.barMC.setMask(null);
      switch(this.type)
      {
         case com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsTextItem.ruledType:
            var xp = 289 - this.itemTextLeft.textWidth * 0.5;
            this.itemTextLeft._x = Math.ceil(xp);
            this.barMC._visible = false;
            this.labelMC.lMC._visible = _loc0_ = false;
            this.labelMC.rMC._visible = _loc0_;
            com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextRight,"");
            this.isSelectable = 0;
            break;
         case 0:
            this.barMC._visible = false;
            if(this.__get__data()[1] != undefined && this.__get__data()[1] != "")
            {
               com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextRight,this.__get__data()[1]);
            }
            else
            {
               com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextRight,"");
            }
            this.labelMC.lMC._visible = _loc0_ = false;
            this.labelMC.rMC._visible = _loc0_;
            break;
         case com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsTextItem.strBlipType:
         case 1:
            this.multiListItems = this.__get__data().slice(1);
            this.barMC._visible = false;
            this.labelMC.lMC._visible = _loc0_ = false;
            this.labelMC.rMC._visible = _loc0_;
            this.__set__textIndex(this.initialIndex);
            break;
         case 4:
            this.maskMC._visible = true;
            this.barMC.setMask(this.maskMC);
         case 2:
            var steps = this.__get__data()[1];
            if(steps == "" || steps == undefined)
            {
               steps = 1;
            }
            this.barValsList = [];
            var i = 0;
            while(i < steps + 1)
            {
               this.barValsList.push(100 / steps * i);
               i++;
            }
            var colourIndex = this.__get__data()[2];
            if(colourIndex == undefined)
            {
               colourIndex = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREEN;
            }
            this.bar = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar(this.barMC);
            this.bar.init(colourIndex);
            this.barMC._visible = true;
            this.barMC._alpha = !this.isSelectable?30:100;
            this.labelMC.lMC._visible = _loc0_ = false;
            this.labelMC.rMC._visible = _loc0_;
            com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextRight,"");
            this.__set__barscale(this.initialIndex);
            break;
         case com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsTextItem.facebookType:
            this.fbMC = this.attachMovie("itemfblogo","fblogoMC",this.getNextHighestDepth(),{_x:7,_y:4});
            this.itemTextLeft._x = this.fbMC._x + this.fbMC._width + 4;
         default:
            this.barMC._visible = false;
            com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextRight,"");
      }
      var bgColour = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,bgColour);
      com.rockstargames.ui.utils.Colour.Colourise(this.bgMC,bgColour.r,bgColour.g,bgColour.b,bgColour.a);
      var highlightColour = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,highlightColour);
      com.rockstargames.ui.utils.Colour.Colourise(this.highlightMC,highlightColour.r,highlightColour.g,highlightColour.b,highlightColour.a);
      if(this.__get__isLastItem())
      {
         this.bgMC._height = _loc0_ = 25;
         this.highlightMC._height = _loc0_;
      }
      else
      {
         this.bgMC._height = 27;
         this.highlightMC._height = this.bgMC._height - 2;
      }
      this.bgMC._visible = false;
      this.__set__highlighted(this._highlighted);
      return this.__get__data();
   }
   function __set__isLastItem(l)
   {
      this._lastInList = l;
      return this.__get__isLastItem();
   }
   function __get__isLastItem()
   {
      return this._lastInList;
   }
   function initStoreMethod(func, scope)
   {
      this.storeFunc = func;
      this.storeScope = scope;
   }
   function __set__barscale(bi)
   {
      this.barIndex = bi;
      this.selectedIndex = this.barIndex;
      this.selectedValue = this.barValsList[this.barIndex];
      this.bar.percent(this.selectedValue);
      return this.__get__barscale();
   }
   function __set__textIndex(ti)
   {
      this.multiListIndex = ti;
      this.selectedIndex = this.multiListIndex;
      this.selectedValue = this.multiListItems[this.multiListIndex];
      com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextRight,this.selectedValue);
      this.itemTextRight.autoSize = true;
      this.itemTextRight._x = this.labelMC.rMC._x - this.itemTextRight._width - 2;
      this.labelMC.lMC._x = this.itemTextRight._x - 2;
      this.labelMC.rMC._visible = this.labelMC.lMC._visible = true;
      return this.__get__textIndex();
   }
   function stepVal(dir)
   {
      switch(this.type)
      {
         case com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsTextItem.strBlipType:
         case 1:
            this.multiListIndex = this.multiListIndex + dir;
            if(this.multiListIndex < 0)
            {
               this.multiListIndex = this.multiListItems.length - 1;
            }
            if(this.multiListIndex > this.multiListItems.length - 1)
            {
               this.multiListIndex = 0;
            }
            this.__set__textIndex(this.multiListIndex);
            this.storeFunc.apply(this.storeScope,[this.index,this.multiListIndex]);
            this.setPref(this.multiListIndex);
            break;
         case 2:
         case 4:
            this.barIndex = this.barIndex + dir;
            if(this.barIndex < 0)
            {
               this.barIndex = 0;
            }
            if(this.barIndex > this.barValsList.length - 1)
            {
               this.barIndex = this.barValsList.length - 1;
            }
            this.__set__barscale(this.barIndex);
            this.storeFunc.apply(this.storeScope,[this.index,this.barIndex]);
            this.setPref(this.barIndex);
      }
      this.__set__highlighted(this._highlighted);
   }
   function setPrefMouse(val)
   {
      if(this.__get__uniqueID() >= 0 && this.__get__uniqueID() < this.menuPrefOffset)
      {
         com.rockstargames.ui.game.GameInterface.call("HANDLE_MOUSE_LEFT_RIGHT",com.rockstargames.ui.game.GameInterface.PAUSE_TYPE,this.__get__uniqueID(),val);
      }
   }
   function __set__highlighted(_h)
   {
      this.highlightMC._visible = _h;
      var _loc3_ = new com.rockstargames.ui.utils.HudColour();
      var _loc2_ = new com.rockstargames.ui.utils.HudColour();
      var _loc4_ = 100;
      var _loc5_ = false;
      if(this.isSelectable <= 0 || this.isSelectable == 2)
      {
         if(this.type != com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsTextItem.ruledType)
         {
            _loc5_ = true;
            _loc4_ = !_h?30:60;
         }
      }
      if(_h)
      {
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG,_loc3_);
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK,_loc2_);
         if((this.type == 1 || this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsTextItem.strBlipType) && _loc5_ == false)
         {
            this.labelMC.rMC._visible = this.labelMC.lMC._visible = true;
            this.itemTextRight._x = this.labelMC.rMC._x - this.itemTextRight._width - 2;
            this.labelMC.lMC._x = this.itemTextRight._x - 2;
         }
      }
      else
      {
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc3_);
         com.rockstargames.ui.utils.Colour.setHudColour(this.defaultLabelColourEnum,_loc2_);
         if(this.type == 1 || this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsTextItem.strBlipType)
         {
            this.labelMC.rMC._visible = this.labelMC.lMC._visible = false;
         }
         this.itemTextRight._x = this.highlightMC._width - this.itemTextRight._width - 6;
      }
      if(this.labelMC != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.labelMC,_loc2_.r,_loc2_.g,_loc2_.b,_loc4_);
      }
      this._highlighted = _h;
      return this.__get__highlighted();
   }
   function mInit()
   {
      super.mInit();
      delete this.bMC.onRelease;
      delete this.bMC.onPress;
      this.bMC.onPress = gfx.utils.Delegate.create(this,this.mPress);
   }
   function mOver()
   {
      if(this.isSelectable)
      {
         _level0.TIMELINE.M_OVER_EVENT(this.index,this.__get__columnID(),this);
      }
   }
   function mOut()
   {
      if(this.isSelectable)
      {
         _level0.TIMELINE.M_OUT_EVENT(this.index,this.__get__columnID());
      }
   }
   function mPress()
   {
      if(this.isSelectable)
      {
         var _loc2_ = this._xmouse;
         var _loc9_ = this._ymouse;
         var _loc5_ = false;
         var _loc4_ = false;
         var _loc6_ = 289;
         var _loc3_ = 40;
         if(this.type == 2 || this.type == 4)
         {
            _loc3_ = 71;
         }
         var _loc7_ = this.bgMC._width - _loc3_;
         var _loc8_ = this.bgMC._width - _loc3_;
         if(_loc2_ > _loc8_)
         {
            _loc4_ = true;
         }
         if(_loc2_ > _loc6_ && _loc2_ < _loc7_)
         {
            _loc5_ = true;
         }
         if(!this.__get__highlighted())
         {
            _level0.TIMELINE.M_PRESS_EVENT(this.index,this.__get__columnID(),false);
         }
         else if(this.type == 0 || this.type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsTextItem.facebookType)
         {
            _level0.TIMELINE.M_PRESS_EVENT(this.index,this.__get__columnID(),true);
         }
         else if(_loc4_)
         {
            _level0.TIMELINE.clickRepeat.repeatStart(this,this.setPrefMouse,[1]);
            this.setPrefMouse(1);
         }
         else if(_loc5_)
         {
            _level0.TIMELINE.clickRepeat.repeatStart(this,this.setPrefMouse,[-1]);
            this.setPrefMouse(-1);
         }
      }
   }
}
