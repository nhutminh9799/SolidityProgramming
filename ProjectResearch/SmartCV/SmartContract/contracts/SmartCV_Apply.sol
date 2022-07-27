// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// Lưu trữ CV
contract ApplyCV {

    // Khai báo cấu trúc lưu trữ thông tin nộp CV
    struct CV {
        address studentOwner;
        address businessOwner;
        string jobTitle;
        string coverLetter;
        string statusCV;
    }

    // Khai báo cấu trúc lưu trữ thông tin tuyển dụng
    struct Recruit {
        address businessOwner;
        bytes32 codeRecruit;
        string jobTitle;
        string jobDescription;
        string recruitDate;
        uint amount;
    }

    // Khai báo cấu trúc lưu trữ thông tin đánh giá thực tập
    struct Review {
        address studentOwner;
        address businessOwner;
        string content;
    }

    // Khai báo các mảng để lưu trữ thông tin
    CV[] public cvs;
    Recruit[] public recruits;
    Review[] public reviews;

    // Chức năng nộp CV
    function addCV(
        address _studentOwner, 
        address _businessOwner, 
        string memory _jobTitle, 
        string memory _coverLetter) public {
            cvs.push(
                CV(_studentOwner,
                    _businessOwner,
                    _jobTitle,
                    _coverLetter,
                    "Screening")
                );
    }

    // Chức năng kiểm tra sinh viên đã nộp CV chưa?
    function checkCV(
        address _studentOwner, 
        address _businessOwner, 
        string memory _jobTitle) public view returns(uint x) {
            for(uint i=0; i<cvs.length; i++){
                if((cvs[i].studentOwner == _studentOwner) && (cvs[i].businessOwner == _businessOwner) && (keccak256(bytes(cvs[i].jobTitle)) == keccak256(bytes(_jobTitle)))){
                    return 1;
                }
            }
    }

    //Chức năng duyệt CV vào vòng interview
    function interviewCV(
        address _studentOwner, 
        address _businessOwner, 
        string memory _jobTitle,
        string memory _statusCV) public {
            for(uint i=0; i<cvs.length; i++){
                if((cvs[i].studentOwner == _studentOwner) && (cvs[i].businessOwner == _businessOwner) && (keccak256(bytes(cvs[i].jobTitle)) == keccak256(bytes(_jobTitle)))){
                    cvs[i].statusCV = _statusCV;
                }
            }
    }

    //Chức năng duyệt CV vào vòng onboard
    function onboardCV(
        address _studentOwner, 
        address _businessOwner, 
        string memory _jobTitle,
        string memory _statusCV) public {
            for(uint i=0; i<cvs.length; i++){
                if((cvs[i].studentOwner == _studentOwner) && (cvs[i].businessOwner == _businessOwner) && (keccak256(bytes(cvs[i].jobTitle)) == keccak256(bytes(_jobTitle)))){
                    cvs[i].statusCV = _statusCV;
                }
            }
    }

    // Chức năng lấy danh sách CV theo doanh nghiệp
    function getCV(address _businessOwner) public view returns(
        address[] memory, 
        address[] memory, 
        string[] memory, 
        string[] memory,
        string[] memory)  {
            address[] memory studentOwners = new address[](cvs.length);
            address[] memory businessOwners = new address[](cvs.length);
            string[] memory jobTitles = new string[](cvs.length);
            string[] memory coverLetters = new string[](cvs.length);
            string[] memory statusCVs = new string[](cvs.length);
            for(uint i=0; i<cvs.length;i++){
                if(cvs[i].businessOwner == _businessOwner) {
                    studentOwners[i] = cvs[i].studentOwner;
                    businessOwners[i] = cvs[i].businessOwner;
                    jobTitles[i] = cvs[i].jobTitle;
                    coverLetters[i] = cvs[i].coverLetter;
                    statusCVs[i] = cvs[i].statusCV;
                }
            }
            return (studentOwners, businessOwners, jobTitles, coverLetters, statusCVs);
    }

    // Chức năng kiểm tra số lượng CV nộp vào theo doanh nghiệp
    function checkNumCV(address _businessOwner) public view returns(uint x) {
            uint _count = 0;
            for(uint i=0; i<cvs.length; i++){
                if(cvs[i].businessOwner == _businessOwner){
                    _count += 1;
                }
            }
            return _count;
    }

    // Chức năng thêm thông tin tuyển dụng
    function addRecruit(
        address _businessOwner,
        string memory _jobTitle,
        string memory _jobDescription,
        string memory _recruitDate,
        uint _amount) public {
            recruits.push(
                Recruit(_businessOwner,
                        keccak256(bytes(string(abi.encodePacked(_jobTitle, _recruitDate)))),
                        _jobTitle,
                        _jobDescription,
                        _recruitDate,
                        _amount)
                );
    }

    // Chức năng kiểm tra số lượng tuyển dụng
    function checkAmountRecruit(
        address _businessOwner,
        string memory _jobTitle,
        string memory _recruitDate) public view returns(uint x) {
            for(uint i=0; i<recruits.length; i++){
                if((recruits[i].businessOwner == _businessOwner) && (recruits[i].codeRecruit == keccak256(bytes(string(abi.encodePacked(_jobTitle, _recruitDate)))))){
                    return recruits[i].amount;
                }
            }
    }

    // Chức năng lấy thông tin tuyển dụng
    function getRecruit(address _businessOwner) public view returns(
        bytes32[] memory,
        string[] memory, 
        string[] memory,
        string[] memory,
        uint[] memory) {
            bytes32[] memory codeRecruits = new bytes32[](recruits.length);
            string[] memory jobTitles = new string[](recruits.length);
            string[] memory jobDescriptions = new string[](recruits.length);
            string[] memory recruitDates = new string[](recruits.length);
            uint[] memory amounts = new uint[](recruits.length);
            for(uint i=0; i<recruits.length;i++){
                if(recruits[i].businessOwner == _businessOwner) {
                    codeRecruits[i] = recruits[i].codeRecruit;
                    jobTitles[i] = recruits[i].jobTitle;
                    jobDescriptions[i] = recruits[i].jobDescription;
                    recruitDates[i] = recruits[i].recruitDate;
                    amounts[i] = recruits[i].amount;
                }
            }
            return (codeRecruits, jobTitles, jobDescriptions, recruitDates, amounts);
    }

    // Chức năng lưu trữ đánh giá thực tập của từng sinh viên
    function addReview(
        address _studentOwner, 
        address _businessOwner, 
        string memory _content) public {
            reviews.push(
                Review(_studentOwner, 
                        _businessOwner, 
                        _content)
                );
    }

    // Chức năng lấy thông tin đánh giá thực tập
    function getReview(
        address _studentOwner, 
        address _businessOwner) public view returns(
            address studentOwner, 
            address businessOwner, 
            string memory content)  {
                for(uint i=0; i<reviews.length;i++){
                    if(reviews[i].businessOwner == _businessOwner && reviews[i].studentOwner == _studentOwner) {
                        return(reviews[i].studentOwner,
                                reviews[i].businessOwner,
                                reviews[i].content);
                    }
                }
    }
}