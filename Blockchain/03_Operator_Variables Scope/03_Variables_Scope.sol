pragma solidity ^0.8.6;

/**
* Smart Contract About Variables Scope Test
*/
contract VariablesScopeTest {
    uint soNguyenContract = 1; //States Variables

    /**
     * Function Goi So Nguyen
     */
    function goiSoNguyen() public view returns(uint) {
        uint soNguyenFunction = 2; //Local Variables
        return soNguyenContract + soNguyenFunction;
    }
}
