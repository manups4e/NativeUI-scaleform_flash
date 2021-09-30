class com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuCoronaPlayerInfoItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
   var padding = 5;
   function PauseMPMenuCoronaPlayerInfoItem()
   {
      super();
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.subtextTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE);
      this.item1UITF = (com.rockstargames.ui.components.UITextField)this.attachMovie("uiTextField","uiTF",this.getNextHighestDepth(),{_y:1});
      this.item1UITF.init(17,com.rockstargames.gtav.utils.GTAVUIConfig.CONDENSED_FONT_NOT_GAMERNAME,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,true);
      this.item2UITF = (com.rockstargames.ui.components.UITextField)this.attachMovie("uiTextField","uiTF",this.getNextHighestDepth(),{_y:1});
      this.item2UITF.init(17,com.rockstargames.gtav.utils.GTAVUIConfig.CONDENSED_FONT_NOT_GAMERNAME,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,true);
      this.item3UITF = (com.rockstargames.ui.components.UITextField)this.attachMovie("uiTextField","uiTF",this.getNextHighestDepth(),{_y:1});
      this.item3UITF.init(17,com.rockstargames.gtav.utils.GTAVUIConfig.CONDENSED_FONT_NOT_GAMERNAME,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,true);
   }
   function __set__data(_d)
   {
      super.__set__data(_d);
      this._x = this.__get__data()[0];
      this._y = this.__get__data()[1];
      this.nameTF.text = this.__get__data()[2];
      this.item1UITF.setText(this.__get__data()[3]);
      if(this.__get__data()[4])
      {
         this.item1UITF.setBgColour(this.__get__data()[4]);
      }
      this.item2UITF.setText(this.__get__data()[5]);
      if(this.__get__data()[6])
      {
         this.item2UITF.setBgColour(this.__get__data()[6]);
      }
      this.item3UITF.setText(this.__get__data()[8]);
      if(this.__get__data()[9])
      {
         this.item3UITF.setBgColour(this.__get__data()[9]);
      }
      if(this.__get__data()[10] != undefined)
      {
         this._alpha = this.__get__data()[10];
      }
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.nameTF,!this.__get__data()[11]?com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE:this.__get__data()[11]);
      if(this.__get__data()[12])
      {
         this.iconMC._visible = true;
         this.iconMC.gotoAndStop(com.rockstargames.gtav.constants.MPIconLabels.lookUp(this.__get__data()[12])[1]);
      }
      else
      {
         this.iconMC._visible = false;
      }
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.iconMC,!this.__get__data()[11]?com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE:this.__get__data()[11]);
      this.subtextTF.text = this.__get__data()[7];
      var _loc3_ = this.subtextTF.getTextFormat();
      var _loc5_ = _level0.TIMELINE.isAsianLang;
      if(_loc5_)
      {
         _loc3_.size = 24;
         this.subtextTF.setTextFormat(_loc3_);
      }
      if(this.__get__data()[13])
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.subtextTF,this.__get__data()[13]);
      }
      this.nameTF.autoSize = true;
      var _loc4_ = this.nameTF.textWidth + this.getWidth(this.iconMC) + this.getWidth(this.item1UITF) + this.getWidth(this.item2UITF) + this.getWidth(this.item3UITF);
      this.nameTF._x = (- _loc4_) * 0.5;
      this.iconMC._x = this.getRightEdge(this.nameTF);
      this.item1UITF._x = this.getRightEdge(this.iconMC);
      this.item2UITF._x = this.getRightEdge(this.item1UITF);
      this.item3UITF._x = this.getRightEdge(this.item2UITF);
      return this.__get__data();
   }
   function getWidth(mc)
   {
      return !mc._visible?0:mc._width + this.padding;
   }
   function getRightEdge(mc)
   {
      return mc._x + this.getWidth(mc);
   }
   function getLeftPosition()
   {
      return this._x + this.nameTF._x;
   }
}
