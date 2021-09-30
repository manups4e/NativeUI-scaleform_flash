class com.rockstargames.ui.utils.BitMonger extends Number
{
   function BitMonger(value)
   {
      super();
      this._bitfield = value == undefined?0:value;
   }
   function __set__bitfield(value)
   {
      this._bitfield = value;
      return this.__get__bitfield();
   }
   function __get__bitfield()
   {
      return this._bitfield;
   }
   function setBit(bit)
   {
      this._bitfield = com.rockstargames.ui.utils.BitMonger.SET_BIT(this._bitfield,bit);
   }
   function clearBit(bit)
   {
      this._bitfield = com.rockstargames.ui.utils.BitMonger.CLEAR_BIT(this._bitfield,bit);
   }
   function isBitSet(bit)
   {
      return com.rockstargames.ui.utils.BitMonger.IS_BIT_SET(this._bitfield,bit);
   }
   function unpackInt(index, width)
   {
      return com.rockstargames.ui.utils.BitMonger.UNPACK_INT(this._bitfield,index,width);
   }
   function packInt(index, width, value)
   {
      this._bitfield = com.rockstargames.ui.utils.BitMonger.PACK_INT(this._bitfield,index,width,value);
   }
   static function BIT(value)
   {
      var _loc3_ = 0;
      var _loc2_ = 0;
      while(_loc2_ < arguments.length)
      {
         _loc3_ = _loc3_ | 1 << arguments[_loc2_];
         _loc2_ = _loc2_ + 1;
      }
      return _loc3_;
   }
   static function SET_BIT(bitfield, bit)
   {
      return bitfield = bitfield | com.rockstargames.ui.utils.BitMonger.BIT(bit);
   }
   static function CLEAR_BIT(bitfield, bit)
   {
      return bitfield = bitfield & (~com.rockstargames.ui.utils.BitMonger.BIT(bit));
   }
   static function IS_BIT_SET(bitfield, bit)
   {
      return (bitfield & com.rockstargames.ui.utils.BitMonger.BIT(bit)) == com.rockstargames.ui.utils.BitMonger.BIT(bit);
   }
   static function UNPACK_INT(bitfield, index, width)
   {
      var _loc1_ = com.rockstargames.ui.utils.BitMonger.BIT(width) - 1;
      return bitfield >> index & _loc1_;
   }
   static function PACK_INT(bitfield, index, width, value)
   {
      var _loc1_ = com.rockstargames.ui.utils.BitMonger.BIT(width) - 1;
      return bitfield = bitfield | (value & _loc1_) << index;
   }
}
