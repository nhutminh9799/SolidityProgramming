pragma solidity ^0.8.6;

library UIntToString {

    /**
     * @dev Converts a `uint256` to its ASCII `string` decimal representation.
     */

    function toString(uint256 value) pure internal returns (string memory) {
        if (value == 0) {
            return "0";
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }
}

/**
 * Revert Contract Example
 */
contract RevertExample {

    /**
     * Get Phan So Function
     */
    function getPhanSo(uint256 _tuSo, uint256 _mauSo) external pure returns(string memory) {
       
        if(_mauSo == 0) {
            revert(unicode"Phân số có mẫu khác 0");
        }

        string memory tuSo = UIntToString.toString(_tuSo);

        string memory mauSo = UIntToString.toString(_mauSo);

        return string(abi.encodePacked(tuSo,"/",mauSo));
    }
}