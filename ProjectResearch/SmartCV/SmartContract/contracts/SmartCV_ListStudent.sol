// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

//Lưu trữ danh sách sinh viên
contract ListStudent {

    struct ListSV {
        address studentOwner;
        string name; 
        string birthDay; 
        string professionalTitle;
        string email;
        string github; 
        string linkedin;
        string password;
    }
    struct ListSkill {
        address studentOwner;
        string title; 
        uint level;
    }
    
    ListSV[] public listSVs;
    ListSkill[] public listSkills;

    function addSV (
        address _studentOwner,
        string memory _name,
        string memory _birthDay,
        string memory _professionalTitle,
        string memory _email,
        string memory _github,
        string memory _linked,
        string memory _password) public {
            listSVs.push(ListSV(_studentOwner, _name, _birthDay, _professionalTitle, _email, _github, _linked, _password));
    }

    function getListSV(address _studentOwner) public view returns(string memory name,string memory birthDay,string memory professionalTitle,string memory email,string memory github,string memory linkedin) {
        for(uint i=0; i<listSVs.length;i++){
            if(listSVs[i].studentOwner == _studentOwner){
                return (listSVs[i].name, 
                listSVs[i].birthDay, 
                listSVs[i].professionalTitle, 
                listSVs[i].email, 
                listSVs[i].github, 
                listSVs[i].linkedin);
            } 
        }  
    }

    function checkStudent(address _studentOwner, string memory _password) public view returns(uint x) {
        for(uint i=0; i<listSVs.length;i++){
            if((listSVs[i].studentOwner == _studentOwner) && (keccak256(bytes(listSVs[i].password)) == keccak256(bytes(_password)))){
                return 1;
            }
        }
    }

    function addSkill(
        address _studentOwner,
        string memory _title, 
        uint _level) public {
            require(_level >=0 && _level <=100, "Level of skill incorrect.");
            listSkills.push(ListSkill(_studentOwner, _title, _level));
    }

    function getSkill(address _studentOwner) public view returns(string[] memory,uint[] memory) {
        string[] memory titles = new string[](listSkills.length);
        uint[] memory levels = new uint[](listSkills.length);
        for(uint i=0; i<listSkills.length;i++){
            if(listSkills[i].studentOwner == _studentOwner) {
                titles[i] = listSkills[i].title;
                levels[i] = listSkills[i].level;
            }
        }
        return (titles, levels);
    }
    
}