pragma solidity ^0.8.6;

library Search {
   function indexOf(uint[] storage self, uint value) public view returns (uint) {
      for (uint i = 0; i < self.length; i++)
      {
        if (self[i] == value)
        return i;
      }
      
        return uint(int(-1));
   }
}
