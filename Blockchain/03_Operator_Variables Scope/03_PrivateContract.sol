pragma solidity ^0.8.6;

/**
 * Contract Private Number
 */
contract PrivateContractTest {
    //Number private variables
    uint private numberPrivate = 3;
    //Number public variables
    uint public numberPublic = 4;
    
    /**
     * Function Get Number Public
     */
    function getNumberPublic() public view returns(uint) {
        return numberPublic;
    }

    /**
     * Function Get Number Private
     */
    function getNumberPrivate() public view returns(uint) {
        return numberPrivate;
    }

}

contract UsagePrivateContractTest {

    PrivateContractTest newContract = new PrivateContractTest();

    function getUsageNumberPublic() public view returns(uint) {
    
        return newContract.numberPublic();
    }

    function getUsageNumberPrivate() public view returns(uint)  {
         return newContract.getNumberPrivate();
    }
}