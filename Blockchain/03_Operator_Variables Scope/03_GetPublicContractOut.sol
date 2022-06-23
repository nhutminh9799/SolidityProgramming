pragma solidity ^0.8.6;
import "Blockchain/03_Operator_Variables Scope/03_PublicContract.sol";

contract UsagePublicNumberOutside {
    
    PublicContractTest newContract = new PublicContractTest();

    function getOutPublicNumber() view public returns(uint) {
         return newContract.numberPublic();
     }
}