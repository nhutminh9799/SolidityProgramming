pragma solidity ^0.8.0;

contract SolidityTest {
    function getResult() public view returns(uint){
        uint a = 1;
        uint b = 2;
        uint result = a + b;
        return result;
    }
}
