// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

//Lưu trữ danh sách doanh nghiệp
contract ListBusiness {

    //Khai báo cấu trúc lưu trữ thông tin doanh nghiệp
    struct ListDN {
        address businessOwner;
        string name;
        string country;
        string facebook;
        string website;
        string linkedin;
        string focusArea;
        string password;
    }

    //Khai báo mảng để lưu trữ thông tin
    ListDN[] public listDNs;

    //Chức năng thêm thông tin doanh nghiệp
    function addDN (
        address _businessOwner,
        string memory _name,
        string memory _country,
        string memory _facebook,
        string memory _website,
        string memory _linkedin,
        string memory _focusArea,
        string memory _password) public {
            listDNs.push(
                ListDN(_businessOwner, 
                        _name, 
                        _country, 
                        _facebook, 
                        _website, 
                        _linkedin, 
                        _focusArea, 
                        _password)
                );
    }

    //Chức năng lấy danh sách doanh nghiệp đã thêm
    function getListDN() public view returns(
        address[] memory, 
        string[] memory, 
        string[] memory, 
        string[] memory, 
        string[] memory, 
        string[] memory, 
        string[] memory,
        string[] memory) {
            address[] memory businessOwners = new address[](listDNs.length);
            string[] memory names = new string[](listDNs.length);
            string[] memory countrys = new string[](listDNs.length);
            string[] memory facebooks = new string[](listDNs.length);
            string[] memory websites = new string[](listDNs.length);
            string[] memory linkedins = new string[](listDNs.length);
            string[] memory focusAreas = new string[](listDNs.length);
            string[] memory passwords = new string[](listDNs.length);
            for(uint i=0; i<listDNs.length;i++){
                businessOwners[i] = listDNs[i].businessOwner;
                names[i] = listDNs[i].name;
                countrys[i] = listDNs[i].country;
                facebooks[i] = listDNs[i].facebook;
                websites[i] = listDNs[i].website;
                linkedins[i] = listDNs[i].linkedin;
                focusAreas[i] = listDNs[i].focusArea;
                passwords[i] = listDNs[i].password;
            }
            return (businessOwners, names, countrys, facebooks, websites, linkedins, focusAreas, passwords);
    }

    //Chức năng lấy thông tin của doanh nghiệp
    function getProfile(address _businessOwner) public view returns(
        address businessOwner, 
        string memory name, 
        string memory country, 
        string memory facebook, 
        string memory website, 
        string memory linkedin, 
        string memory focusArea) {
            for(uint i=0; i<listDNs.length;i++){
                if(listDNs[i].businessOwner == _businessOwner){
                    return (listDNs[i].businessOwner,
                            listDNs[i].name, 
                            listDNs[i].country, 
                            listDNs[i].facebook, 
                            listDNs[i].website, 
                            listDNs[i].linkedin, 
                            listDNs[i].focusArea);
                }
            }
    }

    //Chức năng kiểm tra doanh nghiệp đã đăng ký hay chưa?
    function checkDN(
        address _businessOwner, 
        string memory _password) public view returns(uint x) {
            for(uint i=0; i<listDNs.length; i++){
                if((listDNs[i].businessOwner == _businessOwner) && (keccak256(bytes(listDNs[i].password)) == keccak256(bytes(_password)))){
                    return 1;
                }
            }
    }
    
}