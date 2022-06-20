pragma solidity ^0.8.6;

contract HelloWorld {
 
    string private message = "Hello world";
    
    function getMessage() view public returns(string memory) {
        return message;
    }
}
