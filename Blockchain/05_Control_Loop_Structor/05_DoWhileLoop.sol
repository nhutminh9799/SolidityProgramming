pragma solidity ^0.8.6;

contract DoWhileLoop {
   uint public soDem = 10;

    /**
     * Function Get Count Loop
     */
    function getCountLoop() public view returns(uint) {
       uint countLoop = 0;
       uint soDemTemp = soDem;

       do {
            countLoop++;
            soDemTemp--;
       }while(soDemTemp > 5);

       return countLoop;
   }
}