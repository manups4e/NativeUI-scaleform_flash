class com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
   static var SUPPRESSOR_ATTACHMENT_DISPLAY = 0;
   static var FLASHLIGHT_ATTACHMENT_DISPLAY = 3;
   static var SCOPE_02_ATTACHMENT_DISPLAY = 6;
   static var LASER_ATTACHMENT_DISPLAY = 9;
   static var CLIP_01_ATTACHMENT_DISPLAY = 12;
   static var CLIP_02_ATTACHMENT_DISPLAY = 15;
   static var SCOPE_01_ATTACHMENT_DISPLAY = 18;
   static var GRIP_ATTACHMENT_DISPLAY = 21;
   static var CLIP_03_ATTACHMENT_DISPLAY = 24;
   static var MUZZLEBREAK_01_ATTACHMENT_DISPLAY = 0;
   static var MUZZLEBREAK_02_ATTACHMENT_DISPLAY = 6;
   static var MUZZLEBREAK_03_ATTACHMENT_DISPLAY = 9;
   static var MUZZLEBREAK_04_ATTACHMENT_DISPLAY = 12;
   static var MUZZLEBREAK_05_ATTACHMENT_DISPLAY = 15;
   static var MUZZLEBREAK_06_ATTACHMENT_DISPLAY = 18;
   static var MUZZLEBREAK_07_ATTACHMENT_DISPLAY = 21;
   static var SCOPE_03_ATTACHMENT_DISPLAY = 0;
   static var SCOPE_04_ATTACHMENT_DISPLAY = 3;
   static var BARREL_01_ATTACHMENT_DISPLAY = 6;
   static var BARREL_02_ATTACHMENT_DISPLAY = 9;
   static var ATTACHMENT_START_INDICES = [0,9,16];
   static var NUM_ATTACHMENTS = 20;
   static var NUM_DISPLAY_STATES = 3;
   static var BIT_DISPLAY_PURCHASED = 0;
   static var BIT_DISPLAY_LOCKED = 1;
   static var BIT_DISPLAY_EQUIPPED = 2;
   static var BITMASK_DISPLAY_UNAVAILABLE = -1;
   static var BITMASK_DISPLAY_EMPTY = 0;
   static var BIT_WEAPON_DISPLAY_PURCHASED = 0;
   static var BIT_WEAPON_DISPLAY_PURCHASABLE = 1;
   static var BIT_WEAPON_DISPLAY_LOCKED = 2;
   static var ATTACHMENT_FADE_TIME = 0.5;
   static var ATTACHMENT_WAIT_TIME = 1;
   function PauseMPMenuWeaponsItem()
   {
      super();
      this.weaponMC.gotoAndStop(1);
      this.attachments = ["suppressorMC","flashlightMC","scope02MC","laserMC","clip01MC","clip02MC","scope01MC","gripMC","clip03MC","muzzlebreak01MC","muzzlebreak02MC","muzzlebreak03MC","muzzlebreak04MC","muzzlebreak05MC","muzzlebreak06MC","muzzlebreak07MC","scope03MC","scope04MC","barrel01MC","barrel02MC"];
      this.bgMC._visible = false;
      this.isCyclingAttachments = false;
   }
   function __set__data(_d)
   {
      super.__set__data(_d);
      this.attDisplayBitFields = [];
      this.attDisplayBitFields.push(new com.rockstargames.ui.utils.BitMonger(_d[4]));
      this.attDisplayBitFields.push(new com.rockstargames.ui.utils.BitMonger(_d[6]));
      this.attDisplayBitFields.push(new com.rockstargames.ui.utils.BitMonger(_d[7]));
      this.wDisplayBM = new com.rockstargames.ui.utils.BitMonger(this.isSelectable);
      this.lockedMC._visible = false;
      if(this.wDisplayBM.__get__bitfield() == com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BITMASK_DISPLAY_EMPTY)
      {
         this.weaponMC._visible = false;
         return undefined;
      }
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.lockedMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREY);
      this.weaponMC.gotoAndStop("INT" + this.type);
      this.colourWeapon();
      this.initAttachmentGroups();
      return this.__get__data();
   }
   function __set__highlighted(_h)
   {
      this.highlightMC._visible = _h;
      this._highlighted = _h;
      if(_h)
      {
         this.startAttachmentCycling();
      }
      else
      {
         this.stopAttachmentCycling();
      }
      return this.__get__highlighted();
   }
   function mPress()
   {
      if(!this.__get__highlighted())
      {
         _level0.TIMELINE.M_PRESS_EVENT(this.index,this.__get__columnID(),false);
      }
      else
      {
         _level0.TIMELINE.M_PRESS_EVENT(this.index,this.__get__columnID(),true);
      }
   }
   function dispose()
   {
      var _loc4_ = 0;
      while(_loc4_ < this.attachmentGroups.length)
      {
         var _loc3_ = this.attachmentGroups[_loc4_];
         if(_loc3_.length > 1)
         {
            var _loc2_ = 1;
            while(_loc2_ < _loc3_.length)
            {
               com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc3_[_loc2_]);
               _loc2_ = _loc2_ + 1;
            }
         }
         _loc4_ = _loc4_ + 1;
      }
   }
   function colourWeapon()
   {
      var _loc12_ = this.wDisplayBM._bitfield == com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BITMASK_DISPLAY_UNAVAILABLE;
      var _loc13_ = undefined;
      var _loc11_ = new com.rockstargames.ui.utils.HudColour();
      if(_loc12_)
      {
         this.lockedMC._visible = true;
         com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_MID_GREY_MP,_loc11_);
         _loc13_ = new flash.geom.ColorTransform(0,0,0,1,_loc11_.r,_loc11_.g,_loc11_.b,0);
      }
      else if(this.wDisplayBM.isBitSet(com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_WEAPON_DISPLAY_PURCHASED))
      {
         _loc13_ = new flash.geom.ColorTransform();
      }
      else
      {
         var _loc14_ = this.wDisplayBM.isBitSet(com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_WEAPON_DISPLAY_LOCKED);
         if(_loc14_)
         {
            this.lockedMC._visible = true;
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PM_WEAPONS_LOCKED,_loc11_);
         }
         else
         {
            this.lockedMC._visible = false;
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE,_loc11_);
         }
         _loc13_ = new flash.geom.ColorTransform(0,0,0,1,_loc11_.r,_loc11_.g,_loc11_.b,0);
      }
      this.weaponMC.weaponMC.transform.colorTransform = _loc13_;
      var _loc8_ = 0;
      var _loc3_ = 0;
      while(_loc3_ < com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.NUM_ATTACHMENTS)
      {
         var _loc10_ = this.attachments[_loc3_];
         var _loc7_ = this.weaponMC.attachmentMC[_loc10_];
         if(_loc7_)
         {
            var _loc5_ = undefined;
            var _loc2_ = new com.rockstargames.ui.utils.HudColour();
            if(_loc12_)
            {
               com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_MID_GREY_MP,_loc2_);
               _loc5_ = new flash.geom.ColorTransform(0,0,0,1,_loc2_.r,_loc2_.g,_loc2_.b,0);
            }
            else
            {
               if(_loc3_ == com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.ATTACHMENT_START_INDICES[_loc8_ + 1])
               {
                  _loc8_ = _loc8_ + 1;
               }
               var _loc6_ = this.attDisplayBitFields[_loc8_];
               var _loc4_ = _loc3_ * com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.NUM_DISPLAY_STATES;
               if(_loc6_.isBitSet(_loc4_ + com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_DISPLAY_PURCHASED) || _loc6_.isBitSet(_loc4_ + com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_DISPLAY_EQUIPPED))
               {
                  _loc5_ = new flash.geom.ColorTransform();
               }
               else
               {
                  var _loc9_ = _loc6_.isBitSet(_loc4_ + com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_DISPLAY_LOCKED);
                  com.rockstargames.ui.utils.Colour.setHudColour(!_loc9_?com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE:com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PM_WEAPONS_LOCKED,_loc2_);
                  _loc5_ = new flash.geom.ColorTransform(0,0,0,1,_loc2_.r,_loc2_.g,_loc2_.b,0);
               }
            }
            _loc7_.transform.colorTransform = _loc5_;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function initAttachmentGroups()
   {
      this.attachmentGroups = [];
      var _loc2_ = [];
      var _loc10_ = 0;
      var _loc13_ = 0;
      while(_loc13_ < com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.NUM_ATTACHMENTS - 1)
      {
         var _loc11_ = this.weaponMC.attachmentMC[this.attachments[_loc13_]];
         if(_loc11_ != undefined)
         {
            var _loc8_ = _loc11_.getBounds(this.weaponMC.attachmentMC);
            var _loc9_ = _loc13_ + 1;
            while(_loc9_ < com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.NUM_ATTACHMENTS)
            {
               var _loc6_ = this.weaponMC.attachmentMC[this.attachments[_loc9_]];
               if(_loc6_ != undefined)
               {
                  var _loc7_ = _loc6_.getBounds(this.weaponMC.attachmentMC);
                  if(_loc8_.xMin < _loc7_.xMax && _loc8_.xMax > _loc7_.xMin && _loc8_.yMin < _loc7_.yMax && _loc8_.yMax > _loc7_.yMin)
                  {
                     var _loc4_ = _loc2_[_loc13_];
                     var _loc3_ = _loc2_[_loc9_];
                     if(_loc4_ == undefined && _loc3_ == undefined)
                     {
                        _loc2_[_loc13_] = _loc10_;
                        _loc2_[_loc9_] = _loc10_;
                        this.attachmentGroups[_loc10_] = [_loc11_,_loc6_];
                        _loc10_ = _loc10_ + 1;
                     }
                     else if(_loc4_ == undefined)
                     {
                        _loc2_[_loc13_] = _loc3_;
                        this.attachmentGroups[_loc3_].push(_loc11_);
                     }
                     else if(_loc3_ == undefined)
                     {
                        _loc2_[_loc9_] = _loc4_;
                        this.attachmentGroups[_loc4_].push(_loc6_);
                     }
                     else if(_loc4_ != _loc3_)
                     {
                        var _loc5_ = 0;
                        while(_loc5_ < _loc2_.length)
                        {
                           if(_loc2_[_loc5_] == _loc3_)
                           {
                              _loc2_[_loc5_] = _loc4_;
                           }
                           _loc5_ = _loc5_ + 1;
                        }
                        this.attachmentGroups[_loc4_] = this.attachmentGroups[_loc4_].concat(this.attachmentGroups[_loc3_]);
                        this.attachmentGroups[_loc3_].length = 0;
                     }
                  }
               }
               _loc9_ = _loc9_ + 1;
            }
         }
         _loc13_ = _loc13_ + 1;
      }
      _loc13_ = 0;
      while(_loc13_ < this.attachmentGroups.length)
      {
         var _loc12_ = this.attachmentGroups[_loc13_];
         if(_loc12_.length > 1)
         {
            _loc9_ = 1;
            while(_loc9_ < _loc12_.length)
            {
               _loc12_[_loc9_]._alpha = 0;
               _loc9_ = _loc9_ + 1;
            }
         }
         _loc13_ = _loc13_ + 1;
      }
   }
   function startAttachmentCycling()
   {
      this.isCyclingAttachments = true;
      var _loc3_ = 0;
      while(_loc3_ < this.attachmentGroups.length)
      {
         var _loc2_ = this.attachmentGroups[_loc3_];
         if(_loc2_.length > 1)
         {
            this.fadeAttachment(_loc2_,_loc2_.length);
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function stopAttachmentCycling()
   {
      this.isCyclingAttachments = false;
   }
   function fadeAttachment(group, index)
   {
      var _loc5_ = group[index % group.length];
      var _loc3_ = group[(index = index + 1) % group.length];
      _loc3_.swapDepths(_loc3_._parent.getNextHighestDepth());
      if(this.isCyclingAttachments)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc5_,com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.ATTACHMENT_FADE_TIME,{delay:com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.ATTACHMENT_WAIT_TIME,_alpha:0});
         com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc3_,com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.ATTACHMENT_FADE_TIME,{delay:com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.ATTACHMENT_WAIT_TIME,_alpha:100,onCompleteScope:this,onComplete:this.fadeAttachment,onCompleteArgs:[group,index]});
      }
   }
}
