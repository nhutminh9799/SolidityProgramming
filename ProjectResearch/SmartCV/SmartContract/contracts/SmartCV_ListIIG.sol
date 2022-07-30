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

    // Khai báo cấu trúc lưu trữ thông tin yêu cầu chứng chỉ IIG của sinh viên
    struct IIGRequest {
        bytes4 codeRequest;
        address studentOwner;
        address iigOwner;
        string identityCard;
        string requestDate;
        string statusRequest;
    }

    // Khai báo cấu trúc lưu trữ thông tin điểm thi Listening - Reading IIG
    struct IIGLRResult {
        bytes4 codeLRResult;
        address iigOwner;
        address studentOwner;
        string testDate;
        uint shiftTest;
        string expireDate;
        uint listeningScore;
        uint readingScore;
        uint totalScore;
    }

    // Khai báo cấu trúc lưu trữ thông tin điểm thi Speaking - Writing IIG
    struct IIGSWResult {
        bytes4 codeSWResult;
        address iigOwner;
        address studentOwner;
        string testDate;
        uint shiftTest;
        string expireDate;
        uint speakingScore;
        uint writingScore;
        uint totalScore;
    }

    // Khai báo mảng để lưu trữ thông tin
    IIGInfo[] public iigInfos;
    IIGRequest[] public iigRequests;
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

    // Chức năng chỉnh sửa thông tin IGG
    function editIIG (
        address _iigOwner,
        string memory _name,
        string memory _country,
        string memory _facebook,
        string memory _website,
        string memory _linkedin) public {
            for(uint i=0; i<iigInfos.length;i++){
                if(iigInfos[i].iigOwner == _iigOwner){
                    iigInfos[i].name = _name;
                    iigInfos[i].country = _country;
                    iigInfos[i].facebook = _facebook;
                    iigInfos[i].website = _website;
                    iigInfos[i].linkedin = _linkedin;
                }
            }
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

    // Chức năng thêm thông tin yêu cầu chứng chỉ IIG
    function addRequest (
        address _studentOwner,
        address _iigOwner,
        string memory _identityCard,
        string memory _requestDate) public {
            require(checkRequest(_studentOwner, _iigOwner) == 0, "Waiting for confirmation.");
            iigRequests.push(
                IIGRequest(bytes4(keccak256(abi.encodePacked(_requestDate))),
                        _studentOwner, 
                        _iigOwner,
                        _identityCard,
                        _requestDate,
                        "Waiting")
                );
    }

    // Chức năng lấy danh sách yêu cầu chứng chỉ IIG
    function getListRequest(address _iigOwner) public view returns(
        bytes4[] memory,
        address[] memory, 
        address[] memory,
        string[] memory,
        string[] memory,
        string[] memory) {
            bytes4[] memory codeRequests = new bytes4[](iigRequests.length);
            address[] memory studentOwners = new address[](iigRequests.length);
            address[] memory iigOwners = new address[](iigRequests.length);
            string[] memory identityCards = new string[](iigRequests.length);
            string[] memory requestDates = new string[](iigRequests.length);
            string[] memory statusRequests = new string[](iigRequests.length);
            for(uint i=0; i<iigRequests.length;i++){
                if(iigRequests[i].iigOwner == _iigOwner){
                    codeRequests[i] = iigRequests[i].codeRequest;
                    studentOwners[i] = iigRequests[i].studentOwner;
                    iigOwners[i] = iigRequests[i].iigOwner;
                    identityCards[i] = iigRequests[i].identityCard;
                    requestDates[i] = iigRequests[i].requestDate;
                    statusRequests[i] = iigRequests[i].statusRequest;
                }
            }
            return (codeRequests, studentOwners, iigOwners, identityCards, requestDates, statusRequests);
    }

    // Chức năng lấy danh sách yêu cầu chứng chỉ IIG theo sinh viên
    function getListRequestStudent(address _iigOwner, address _studentOwner) public view returns(
        bytes4[] memory,
        address[] memory, 
        address[] memory,
        string[] memory,
        string[] memory,
        string[] memory) {
            bytes4[] memory codeRequests = new bytes4[](iigRequests.length);
            address[] memory studentOwners = new address[](iigRequests.length);
            address[] memory iigOwners = new address[](iigRequests.length);
            string[] memory identityCards = new string[](iigRequests.length);
            string[] memory requestDates = new string[](iigRequests.length);
            string[] memory statusRequests = new string[](iigRequests.length);
            for(uint i=0; i<iigRequests.length;i++){
                if((iigRequests[i].iigOwner == _iigOwner) && (iigRequests[i].studentOwner == _studentOwner)){
                    codeRequests[i] = iigRequests[i].codeRequest;
                    studentOwners[i] = iigRequests[i].studentOwner;
                    iigOwners[i] = iigRequests[i].iigOwner;
                    identityCards[i] = iigRequests[i].identityCard;
                    requestDates[i] = iigRequests[i].requestDate;
                    statusRequests[i] = iigRequests[i].statusRequest;
                }
            }
            return (codeRequests, studentOwners, iigOwners, identityCards, requestDates, statusRequests);
    }

    //Chức năng kiểm tra yêu cầu chứng chỉ IIG
    function checkRequest(
        address _studentOwner, 
        address _iigOwner) public view returns(uint x) {
            for(uint i=0; i<iigRequests.length; i++){
                if((iigRequests[i].studentOwner == _studentOwner) && (iigRequests[i].iigOwner == _iigOwner) && (keccak256(bytes(iigRequests[i].statusRequest)) == keccak256(bytes("Waiting")))){
                    return 1;
                }
            }
    }

    //Chức năng duyệt yêu cầu chứng chỉ IIG
    function confirmRequest(
        address _studentOwner, 
        address _iigOwner,
        bytes4 _codeRequest,
        string memory _statusRequest) public {
            require(keccak256(bytes(_statusRequest)) == keccak256(bytes("Accepted")) || keccak256(bytes(_statusRequest)) == keccak256(bytes("Declined")), "Status Request incorrect.");
            for(uint i=0; i<iigRequests.length; i++){
                if((iigRequests[i].studentOwner == _studentOwner) && (iigRequests[i].iigOwner == _iigOwner) && (iigRequests[i].codeRequest == _codeRequest)){
                    iigRequests[i].statusRequest = _statusRequest;
                }
            }
    }

    // Chức năng thêm thông tin điểm thi Listening - Reading (Kiểm tra có nhập nhiều lần thi của 1 sinh viên chung 1 ngày không?)
    function addLRResult (
        address _iigOwner,
        address _studentOwner,
        string memory _testDate,
        uint _shiftTest,
        string memory _expireDate,
        uint _listeningScore,
        uint _readingScore) public {
            require(checkExistIIG(_iigOwner) == 1, "Not found owner.");
            require(checkExistLRResult(_studentOwner, _testDate, _shiftTest) == 0, "Duplicate LR Result.");
            require(_shiftTest == 1 || _shiftTest == 2 || _shiftTest == 3 || _shiftTest == 4, "Shift Test incorrect.");
            require(_listeningScore >=0 && _listeningScore <=495, "Listening Score incorrect.");
            require(_readingScore >=0 && _readingScore <=495, "Reading Score incorrect.");
            iigLRResults.push(
                IIGLRResult(bytes4(keccak256(abi.encodePacked(_testDate, _shiftTest))),
                        _iigOwner, 
                        _studentOwner, 
                        _testDate,
                        _shiftTest,
                        _expireDate,
                        _listeningScore, 
                        _readingScore,
                        (_listeningScore + _readingScore))
                );
    }

    // Chức năng lấy danh sách điểm thi Listening - Reading đã thêm
    function getListLRResult(
        address _iigOwner, 
        address _studentOwner) public view returns(
            string[] memory,
            uint[] memory,
            string[] memory,
            uint[] memory,
            uint[] memory,
            uint[] memory) {
                string[] memory testDates = new string[](iigLRResults.length);
                uint[] memory shiftTests = new uint[](iigLRResults.length);
                string[] memory expireDates = new string[](iigLRResults.length);
                uint[] memory listeningScores = new uint[](iigLRResults.length);
                uint[] memory readingScores = new uint[](iigLRResults.length);
                uint[] memory totalScores = new uint[](iigLRResults.length);
                for(uint i=0; i<iigLRResults.length;i++){
                    if((iigLRResults[i].iigOwner == _iigOwner) && (iigLRResults[i].studentOwner == _studentOwner)){
                        testDates[i] = iigLRResults[i].testDate;
                        shiftTests[i] = iigLRResults[i].shiftTest;
                        expireDates[i] = iigLRResults[i].expireDate;
                        listeningScores[i] = iigLRResults[i].listeningScore;
                        readingScores[i] = iigLRResults[i].readingScore;
                        totalScores[i] = iigLRResults[i].totalScore;
                    }
                }
                return (testDates, shiftTests, expireDates, listeningScores, readingScores, totalScores);
    }

    // Chức năng lấy điểm thi Listening - Reading của sinh viên
    function getLRResult(
        address _iigOwner, 
        address _studentOwner,
        string memory _testDate,
        uint _shiftTest) public view returns(
            string memory testDate,
            uint shiftTest,
            string memory expireDate,
            uint listeningScore,
            uint readingScore,
            uint totalScore) {
                for(uint i=0; i<iigLRResults.length;i++){
                    if((iigLRResults[i].iigOwner == _iigOwner) && (iigLRResults[i].studentOwner == _studentOwner) && (iigLRResults[i].codeLRResult == keccak256(bytes(string(abi.encodePacked(_testDate, _shiftTest)))))){
                        return(iigLRResults[i].testDate,
                                iigLRResults[i].shiftTest,
                                iigLRResults[i].expireDate,
                                iigLRResults[i].listeningScore,
                                iigLRResults[i].readingScore,
                                iigLRResults[i].totalScore);
                    }
                }
    }

    // Chức năng kiểm tra kết quả ngày thi Listening - Reading của sinh viên đã tồn tại hay chưa?
    function checkExistLRResult(
        address _studentOwner, 
        string memory _testDate,
        uint _shiftTest) public view returns(uint x) {
            for(uint i=0; i<iigLRResults.length; i++){
                if((iigLRResults[i].studentOwner == _studentOwner) && (iigLRResults[i].codeLRResult == keccak256(bytes(string(abi.encodePacked(_testDate, _shiftTest)))))){
                    return 1;
                }
            }
    }

    // Chức năng thêm thông tin điểm thi Speaking - Writing
    function addSWResult (
        address _iigOwner,
        address _studentOwner,
        string memory _testDate,
        uint _shiftTest,
        string memory _expireDate,
        uint _speakingScore,
        uint _writingScore) public {
            require(checkExistIIG(_iigOwner) == 1, "Not found owner.");
            require(checkExistSWResult(_studentOwner, _testDate, _shiftTest) == 0, "Duplicate SW Result.");
            require(_shiftTest == 1 || _shiftTest == 2 || _shiftTest == 3 || _shiftTest == 4, "Shift Test incorrect.");
            require(_speakingScore >=0 && _speakingScore <=200, "Speaking Score incorrect.");
            require(_writingScore >=0 && _writingScore <=200, "Writing Score incorrect.");
            iigSWResults.push(
                IIGSWResult(bytes4(keccak256(abi.encodePacked(_testDate, _shiftTest))),
                        _iigOwner, 
                        _studentOwner, 
                        _testDate,
                        _shiftTest,
                        _expireDate,
                        _speakingScore, 
                        _writingScore,
                        (_speakingScore + _writingScore))
                );
    }

    // Chức năng lấy danh sách điểm thi Speaking - Writing đã thêm
    function getListSWResult(address _iigOwner, address _studentOwner) public view returns(
        string[] memory,
        uint[] memory,
        string[] memory,
        uint[] memory,
        uint[] memory,
        uint[] memory) {
            string[] memory testDates = new string[](iigSWResults.length);
            uint[] memory shiftTests = new uint[](iigSWResults.length);
            string[] memory expireDates = new string[](iigSWResults.length);
            uint[] memory speakingScores = new uint[](iigSWResults.length);
            uint[] memory writingScores = new uint[](iigSWResults.length);
            uint[] memory totalScores = new uint[](iigSWResults.length);
            for(uint i=0; i<iigSWResults.length;i++){
                if((iigLRResults[i].iigOwner == _iigOwner) && (iigLRResults[i].studentOwner == _studentOwner)){
                    testDates[i] = iigSWResults[i].testDate;
                    shiftTests[i] = iigSWResults[i].shiftTest;
                    expireDates[i] = iigSWResults[i].expireDate;
                    speakingScores[i] = iigSWResults[i].speakingScore;
                    writingScores[i] = iigSWResults[i].writingScore;
                    totalScores[i] = iigSWResults[i].totalScore;
                }
            }
            return (testDates, shiftTests, expireDates, speakingScores, writingScores, totalScores);
    }

    // Chức năng lấy điểm thi Speaking - Writing của sinh viên
    function getSWResult(
        address _iigOwner, 
        address _studentOwner,
        string memory _testDate,
        uint _shiftTest) public view returns(
            string memory testDate,
            uint shiftTest,
            string memory expireDate,
            uint speakingScore,
            uint writingScore,
            uint totalScore) {
                for(uint i=0; i<iigSWResults.length;i++){
                    if((iigSWResults[i].iigOwner == _iigOwner) && (iigSWResults[i].studentOwner == _studentOwner) && (iigSWResults[i].codeSWResult == keccak256(bytes(string(abi.encodePacked(_testDate, _shiftTest)))))){
                        return(iigSWResults[i].testDate,
                                iigSWResults[i].shiftTest,
                                iigSWResults[i].expireDate,
                                iigSWResults[i].speakingScore,
                                iigSWResults[i].writingScore,
                                iigSWResults[i].totalScore);
                    }
                }
    }
    
    // Chức năng kiểm tra kết quả ngày thi Speaking - Writing của sinh viên đã tồn tại hay chưa?
    function checkExistSWResult(
        address _studentOwner,
        string memory _testDate,
        uint _shiftTest) public view returns(uint x) {
            for(uint i=0; i<iigSWResults.length; i++){
                if((iigLRResults[i].studentOwner == _studentOwner) && (iigLRResults[i].codeLRResult == keccak256(bytes(string(abi.encodePacked(_testDate, _shiftTest)))))){
                    return 1;
                }
            }
    }
}