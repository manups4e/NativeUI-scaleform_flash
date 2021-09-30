class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeDetailsItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
   var basetextW = 266;
   function PauseMenuFreemodeDetailsItem()
   {
      super();
      this.outlineMC._visible = false;
      _global.gfxExtensions = true;
      this.itemTextRight = this.labelMC.valueTF;
      this.itemTextLeft = this.leftlabelMC.titleTF;
      this.basetextW = this.itemTextLeft._width;
      this.bgMC._visible = false;
      this.labelMC.scIconMC._visible = false;
      if(this.checkMC)
      {
         this.checkMC._visible = false;
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.checkMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREEN);
      }
      this.labelMC.nameTF.textAutoSize = "shrink";
   }
   function __set__data(_d)
   {
      super.__set__data(_d);
      if(this.__get__data()[1] != undefined)
      {
         com.rockstargames.ui.utils.UIText.setSizedText(this.itemTextRight,this.__get__data()[1],true);
      }
      this.snapBGGrid(this.bgMC);
      if(this.type >= 0 && this.type < 4)
      {
         if(this.index % 2 == 1)
         {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(this.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
            this.bgMC._alpha = 20;
            this.bgMC._height = 25;
            this.bgMC._y = 2;
            this.bgMC._visible = true;
         }
      }
      switch(this.type)
      {
         case 0:
         case 1:
            this.itemTextRight._width = 288 - (this.itemTextLeft._x + this.itemTextLeft.textWidth + 25);
            this.itemTextRight._x = 288 - this.itemTextRight._width - 6;
            break;
         case 2:
            if(this.iconMC != undefined)
            {
               var _loc6_ = 1;
               if(this.__get__data()[2] != undefined)
               {
                  _loc6_ = this.__get__data()[2] + 2;
               }
               this.iconMC.gotoAndStop(_loc6_);
               this.iconMC._x = this.bgMC._width - this.iconMC._width * 0.5 - 5;
               this.iconMC._y = 15;
               var _loc8_ = 5;
               this.itemTextRight._x = this.iconMC._x - this.iconMC._width * 0.5 - 132 - _loc8_;
               var _loc7_ = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE;
               if(this.__get__data()[3] != undefined)
               {
                  _loc7_ = this.__get__data()[3];
               }
               com.rockstargames.ui.utils.Colour.ApplyHudColour(this.iconMC,_loc7_);
               if(this.__get__data()[4] != undefined)
               {
                  if(this.checkMC)
                  {
                     this.checkMC._visible = this.__get__data()[4];
                  }
               }
            }
            break;
         case 3:
            this.labelMC.nameTF.text = this.__get__data()[1];
            this.itemTextRight._visible = false;
            var _loc4_ = this.__get__data()[2];
            if(_loc4_ == undefined || _loc4_ == "")
            {
               if(this.crewTagMC)
               {
                  this.crewTagMC._visible = false;
               }
            }
            else
            {
               if(!this.crewTagMC)
               {
                  this.crewTagMC = this.attachMovie("CREW_TAG_MOVIECLIP","crewTagMC",this.getNextHighestDepth(),{_y:5,_xscale:60,_yscale:60});
               }
               this.crewTagMC.UNPACK_CREW_TAG(_loc4_);
               this.crewTagMC._visible = true;
               this.crewTagMC._x = 288 - this.crewTagMC._width + 3;
               this.labelMC.nameTF._x = this.crewTagMC._x - 6 - this.labelMC.nameTF._width;
            }
            if(this.__get__data()[3])
            {
               this.labelMC.scIconMC._visible = true;
               this.labelMC.nameTF._x = 124;
            }
            else
            {
               this.labelMC.scIconMC._visible = false;
            }
            break;
         case 4:
            this.outlineMC._visible = true;
            this.leftlabelMC._y = _loc0_ = 2;
            this.labelMC._y = _loc0_;
            this.bgMC._y = _loc0_;
            break;
         case 5:
            var _loc9_ = this._data[0];
            var _loc5_ = this.itemTextLeft.getTextFormat();
            _loc5_.size = com.rockstargames.ui.utils.UIText.SIZE;
            this.itemTextLeft.setNewTextFormat(_loc5_);
            this.itemTextLeft.wordWrap = true;
            this.itemTextLeft.multiline = true;
            this.itemTextLeft.autoSize = true;
            this.itemTextLeft.text = _loc9_;
            if(this.itemTextLeft._height > 100)
            {
               this.itemTextLeft.autoSize = false;
               this.itemTextLeft._height = 100;
               while(this.itemTextLeft.textHeight > this.itemTextLeft._height)
               {
                  var _loc3_ = this.itemTextLeft.text.substr(0,this.itemTextLeft.text.length - 4) + "...";
                  this.itemTextLeft.text = _loc3_;
               }
               this.itemTextLeft.autoSize = true;
            }
            this.itemTextLeft._y = -2;
            this.itemTextRight._visible = false;
            this.bgMC._height = this.itemTextLeft.textHeight <= 0?0:this.itemTextLeft.textHeight + 16;
      }
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.leftlabelMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.labelMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      return this.__get__data();
   }
   function snapBGGrid(bgMC)
   {
      var _loc2_ = Math.ceil(this.itemTextLeft.textHeight / 27);
      bgMC._height = _loc2_ * 27 - 2;
   }
   function __set__highlighted(_h)
   {
      this._highlighted = _h;
      return this.__get__highlighted();
   }
}
