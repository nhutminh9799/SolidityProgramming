pragma solidity ^0.8.6;

contract WhileLoop {
   uint public soDem = 10;

    /**
     * Function Get Count Loop
     */
    function getCountLoop() public view returns(uint) {
       uint countLoop = 0;
       uint soDemTemp = soDem;
       while(soDemTemp > 5) {
            countLoop++;
            soDemTemp--;
       }
       return countLoop;
   }
}