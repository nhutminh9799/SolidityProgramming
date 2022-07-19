// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// Lưu trữ danh sách IIG
contract ListIIG {

    // Khai báo cấu trúc lưu trữ thông tin IIG
    struct IIGInfo {
        address iigOwner;
        string name;
        string country;
        string facebook;
        string website;
        string linkedin;
        string password;
    }

    // Khai báo cấu trúc lưu trữ thông tin điểm thi Listening - Reading IIG
    struct IIGLRResult {
        address iigOwner;
        address studentOwner;
        string testDate;
        uint listeningScore;
        uint readingScore;
        uint totalScore;
    }

    // Khai báo cấu trúc lưu trữ thông tin điểm thi Speaking - Writing IIG
    struct IIGSWResult {
        address iigOwner;
        address studentOwner;
        string testDate;
        uint speakingScore;
        uint writingScore;
        uint totalScore;
    }


    // Khai báo mảng để lưu trữ thông tin
    IIGInfo[] public iigInfos;
    IIGLRResult[] public iigLRResults;
    IIGSWResult[] public iigSWResults;

    // Chức năng thêm thông tin IGG
    function addIIG (
        address _iigOwner,
        string memory _name,
        string memory _country,
        string memory _facebook,
        string memory _website,
        string memory _linkedin,
        string memory _password) public {
            iigInfos.push(
                IIGInfo(_iigOwner, 
                        _name, 
                        _country, 
                        _facebook, 
                        _website, 
                        _linkedin, 
                        _password)
                );
    }

    // Chức năng lấy danh sách IIG đã thêm
    function getListIIG() public view returns(
        address[] memory, 
        string[] memory, 
        string[] memory, 
        string[] memory, 
        string[] memory, 
        string[] memory, 
        string[] memory) {
            address[] memory iigOwners = new address[](iigInfos.length);
            string[] memory names = new string[](iigInfos.length);
            string[] memory countrys = new string[](iigInfos.length);
            string[] memory facebooks = new string[](iigInfos.length);
            string[] memory websites = new string[](iigInfos.length);
            string[] memory linkedins = new string[](iigInfos.length);
            string[] memory passwords = new string[](iigInfos.length);
            for(uint i=0; i<iigInfos.length;i++){
                iigOwners[i] = iigInfos[i].iigOwner;
                names[i] = iigInfos[i].name;
                countrys[i] = iigInfos[i].country;
                facebooks[i] = iigInfos[i].facebook;
                websites[i] = iigInfos[i].website;
                linkedins[i] = iigInfos[i].linkedin;
                passwords[i] = iigInfos[i].password;
            }
            return (iigOwners, names, countrys, facebooks, websites, linkedins, passwords);
    }

    // Chức năng lấy thông tin của IIG
    function getProfile(address _iigOwner) public view returns(
        address iigOwner, 
        string memory name, 
        string memory country, 
        string memory facebook, 
        string memory website, 
        string memory linkedin) {
            for(uint i=0; i<iigInfos.length;i++){
                if(iigInfos[i].iigOwner == _iigOwner){
                    return (iigInfos[i].iigOwner,
                            iigInfos[i].name, 
                            iigInfos[i].country, 
                            iigInfos[i].facebook, 
                            iigInfos[i].website, 
                            iigInfos[i].linkedin);
                }
            }
    }

    // Chức năng kiểm tra IIG đã đăng ký hay chưa?
    function checkIIG(
        address _iigOwner, 
        string memory _password) public view returns(uint x) {
            for(uint i=0; i<iigInfos.length; i++){
                if((iigInfos[i].iigOwner == _iigOwner) && (keccak256(bytes(iigInfos[i].password)) == keccak256(bytes(_password)))){
                    return 1;
                }
            }
    }

    // Chức năng kiểm tra địa chỉ IIG đã tồn tại hay chưa?
    function checkExistIIG(address _iigOwner) public view returns(uint x) {
            for(uint i=0; i<iigInfos.length; i++){
                if(iigInfos[i].iigOwner == _iigOwner){
                    return 1;
                }
            }
    }

    // Chức năng thêm thông tin điểm thi Listening - Reading (Kiểm tra có nhập nhiều lần thi của 1 sinh viên chung 1 ngày không?)
    function addLRResult (
        address _iigOwner,
        address _studentOwner,
        string memory _testDate,
        uint _listeningScore,
        uint _readingScore) public {
            require(_listeningScore >=0 && _listeningScore <=495, "Listening Score incorrect.");
            require(_readingScore >=0 && _readingScore <=495, "Reading Score incorrect.");
            iigLRResults.push(
                IIGLRResult(_iigOwner, 
                        _studentOwner, 
                        _testDate, 
                        _listeningScore, 
                        _readingScore,
                        (_listeningScore + _readingScore))
                );
    }

    // Chức năng lấy danh sách điểm thi Listening - Reading đã thêm
    function getListLRResult(address _iigOwner) public view returns(
        address[] memory,
        address[] memory,
        string[] memory,
        uint[] memory,
        uint[] memory,
        uint[] memory) {
            address[] memory iigOwners = new address[](iigLRResults.length);
            address[] memory studentOwners = new address[](iigLRResults.length);
            string[] memory testDates = new string[](iigLRResults.length);
            uint[] memory listeningScores = new uint[](iigLRResults.length);
            uint[] memory readingScores = new uint[](iigLRResults.length);
            uint[] memory totalScores = new uint[](iigLRResults.length);
            for(uint i=0; i<iigLRResults.length;i++){
                if(iigLRResults[i].iigOwner == _iigOwner){
                    iigOwners[i] = iigLRResults[i].iigOwner;
                    studentOwners[i] = iigLRResults[i].studentOwner;
                    testDates[i] = iigLRResults[i].testDate;
                    listeningScores[i] = iigLRResults[i].listeningScore;
                    readingScores[i] = iigLRResults[i].readingScore;
                    totalScores[i] = iigLRResults[i].totalScore;
                }
            }
            return (iigOwners, studentOwners, testDates, listeningScores, readingScores, totalScores);
    }

    // Chức năng lấy thông tin điểm thi Listening - Reading
    function getRCResult(address _studentOwner) public view returns(
        address studentOwners,
        uint maxScore) {
            uint[] memory totalScores = new uint[](iigLRResults.length);
            for(uint i=0; i<iigLRResults.length;i++){
                if(iigLRResults[i].studentOwner == _studentOwner){
                    totalScores[i] = iigLRResults[i].totalScore;
                }
            }
            maxScore = totalScores[0];
            for(uint i=1; i<totalScores.length;i++){
                if(maxScore < totalScores[i]){
                    maxScore = totalScores[i];
                }
            }
            return (_studentOwner, maxScore);
    }

    // Chức năng thêm thông tin điểm thi Speaking - Writing
    function addSWResult (
        address _iigOwner,
        address _studentOwner,
        string memory _testDate,
        uint _speakingScore,
        uint _writingScore) public {
            require(_speakingScore >=0 && _speakingScore <=200, "Speaking Score incorrect.");
            require(_writingScore >=0 && _writingScore <=200, "Writing Score incorrect.");
            iigSWResults.push(
                IIGSWResult(_iigOwner, 
                        _studentOwner, 
                        _testDate, 
                        _speakingScore, 
                        _writingScore,
                        (_speakingScore + _writingScore))
                );
    }

    // Chức năng lấy danh sách điểm thi Speaking - Writing đã thêm
    function getListSWResult(address _iigOwner) public view returns(
        address[] memory,
        address[] memory,
        string[] memory,
        uint[] memory,
        uint[] memory,
        uint[] memory) {
            address[] memory iigOwners = new address[](iigSWResults.length);
            address[] memory studentOwners = new address[](iigSWResults.length);
            string[] memory testDates = new string[](iigSWResults.length);
            uint[] memory speakingScores = new uint[](iigSWResults.length);
            uint[] memory writingScores = new uint[](iigSWResults.length);
            uint[] memory totalScores = new uint[](iigSWResults.length);
            for(uint i=0; i<iigSWResults.length;i++){
                if(iigSWResults[i].iigOwner == _iigOwner){
                    iigOwners[i] = iigSWResults[i].iigOwner;
                    studentOwners[i] = iigSWResults[i].studentOwner;
                    testDates[i] = iigSWResults[i].testDate;
                    speakingScores[i] = iigSWResults[i].speakingScore;
                    writingScores[i] = iigSWResults[i].writingScore;
                    totalScores[i] = iigSWResults[i].totalScore;
                }
            }
            return (iigOwners, studentOwners, testDates, speakingScores, writingScores, totalScores);
    }

    // Chức năng lấy thông tin điểm thi Speaking - Writing
    function getSWResult(address _studentOwner) public view returns(
        address studentOwners,
        uint maxScore) {
            uint[] memory totalScores = new uint[](iigSWResults.length);
            for(uint i=0; i<iigSWResults.length;i++){
                if(iigSWResults[i].studentOwner == _studentOwner){
                    totalScores[i] = iigSWResults[i].totalScore;
                }
            }
            maxScore = totalScores[0];
            for(uint i=1; i<totalScores.length;i++){
                if(maxScore < totalScores[i]){
                    maxScore = totalScores[i];
                }
            }
            return (_studentOwner, maxScore);
    }
    
}