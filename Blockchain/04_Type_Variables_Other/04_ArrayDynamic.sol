pragma solidity ^0.8.6;

contract ArrayDynamic {
    //Array Uint 
    uint[] private arrayNumber;
    
    /**
     * Function Add Number into arrayNumber
     */
    function addNumber(uint num) public 
    {
        arrayNumber.push(num);
    }

    /**
     * Function get Array Number
     */
    function getData() public view returns(uint[] memory)
    {
        return arrayNumber;
    }

    /**
     * Function get length Array
     */
    function getLength() public view returns (uint)
    {
        return arrayNumber.length;
    }
}