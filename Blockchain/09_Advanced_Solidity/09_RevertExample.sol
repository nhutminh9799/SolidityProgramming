pragma solidity ^0.8.6;

import "Research/Issue/4_UIntToString.sol";

/**
 * Revert Contract Example
 */
contract RevertExample {

    /**
     * Get Phan So Function
     */
    function getPhanSo(uint256 _tuSo, uint256 _mauSo) external pure returns(string memory) {
       
        if(_mauSo == 0) {
            revert(unicode"Khong dung format");
        }

        string memory tuSo = UIntToString.toString(_tuSo);

        string memory mauSo = UIntToString.toString(_mauSo);

        return string(abi.encodePacked(tuSo,"/",mauSo));
    }
}