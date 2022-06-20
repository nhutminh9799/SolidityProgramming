pragma solidity ^0.8.6;

/**
 * Contract Public Number
 */
contract PublicContractTest {
    //Number public variables
    uint public numberPublic = 3;

    function getNumberPublic() public view returns(uint) {
        return numberPublic;
    }
}

contract UsagePublicContractTest {

    PublicContractTest newContract = new PublicContractTest();

    function getUsageNumberPublic() public view returns(uint) {
    
        return newContract.numberPublic();
    }
}

