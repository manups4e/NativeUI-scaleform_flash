class com.rockstargames.gtav.constants.HeistCrewMemberLUT
{
   var PREFIX = "cm";
   var HASHTABLE = new Object();
   function HeistCrewMemberLUT()
   {
      var _loc26_ = new Array(0,"CM_EMPTY","Empty");
      var _loc19_ = new Array(1,"CM_GUNMAN_G_GUSTAV","Gunman");
      var _loc22_ = new Array(2,"CM_GUNMAN_G_KARL","Gunman");
      var _loc12_ = new Array(3,"CM_GUNMAN_M_HUGH","Gunman");
      var _loc5_ = new Array(4,"CM_GUNMAN_B_NORM","Gunman");
      var _loc13_ = new Array(5,"CM_GUNMAN_B_DARYL","Gunman");
      var _loc23_ = new Array(6,"CM_HACKER_G_PAIGE","Hacker");
      var _loc7_ = new Array(7,"CM_HACKER_M_CHRIS","Hacker");
      var _loc8_ = new Array(8,"CM_DRIVER_G_EDDIE","Driver");
      var _loc4_ = new Array(9,"CM_DRIVER_M_KARIM","Driver");
      var _loc27_ = new Array(10,"CM_GUNMAN_G_PACKIE_UNLOCK","Gunman");
      var _loc28_ = new Array(11,"CM_GUNMAN_G_CHEF_UNLOCK","Gunman");
      var _loc17_ = new Array(12,"CM_HACKER_B_RICKIE_UNLOCK","Hacker");
      var _loc24_ = new Array(13,"CM_DRIVER_G_TALINA_UNLOCK","Driver");
      var _loc25_ = new Array(14,"CM_GUNMAN_G_GUSTAV_S","Gunman");
      var _loc20_ = new Array(15,"CM_GUNMAN_G_KARL_S","Gunman");
      var _loc2_ = new Array(16,"CM_GUNMAN_M_HUGH_S","Gunman");
      var _loc15_ = new Array(17,"CM_GUNMAN_B_NORM_S","Gunman");
      var _loc9_ = new Array(18,"CM_GUNMAN_B_DARYL_S","Gunman");
      var _loc3_ = new Array(19,"CM_HACKER_G_PAIGE_S","Hacker");
      var _loc6_ = new Array(20,"CM_HACKER_M_CHRIS_S","Hacker");
      var _loc11_ = new Array(21,"CM_DRIVER_G_EDDIE_S","Driver");
      var _loc10_ = new Array(22,"CM_DRIVER_M_KARIM_S","Driver");
      var _loc18_ = new Array(23,"CM_GUNMAN_G_PACKIE_UNLOCK_S","Gunman");
      var _loc16_ = new Array(24,"CM_GUNMAN_G_CHEF_UNLOCK_S","Gunman");
      var _loc14_ = new Array(25,"CM_HACKER_B_RICKIE_UNLOCK_S","Hacker");
      var _loc21_ = new Array(26,"CM_DRIVER_G_TALINA_UNLOCK_S","Driver");
      this.HASHTABLE = new Object();
      this.HASHTABLE[this.PREFIX + _loc26_[0].toString()] = _loc26_;
      this.HASHTABLE[this.PREFIX + _loc19_[0].toString()] = _loc19_;
      this.HASHTABLE[this.PREFIX + _loc22_[0].toString()] = _loc22_;
      this.HASHTABLE[this.PREFIX + _loc12_[0].toString()] = _loc12_;
      this.HASHTABLE[this.PREFIX + _loc5_[0].toString()] = _loc5_;
      this.HASHTABLE[this.PREFIX + _loc13_[0].toString()] = _loc13_;
      this.HASHTABLE[this.PREFIX + _loc23_[0].toString()] = _loc23_;
      this.HASHTABLE[this.PREFIX + _loc7_[0].toString()] = _loc7_;
      this.HASHTABLE[this.PREFIX + _loc8_[0].toString()] = _loc8_;
      this.HASHTABLE[this.PREFIX + _loc4_[0].toString()] = _loc4_;
      this.HASHTABLE[this.PREFIX + _loc27_[0].toString()] = _loc27_;
      this.HASHTABLE[this.PREFIX + _loc28_[0].toString()] = _loc28_;
      this.HASHTABLE[this.PREFIX + _loc17_[0].toString()] = _loc17_;
      this.HASHTABLE[this.PREFIX + _loc24_[0].toString()] = _loc24_;
      this.HASHTABLE[this.PREFIX + _loc25_[0].toString()] = _loc25_;
      this.HASHTABLE[this.PREFIX + _loc20_[0].toString()] = _loc20_;
      this.HASHTABLE[this.PREFIX + _loc2_[0].toString()] = _loc2_;
      this.HASHTABLE[this.PREFIX + _loc15_[0].toString()] = _loc15_;
      this.HASHTABLE[this.PREFIX + _loc9_[0].toString()] = _loc9_;
      this.HASHTABLE[this.PREFIX + _loc3_[0].toString()] = _loc3_;
      this.HASHTABLE[this.PREFIX + _loc6_[0].toString()] = _loc6_;
      this.HASHTABLE[this.PREFIX + _loc11_[0].toString()] = _loc11_;
      this.HASHTABLE[this.PREFIX + _loc10_[0].toString()] = _loc10_;
      this.HASHTABLE[this.PREFIX + _loc18_[0].toString()] = _loc18_;
      this.HASHTABLE[this.PREFIX + _loc16_[0].toString()] = _loc16_;
      this.HASHTABLE[this.PREFIX + _loc14_[0].toString()] = _loc14_;
      this.HASHTABLE[this.PREFIX + _loc21_[0].toString()] = _loc21_;
   }
   static function lookUp(i)
   {
      if(com.rockstargames.gtav.constants.HeistCrewMemberLUT._instance == undefined)
      {
         com.rockstargames.gtav.constants.HeistCrewMemberLUT._instance = new com.rockstargames.gtav.constants.HeistCrewMemberLUT();
      }
      return com.rockstargames.gtav.constants.HeistCrewMemberLUT._instance.HASHTABLE[com.rockstargames.gtav.constants.HeistCrewMemberLUT._instance.PREFIX + i];
   }
}
