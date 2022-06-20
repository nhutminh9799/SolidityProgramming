pragma solidity ^0.8.6;

/**
 * Smart Contract use Global Variables
 */
contract GlobalVariablesTest {

    /**
     * Function Get Time Stamp Block in Solidity
     */
    function getTimeStampBlock() public view returns(uint) {
        return block.timestamp;
    }

    /**
     * Function Get Number Block in Solidity
     */
    function getNumberBlock() public view returns(uint) {
        return block.number;
    }

    /**
     * Function Get Difficulty Block in Solidity
     */
    function getDifficultyBlock() public view returns(uint) {
        return block.difficulty;
    }

    /**
     * Function Get Gas Limit Block in Solidity
     */
    function getGasLimit() public view returns(uint) {
        return block.gaslimit;
    }
}