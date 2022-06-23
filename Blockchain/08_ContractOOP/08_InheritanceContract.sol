pragma solidity ^0.8.6;

/**
 * Contract Hoc Vien
 */
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
                            string memory _soDienThoai) virtual public {
        hoTen = _hoTen;
        diaChi = _diaChi;
        soDienThoai = _soDienThoai;
    }

    /**
     * Function Get Information
     */
    function getInformation() virtual public view returns(string memory) {
        string memory result = string(abi.encodePacked(hoTen,"-", diaChi,"-",soDienThoai));
        return(result);
    }
}

/**
 * Contract Hoc Vien Van Bang 2
 */
contract HocVienVanBang2 is HocVien {
    //Thoi gian hoc tap
    uint public thoiGianHoc;

     //Constructor for HocVienBang2
    constructor() {
        thoiGianHoc = 0;
    }

     /**
     * Function Input Information
     */
    function inputInfomation(string memory _hoTen, string memory _diaChi, 
                            string memory _soDienThoai, uint _thoiGianHoc) public{
        super.inputInfomation(_hoTen,_diaChi,_soDienThoai);
        thoiGianHoc = _thoiGianHoc;
    }

    /**
     * Function Get Information
     */
    function getInformationHocVienVB2() public view returns(string memory, uint) {
        string memory result = super.getInformation();
        return (result,thoiGianHoc);
    }
}

/**
 * Contract Dang Ky HocVien
 */
contract DangKyHoc {

    HocVien[] public hocVienList;

    HocVienVanBang2[] public hocVienVB2List;

    /**
     * Function Dang Ky Voi Hoc Sinh Binh Thuong
     */
    function dangKyHocCoBan(string memory _hoTen, string memory _diaChi, 
                            string memory _soDienThoai) public {
        HocVien  hocvien = new HocVien();
        hocvien.inputInfomation(_hoTen, _diaChi, _soDienThoai);
        hocVienList.push(hocvien);
    }

    /**
     * Function Dang Ky Voi Hoc Sinh Van Bang 2
     */
    function dangKyHocVB2(string memory _hoTen, string memory _diaChi, 
                            string memory _soDienThoai, uint _thoiGianHoc) public {
        HocVienVanBang2 hocvienVB2 = new HocVienVanBang2();
        hocvienVB2.inputInfomation(_hoTen, _diaChi, _soDienThoai, _thoiGianHoc);
        hocVienVB2List.push(hocvienVB2);
    }

    /**
     * Get Information Hoc Vien Co Ban
     */
    function getInformationCoBan(uint _index) public view returns(string memory) {
        string memory result = hocVienList[_index].getInformation();
        return result;
    }

    /**
     * Get Information Hoc Vien Van Bang 2
     */
    function getInformationVB2(uint _index) public view returns(string memory, uint) {
        return hocVienVB2List[_index].getInformationHocVienVB2();
    }
} 