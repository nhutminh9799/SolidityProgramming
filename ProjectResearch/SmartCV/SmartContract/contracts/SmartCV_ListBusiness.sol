// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

//Lưu trữ danh sách doanh nghiệp
contract ListBusiness {

    struct ListDN {
        address businessOwner;
        string name; 
        string country; 
        string facebook;
        string website;
        string linkedin;
        string focusArea;
    }

    ListDN[] public listDNs;

    function addDN (
        address _businessOwner,
        string memory _name,
        string memory _country,
        string memory _facebook,
        string memory _website,
        string memory _linkedin,
        string memory _focusArea) public {
            listDNs.push(ListDN(_businessOwner, _name, _country, _facebook, _website, _linkedin, _focusArea));
    }

    function getListDN(address _businessOwner) public view returns(string memory name,string memory country,string memory facebook,string memory website,string memory linkedin,string memory focusArea) {
        for(uint i=0; i<listDNs.length;i++){
            if(listDNs[i].businessOwner == _businessOwner){
                return (listDNs[i].name, 
                listDNs[i].country, 
                listDNs[i].facebook, 
                listDNs[i].website, 
                listDNs[i].linkedin, 
                listDNs[i].focusArea);
            } 
        }  
    }
    
}