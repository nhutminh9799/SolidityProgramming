pragma solidity ^0.8.6;

contract StringExample {
 
    // string private message = "Hello world";
    bytes32 private message = "Hello World";
    
    // function getMessage() view public returns(string memory) {
    //     return message;
    // }

    function getMessage() view public returns(bytes32) {
        return message;
    }
}