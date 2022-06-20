pragma solidity ^0.8.6;

contract ArrayFixed {

    uint[3] arrayNumber = [1, 2, 3];
     /**
     * Function get Array Number
     */
    function getData() public view returns(uint[3] memory)
    {
        return arrayNumber;
    }
}