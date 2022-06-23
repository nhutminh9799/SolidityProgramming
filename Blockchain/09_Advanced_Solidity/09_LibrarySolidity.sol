pragma solidity ^0.8.6;

library Search {
   function indexOf(uint[] storage self, uint value) internal view returns (uint) {
      for (uint i = 0; i < self.length; i++)
      {
        if (self[i] == value)
        return i;
      }
      
        return uint(int(-1));
   }
}

/**
 * Using Test Library
 */
contract Test {
   using Search for uint[];
   uint[] public data;

    constructor() {
        data.push(1);
        data.push(2);
        data.push(3);
        data.push(4);
        data.push(5);
    }

   function isValuePresent() external view returns(uint){
      uint value = 4;      
      
      //Now data is representing the Library
      uint index = data.indexOf(value);
      return index;
   }
}