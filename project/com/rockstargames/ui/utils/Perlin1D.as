class com.rockstargames.ui.utils.Perlin1D
{
   static var SIZE = 256;
   static var MASK = 255;
   function Perlin1D()
   {
      this.perm = new Array(com.rockstargames.ui.utils.Perlin1D.SIZE);
      var _loc2_ = 0;
      while(_loc2_ <= com.rockstargames.ui.utils.Perlin1D.SIZE)
      {
         this.perm[_loc2_] = _loc2_;
         _loc2_ = _loc2_ + 1;
      }
      this.reset();
   }
   function getValue(x)
   {
      var _loc3_ = 1;
      var _loc4_ = 1;
      var _loc5_ = 0;
      var _loc6_ = 0.5;
      var _loc2_ = 0;
      while(_loc2_ < this._numOctaves)
      {
         _loc3_ = _loc3_ * _loc6_;
         _loc5_ = _loc5_ + _loc3_ * (1 + this.noise(_loc4_ * x));
         _loc4_ = _loc4_ << 1;
         _loc2_ = _loc2_ + 1;
      }
      return _loc5_ + _loc3_ - 1;
   }
   function reset()
   {
      this.shuffleArray();
      this._numOctaves = 4;
   }
   function __set__numOctaves(_numOctaves)
   {
      this._numOctaves = _numOctaves;
      return this.__get__numOctaves();
   }
   function noise(x)
   {
      var _loc3_ = x & com.rockstargames.ui.utils.Perlin1D.MASK;
      x = x % 1;
      var _loc4_ = (3 - 2 * x) * x * x;
      return this.lerp(_loc4_,this.grad(this.perm[_loc3_],x),this.grad(this.perm[_loc3_ + 1],x - 1));
   }
   function grad(i, x)
   {
      return !(i & 1)?- x:x;
   }
   function lerp(t, a, b)
   {
      return a + t * (b - a);
   }
   function shuffleArray()
   {
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.ui.utils.Perlin1D.MASK)
      {
         var _loc4_ = Math.random() * (com.rockstargames.ui.utils.Perlin1D.MASK - _loc2_) + _loc2_ + 1;
         var _loc3_ = this.perm.splice(_loc4_,1)[0];
         this.perm.splice(_loc2_,0,_loc3_);
         _loc2_ = _loc2_ + 1;
      }
   }
}
