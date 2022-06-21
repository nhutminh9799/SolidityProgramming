pragma solidity ^0.8.6;

contract RequireTest {
   

    /**
     * Tinh Tong a > b
     */
    function tinhTong(uint a, uint b) public view returns(uint) {
        require(a > b, unicode"Số a phải lớn hơn số b");
        uint tong = a + b;
        return tong;
    }
}