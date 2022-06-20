pragma solidity ^0.8.6;

contract ForLoop {
   uint public soDem = 10;

    /**
     * Function Get Count Loop
     */
    function getCountLoop() public view returns(uint) {
        uint countLoop = 0;
        uint soDemTemp = soDem;
        for(uint i = 0; i  < soDemTemp; i++) {
            countLoop++;
        }
       return countLoop;
   }
}