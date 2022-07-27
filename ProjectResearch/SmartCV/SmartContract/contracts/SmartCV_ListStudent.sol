// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// Lưu trữ danh sách sinh viên
contract ListStudent {

    // Khai báo cấu trúc lưu trữ thông tin sinh viên
    struct ListSV {
        address studentOwner;
        string name; 
        string phoneNumber; 
        string professionalTitle;
        string email;
        string github;
        string linkedin;
        string sourceImage;
        string password;
    }

    // Khai báo cấu trúc lưu trữ thông tin kĩ năng của sinh viên
    struct ListSkill {
        address studentOwner;
        string title; 
        uint level;
    }

    // Khai báo cấu trúc lưu trữ thông tin học vấn của sinh viên
    struct ListEducation {
        address studentOwner;
        string institution; 
        string focusArea; 
        string startTime;
        string finishTime;
        string gpa;
    }

    // Khai báo các mảng để lưu trữ thông tin
    ListSV[] public listSVs;
    ListSkill[] public listSkills;
    ListEducation[] public listEducations;

    // Chức năng thêm thông tin sinh viên
    function addSV (
        address _studentOwner,
        string memory _name,
        string memory _phoneNumber,
        string memory _professionalTitle,
        string memory _email,
        string memory _github,
        string memory _linkedin,
        string memory _sourceImage,
        string memory _password) public {
            listSVs.push(
                ListSV(_studentOwner, 
                        _name, 
                        _phoneNumber, 
                        _professionalTitle, 
                        _email, 
                        _github, 
                        _linkedin,
                        _sourceImage,
                        _password)
                );
    }

    // Chức năng chỉnh sửa thông tin sinh viên
    function editSV (
        address _studentOwner,
        string memory _name,
        string memory _phoneNumber,
        string memory _professionalTitle,
        string memory _email,
        string memory _github,
        string memory _linkedin,
        string memory _sourceImage) public {
            for(uint i=0; i<listSVs.length;i++){
                if(listSVs[i].studentOwner == _studentOwner){
                    listSVs[i].name = _name;
                    listSVs[i].phoneNumber = _phoneNumber;
                    listSVs[i].professionalTitle = _professionalTitle;
                    listSVs[i].email = _email;
                    listSVs[i].github = _github; 
                    listSVs[i].linkedin = _linkedin;
                    listSVs[i].sourceImage = _sourceImage;
                }
            }
    }

    // Chức năng lấy danh sách sinh viên đã thêm
    function getListSV() public view returns(
        address[] memory, 
        string[] memory, 
        string[] memory, 
        string[] memory, 
        string[] memory, 
        string[] memory, 
        string[] memory, 
        string[] memory) {
            address[] memory studentOwners = new address[](listSVs.length);
            string[] memory names = new string[](listSVs.length);
            string[] memory phoneNumbers = new string[](listSVs.length);
            string[] memory professionalTitles = new string[](listSVs.length);
            string[] memory emails = new string[](listSVs.length);
            string[] memory githubs = new string[](listSVs.length);
            string[] memory linkedins = new string[](listSVs.length);
            string[] memory sourceImages = new string[](listSVs.length);
            for(uint i=0; i<listSVs.length;i++){
                studentOwners[i] = listSVs[i].studentOwner;
                names[i] = listSVs[i].name;
                phoneNumbers[i] = listSVs[i].phoneNumber;
                professionalTitles[i] = listSVs[i].professionalTitle;
                emails[i] = listSVs[i].email;
                githubs[i] = listSVs[i].github;
                linkedins[i] = listSVs[i].linkedin;
                sourceImages[i] = listSVs[i].sourceImage;
            }
            return (studentOwners, names, phoneNumbers, professionalTitles, emails, githubs, linkedins, sourceImages);
    }

    // Chức năng lấy thông tin của sinh viên
    function getProfile(address _studentOwner) public view returns(
        address studentOwner, 
        string memory name, 
        string memory phoneNumber, 
        string memory professionalTitle, 
        string memory email, 
        string memory github, 
        string memory linkedin,
        string memory sourceImage,
        string memory password) {
            for(uint i=0; i<listSVs.length;i++){
                if(listSVs[i].studentOwner == _studentOwner){
                    return (listSVs[i].studentOwner,
                            listSVs[i].name, 
                            listSVs[i].phoneNumber, 
                            listSVs[i].professionalTitle, 
                            listSVs[i].email, 
                            listSVs[i].github, 
                            listSVs[i].linkedin,
                            listSVs[i].sourceImage,
                            listSVs[i].password);
                }
            }
    }

    // Chức năng kiểm tra sinh viên đã đăng ký hay chưa?
    function checkSV(
        address _studentOwner, 
        string memory _password) public view returns(uint x) {
            for(uint i=0; i<listSVs.length; i++){
                if((listSVs[i].studentOwner == _studentOwner) && (keccak256(bytes(listSVs[i].password)) == keccak256(bytes(_password)))){
                    return 1;
                }
            }
    }

    // Chức năng kiểm tra địa chỉ sinh viên đã tồn tại hay chưa?
    function checkExistSV(address _studentOwner) public view returns(uint x) {
            for(uint i=0; i<listSVs.length; i++){
                if(listSVs[i].studentOwner == _studentOwner){
                    return 1;
                }
            }
    }

    // Chức năng thêm thông tin kĩ năng của sinh viên
    function addSkill(
        address _studentOwner,
        string memory _title, 
        uint _level) public {
            require(_level >=0 && _level <=100, "Level of skill incorrect."); //Mức độ của kĩ năng được tính theo thang điểm từ 0 đến 100
            listSkills.push(
                ListSkill(_studentOwner, 
                            _title, 
                            _level)
                );
    }

    // Chức năng chỉnh sửa thông tin kĩ năng của sinh viên
    function editSkill(
        address _studentOwner,
        string memory _title, 
        uint _level) public {
            for(uint i=0; i<listSkills.length;i++){
                if(listSkills[i].studentOwner == _studentOwner){
                    listSkills[i].studentOwner = _studentOwner;
                    listSkills[i].title = _title;
                    listSkills[i].level = _level;
                }
            }
    }

    // Chức năng kiểm tra sinh viên đã thêm kĩ năng đó hay chưa?
    function checkSkill(
        address _studentOwner, 
        string memory _title) public view returns(uint x) {
            for(uint i=0; i<listSkills.length; i++){
                if((listSkills[i].studentOwner == _studentOwner) && (keccak256(bytes(listSkills[i].title)) == keccak256(bytes(_title)))){
                    return 1;
                }
            }
    }

    // Chức năng đếm số lượng kĩ năng của sinh viên
    function checkNumSkill(address _studentOwner) public view returns(uint x) {
            uint _count = 0;
            for(uint i=0; i<listSkills.length; i++){
                if(listSkills[i].studentOwner == _studentOwner){
                    _count += 1;
                }
            }
            return _count;
    }

    // Chức năng lấy thông tin kĩ năng của sinh viên
    function getSkill(address _studentOwner) public view returns(
        string[] memory,
        uint[] memory) {
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

    // Chức năng thêm thông tin học vấn của sinh viên
    function addEducation(
        address _studentOwner,
        string memory _institution,
        string memory _focusArea, 
        string memory _startTime,
        string memory _finishTime,
        string memory _gpa) public {
            listEducations.push(
                ListEducation(_studentOwner, 
                            _institution, 
                            _focusArea,
                            _startTime,
                            _finishTime,
                            _gpa)
                );
    }

    // Chức năng chỉnh sửa thông tin học vấn của sinh viên
    function editEducation(
        address _studentOwner,
        string memory _institution,
        string memory _focusArea, 
        string memory _startTime,
        string memory _finishTime,
        string memory _gpa) public {
            for(uint i=0; i<listEducations.length;i++){
                if(listEducations[i].studentOwner == _studentOwner){
                    listEducations[i].studentOwner = _studentOwner;
                    listEducations[i].institution = _institution;
                    listEducations[i].focusArea = _focusArea;
                    listEducations[i].startTime = _startTime;
                    listEducations[i].finishTime = _finishTime;
                    listEducations[i].gpa = _gpa;
                }
            }
    }

    // Chức năng kiểm tra sinh viên đã thêm học vấn đó hay chưa?
    function checkEducation(
        address _studentOwner, 
        string memory _institution,
        string memory _focusArea) public view returns(uint x) {
            for(uint i=0; i<listEducations.length; i++){
                if((listEducations[i].studentOwner == _studentOwner) && (keccak256(bytes(listEducations[i].institution)) == keccak256(bytes(_institution))) && (keccak256(bytes(listEducations[i].focusArea)) == keccak256(bytes(_focusArea)))){
                    return 1;
                }
            }
    }

    // Chức năng lấy thông tin học vấn của sinh viên
    function getEducation(address _studentOwner) public view returns(
        string[] memory,
        string[] memory,
        string[] memory,
        string[] memory,
        string[] memory) {
            string[] memory institutions = new string[](listEducations.length);
            string[] memory focusAreas = new string[](listEducations.length);
            string[] memory startTimes = new string[](listEducations.length);
            string[] memory finishTimes = new string[](listEducations.length);
            string[] memory gpas = new string[](listEducations.length);
            for(uint i=0; i<listEducations.length;i++){
                if(listEducations[i].studentOwner == _studentOwner) {
                    institutions[i] = listEducations[i].institution;
                    focusAreas[i] = listEducations[i].focusArea;
                    startTimes[i] = listEducations[i].startTime;
                    finishTimes[i] = listEducations[i].finishTime;
                    gpas[i] = listEducations[i].gpa;
                }
            }
            return (institutions, focusAreas, startTimes, finishTimes, gpas);
    }
}