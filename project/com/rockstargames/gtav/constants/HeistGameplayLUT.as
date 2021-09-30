class com.rockstargames.gtav.constants.HeistGameplayLUT
{
   var PREFIX = "gp";
   var HASHTABLE = new Object();
   function HeistGameplayLUT()
   {
      var _loc3_ = new Array(0,"GP_EMPTY","empty");
      var _loc5_ = new Array(1,"PBC_JEWEL_STEALTH","stealth");
      var _loc8_ = new Array(2,"PBC_JEWEL_HIGH_IMPACT","highimpact");
      var _loc11_ = new Array(3,"PBC_DOCKS_SELL_TO_A","selltoa");
      var _loc2_ = new Array(4,"PBC_DOCKS_SELL_TO_B","selltob");
      var _loc6_ = new Array(5,"PBC_RURAL_NO_TANK","notank");
      var _loc10_ = new Array(6,"PBC_AGENCY_FIRETRUCK","firetruck");
      var _loc9_ = new Array(7,"PBC_AGENCY_HELICOPTER","heli");
      var _loc4_ = new Array(8,"PBC_FINALE_TRAFFCONT","traffic");
      var _loc7_ = new Array(9,"PBC_FINALE_HELI","heli");
      this.HASHTABLE = new Object();
      this.HASHTABLE[this.PREFIX + "0"] = _loc3_;
      this.HASHTABLE[this.PREFIX + "1"] = _loc5_;
      this.HASHTABLE[this.PREFIX + "2"] = _loc8_;
      this.HASHTABLE[this.PREFIX + "3"] = _loc11_;
      this.HASHTABLE[this.PREFIX + "4"] = _loc2_;
      this.HASHTABLE[this.PREFIX + "5"] = _loc6_;
      this.HASHTABLE[this.PREFIX + "6"] = _loc10_;
      this.HASHTABLE[this.PREFIX + "7"] = _loc9_;
      this.HASHTABLE[this.PREFIX + "8"] = _loc4_;
      this.HASHTABLE[this.PREFIX + "9"] = _loc7_;
   }
   static function lookUp(i)
   {
      if(com.rockstargames.gtav.constants.HeistGameplayLUT._instance == undefined)
      {
         com.rockstargames.gtav.constants.HeistGameplayLUT._instance = new com.rockstargames.gtav.constants.HeistGameplayLUT();
      }
      return com.rockstargames.gtav.constants.HeistGameplayLUT._instance.HASHTABLE[com.rockstargames.gtav.constants.HeistGameplayLUT._instance.PREFIX + i];
   }
}
