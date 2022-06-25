// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./SmartCV_ListStudent.sol";
import "./SmartCV_ListBusiness.sol";
import "./SmartCV_Apply.sol";

//CV dành cho sinh viên
contract Student {

    //Khai báo biến địa chỉ người dùng
    address owner;

    // Khai báo biến số dư của người dùng
    mapping(address=>uint) balances;

    //Khai contract đã import để sử dụng các function ở contract đó
    ListStudent listStudent = new ListStudent();
    ListBusiness listBusiness = new ListBusiness();
    ApplyCV applyCV = new ApplyCV();
    // Business business = new Business();

    // Gán địa chỉ cho người dùng
    constructor () {
        owner =  msg.sender;
    }

    // Kiểm tra địa chỉ người dùng
    function getSender() public view returns (address){
        return owner;
    }

    // ======================================
    // ======= Student Functions ============
    // ======================================

    // Thêm thông tin sinh viên (Đăng ký)
    function addStudentProfile (
        address _studentOwner,
        string memory _name,
        string memory _birthDay,
        string memory _professionalTitle,
        string memory _email,
        string memory _github,
        string memory _linked,
        string memory _password) public {
            listStudent.addSV(_studentOwner, _name, _birthDay, _professionalTitle, _email, _github, _linked, _password);
    }

    function getListStudent(address _studentOwner) public view returns(string memory, string memory, string memory, string memory, string memory, string memory)  {
        return listStudent.getListSV(_studentOwner);
    }

    // Kiểm tra tài khoản người dùng có tồn tại hay không? (Đăng nhập)
    function checkProfile(address _studentOwner, string memory _password) public view returns(uint)  {
        return listStudent.checkStudent(_studentOwner, _password);
    }

    function addSkill (
        address _studentOwner,
        string memory _title, 
        uint _level) public {
            listStudent.addSkill(_studentOwner, _title, _level);
    }

    function getSkill(address _studentOwner) public view returns(string[] memory,uint[] memory)  {
        return listStudent.getSkill(_studentOwner);
    }

    // Gửi CV
    function sendCV(address _studentOwner, address _businessOwner) public {
        applyCV.addCV(_studentOwner, _businessOwner);
    }

    // ======================================
    // ======= Business Functions ===========
    // ======================================

    // Thêm thông tin doanh nghiệp (Đăng ký)
    function addBusinessProfile (
        address _businessOwner,
        string memory _name,
        string memory _country,
        string memory _facebook,
        string memory _website,
        string memory _linkedin,
        string memory _focusArea) public {
            listBusiness.addDN(_businessOwner, _name, _country, _facebook, _website, _linkedin, _focusArea);
    }

    function getListBusiness(address _businessOwner) public view returns(string memory, string memory, string memory, string memory, string memory, string memory)  {
        return listBusiness.getListDN(_businessOwner);
    }

    // // Lấy danh sách CV nộp vào công ty
    function getListCV(address _businessOwner) public view returns(address[] memory, address[] memory)  {
        return applyCV.getCV(_businessOwner);
    }
    

}