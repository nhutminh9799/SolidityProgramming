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

    function getListDN() public view returns(address[] memory, string[] memory, string[] memory, string[] memory, string[] memory, string[] memory, string[] memory) {
        address[] memory businessOwners = new address[](listDNs.length);
        string[] memory names = new string[](listDNs.length);
        string[] memory countrys = new string[](listDNs.length);
        string[] memory facebooks = new string[](listDNs.length);
        string[] memory websites = new string[](listDNs.length);
        string[] memory linkedins = new string[](listDNs.length);
        string[] memory focusAreas = new string[](listDNs.length);
        for(uint i=0; i<listDNs.length;i++){
            businessOwners[i] = listDNs[i].businessOwner;
            names[i] = listDNs[i].name;
            countrys[i] = listDNs[i].country;
            facebooks[i] = listDNs[i].facebook;
            websites[i] = listDNs[i].website;
            linkedins[i] = listDNs[i].linkedin;
            focusAreas[i] = listDNs[i].focusArea;
        }
        return (businessOwners, names, countrys, facebooks, websites, linkedins, focusAreas);
    }

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
    
}