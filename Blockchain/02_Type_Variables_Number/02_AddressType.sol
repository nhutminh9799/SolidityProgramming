pragma solidity ^0.8.6;

contract AddressTest {

    function getBalance(address myAddress) public view returns(uint){
        return address(myAddress).balance;
    }
}