class com.rockstargames.ui.utils.BitMask
{
   function BitMask(value)
   {
      if(value != undefined)
      {
         this._bitField = value;
      }
      else
      {
         this._bitField = 0;
      }
   }
   function __set__bitfield(value)
   {
      this._bitField = value;
      return this.__get__bitfield();
   }
   function __get__bitfield()
   {
      return this._bitField;
   }
   function setBit(bitmask)
   {
      this._bitField = this._bitField | bitmask;
   }
   function clearBit(bitmask)
   {
      this._bitField = this._bitField - (this._bitField & bitmask);
   }
   function isBitSet(bitmask)
   {
      return (this._bitField & bitmask) != 0;
   }
   function isBitSetAt(i)
   {
      return this.isBitSet(com.rockstargames.ui.utils.BitMask.BIT(i));
   }
   static function BIT(value)
   {
      return Math.pow(2,value);
   }
}
