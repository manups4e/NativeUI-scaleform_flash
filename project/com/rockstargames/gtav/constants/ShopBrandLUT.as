class com.rockstargames.gtav.constants.ShopBrandLUT
{
   var PREFIX = "sb";
   var HASHTABLE = new Object();
   function ShopBrandLUT()
   {
      var _loc3_ = new Array(0,"SHOP_BRAND_01","brand01");
      var _loc4_ = new Array(1,"SHOP_BRAND_02","brand02");
      var _loc5_ = new Array(2,"SHOP_BRAND_03","brand03");
      var _loc2_ = new Array(3,"SHOP_BRAND_04","brand04");
      this.HASHTABLE = new Object();
      this.HASHTABLE[this.PREFIX + "0"] = _loc3_;
      this.HASHTABLE[this.PREFIX + "1"] = _loc4_;
      this.HASHTABLE[this.PREFIX + "2"] = _loc5_;
      this.HASHTABLE[this.PREFIX + "3"] = _loc2_;
   }
   static function lookUp(i)
   {
      if(com.rockstargames.gtav.constants.ShopBrandLUT._instance == undefined)
      {
         com.rockstargames.gtav.constants.ShopBrandLUT._instance = new com.rockstargames.gtav.constants.ShopBrandLUT();
      }
      return com.rockstargames.gtav.constants.ShopBrandLUT._instance.HASHTABLE[com.rockstargames.gtav.constants.ShopBrandLUT._instance.PREFIX + i];
   }
}
