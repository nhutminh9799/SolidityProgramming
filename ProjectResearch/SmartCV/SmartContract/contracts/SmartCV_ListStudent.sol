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

    function getListSV() public view returns(address[] memory, string[] memory, string[] memory, string[] memory, string[] memory, string[] memory, string[] memory, string[] memory) {
        address[] memory studentOwners = new address[](listSVs.length);
        string[] memory names = new string[](listSVs.length);
        string[] memory birthDays = new string[](listSVs.length);
        string[] memory professionalTitles = new string[](listSVs.length);
        string[] memory emails = new string[](listSVs.length);
        string[] memory githubs = new string[](listSVs.length);
        string[] memory linkedins = new string[](listSVs.length);
        string[] memory passwords = new string[](listSVs.length);
        for(uint i=0; i<listSVs.length;i++){
            studentOwners[i] = listSVs[i].studentOwner;
            names[i] = listSVs[i].name;
            birthDays[i] = listSVs[i].birthDay;
            professionalTitles[i] = listSVs[i].professionalTitle;
            emails[i] = listSVs[i].email;
            githubs[i] = listSVs[i].github;
            linkedins[i] = listSVs[i].linkedin;
            passwords[i] = listSVs[i].password;
        }
        return (studentOwners, names, birthDays, professionalTitles, emails, githubs, linkedins, passwords);
    }

    function getProfile(address _studentOwner) public view returns(
        address studentOwner, 
        string memory name, 
        string memory birthDay, 
        string memory professionalTitle, 
        string memory email, 
        string memory github, 
        string memory linkedin,
        string memory password) {
            for(uint i=0; i<listSVs.length;i++){
                if(listSVs[i].studentOwner == _studentOwner){
                    return (listSVs[i].studentOwner,
                            listSVs[i].name, 
                            listSVs[i].birthDay, 
                            listSVs[i].professionalTitle, 
                            listSVs[i].email, 
                            listSVs[i].github, 
                            listSVs[i].linkedin,
                            listSVs[i].password);
                }
            }
    }

    function checkSV(address _studentOwner, string memory _password) public view returns(uint x) {
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