pragma solidity ^0.8.6;

contract HocVien {
    //Ho ten
    string public hoTen;
    //Dia Chi
    string public diaChi;
    //So Dien Thoai
    string public soDienThoai;

    //Constructor for Contract HocVien
    constructor() {
        hoTen = '';
        diaChi = '';
        soDienThoai = '';
    }

    /**
     * Function Input Information
     */
    function inputInfomation(string memory _hoTen, string memory _diaChi, 
                            string memory _soDienThoai) public {
        hoTen = _hoTen;
        diaChi = _diaChi;
        soDienThoai = _soDienThoai;
    }

    /**
     * Function Get Information
     */
    function getInformation() public view returns(string memory,string memory,string memory) {
        return(hoTen,diaChi,soDienThoai);
    }
}