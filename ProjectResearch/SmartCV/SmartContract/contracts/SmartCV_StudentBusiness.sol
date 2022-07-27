// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// Import các contract cần thiết để sử dụng
import "./SmartCV_ListStudent.sol";
import "./SmartCV_ListBusiness.sol";
import "./SmartCV_ListIIG.sol";
import "./SmartCV_Apply.sol";

// CV dành cho sinh viên
contract StudentBusiness {

    // Khai contract đã import để sử dụng các function ở contract đó
    ListStudent listStudent = new ListStudent();
    ListBusiness listBusiness = new ListBusiness();
    ListIIG listIIG = new ListIIG();
    ApplyCV applyCV = new ApplyCV();

    // ======================================
    // ====== Chức năng cho sinh viên =======
    // ======================================

    // Chức năng thêm thông tin sinh viên (Đăng ký)
    function addStudentProfile (
        address _studentOwner,
        string memory _name,
        string memory _phoneNumber,
        string memory _professionalTitle,
        string memory _email,
        string memory _github,
        string memory _linkedin,
        string memory _sourceImage,
        string memory _password) public {
            listStudent.addSV(_studentOwner, 
                                _name, 
                                _phoneNumber, 
                                _professionalTitle, 
                                _email, 
                                _github, 
                                _linkedin,
                                _sourceImage,
                                _password);
    }

    // Chức năng chỉnh thông tin sinh viên
    function editStudentProfile (
        address _studentOwner,
        string memory _name,
        string memory _phoneNumber,
        string memory _professionalTitle,
        string memory _email,
        string memory _github,
        string memory _linkedin,
        string memory _sourceImage) public {
            listStudent.editSV(_studentOwner,
                                _name, 
                                _phoneNumber, 
                                _professionalTitle, 
                                _email, 
                                _github, 
                                _linkedin,
                                _sourceImage);
    }

    // Chức năng lấy thông tin của sinh viên
    function getStudentProfile(address _studentOwner) public view returns(
        address studentOwner, 
        string memory name, 
        string memory phoneNumber, 
        string memory professionalTitle, 
        string memory email, 
        string memory github, 
        string memory linkedin,
        string memory sourceImage,
        string memory password) {
            return listStudent.getProfile(_studentOwner);
    }

    // Chức năng kiểm tra tài khoản sinh viên có tồn tại hay không? (Đăng nhập)
    function checkStudentProfile(
        address _studentOwner, 
        string memory _password) public view returns(uint x) {
            return listStudent.checkSV(_studentOwner, _password);
    }

    // Chức năng kiểm tra địa chỉ sinh viên có tồn tại hay không?
    function checkExistStudent(address _studentOwner) public view returns(uint x) {
            return listStudent.checkExistSV(_studentOwner);
    }

    // Chức năng thêm thông tin kĩ năng của sinh viên
    function addStudentSkill(
        address _studentOwner,
        string memory _title, 
        uint _level) public {
            listStudent.addSkill(_studentOwner, 
                                _title, 
                                _level);
    }

    // Chức năng chỉnh sửa thông tin kĩ năng của sinh viên
    function editStudentSkill(
        address _studentOwner,
        string memory _title, 
        uint _level) public {
            listStudent.editSkill(_studentOwner, 
                                _title, 
                                _level);
    }

    // Chức năng kiểm tra kĩ năng của sinh viên có tồn tại hay không?
    function checkStudentSkill(
        address _studentOwner,
        string memory _title) public view returns(uint x) {
            return listStudent.checkSkill(_studentOwner, _title);
    }

    // Chức năng kiểm tra số lượng kĩ năng của sinh viên
    function checkNumStudentSkill(address _studentOwner) public view returns(uint x) {
            uint _count = listStudent.checkNumSkill(_studentOwner);
            if(_count > 10){
                return 1;
            }
    }

    // Chức năng lấy thông tin kĩ năng của sinh viên
    function getStudentSkill(address _studentOwner) public view returns(
        string[] memory titles,
        uint[] memory levels) {
        return listStudent.getSkill(_studentOwner);
    }

    // Chức năng thêm thông tin học vấn của sinh viên
    function addStudentEducation(
        address _studentOwner,
        string memory _institution,
        string memory _focusArea, 
        string memory _startTime,
        string memory _finishTime,
        string memory _gpa) public {
            listStudent.addEducation(_studentOwner, 
                                    _institution, 
                                    _focusArea,
                                    _startTime,
                                    _finishTime,
                                    _gpa);
    }

    // Chức năng chỉnh sửa thông tin học vấn của sinh viên
    function editStudentEducation(
        address _studentOwner,
        string memory _institution,
        string memory _focusArea, 
        string memory _startTime,
        string memory _finishTime,
        string memory _gpa) public {
            listStudent.editEducation(_studentOwner, 
                                    _institution, 
                                    _focusArea,
                                    _startTime,
                                    _finishTime,
                                    _gpa);
    }

    // Chức năng kiểm tra sinh viên đã thêm học vấn đó hay chưa?
    function checkStudentEducation(
        address _studentOwner, 
        string memory _institution,
        string memory _focusArea) public view returns(uint x) {
            return listStudent.checkEducation(_studentOwner,
                                            _institution,
                                            _focusArea);
    }

    // Chức năng lấy thông tin học vấn của sinh viên
    function getStudentEducation(address _studentOwner) public view returns(
        string[] memory,
        string[] memory,
        string[] memory,
        string[] memory,
        string[] memory) {
            return listStudent.getEducation(_studentOwner);
    }

    // Chức năng lấy danh sách doanh nghiệp
    function getListBusiness() public view returns(
        address[] memory,
        string[] memory,
        string[] memory,
        string[] memory,
        string[] memory,
        string[] memory,
        string[] memory,
        string[] memory) {
        return listBusiness.getListDN();
    }

    // Chức năng lấy thông tin tuyển dụng của doanh nghiệp
    function getRecruit(address _businessOwner) public view returns(
        bytes32[] memory,
        string[] memory,
        string[] memory,
        string[] memory,
        uint[] memory) {
        return applyCV.getRecruit(_businessOwner);
    }

    // Chức năng gửi CV tới doanh nghiệp
    function sendCV(
        address _studentOwner, 
        address _businessOwner, 
        string memory _jobTitle, 
        string memory _coverLetter) public {
            applyCV.addCV(_studentOwner, 
                        _businessOwner, 
                        _jobTitle, 
                        _coverLetter);
    }

    // Chức năng kiểm tra sinh viên đã nộp CV chưa?
    function checkCV(
        address _studentOwner, 
        address _businessOwner, 
        string memory _jobTitle) public view returns(uint x) {
            return applyCV.checkCV(_studentOwner, 
                                    _businessOwner, 
                                    _jobTitle);
    }

    // Chức năng xem đánh giá thực tập của doanh nghiệp
    function getReview(
        address _studentOwner, 
        address _businessOwner) public view returns(
            address studentOwner, 
            address businessOwner, 
            string memory content) {
                return applyCV.getReview(_studentOwner, _businessOwner);
    }

    // ======================================
    // ===== Chức năng cho doanh nghiệp =====
    // ======================================

    // Chức năng thêm thông tin doanh nghiệp (Đăng ký)
    function addBusinessProfile(
        address _businessOwner,
        string memory _name,
        string memory _country,
        string memory _facebook,
        string memory _website,
        string memory _linkedin,
        string memory _focusArea,
        string memory _password) public {
            listBusiness.addDN(_businessOwner, 
                                _name, 
                                _country, 
                                _facebook, 
                                _website, 
                                _linkedin, 
                                _focusArea, 
                                _password);
    }

    // Chức năng chỉnh sửa thông tin doanh nghiệp
    function editBusinessProfile(
        address _businessOwner,
        string memory _name,
        string memory _country,
        string memory _facebook,
        string memory _website,
        string memory _linkedin,
        string memory _focusArea) public {
            listBusiness.editDN(_businessOwner, 
                                _name, 
                                _country, 
                                _facebook, 
                                _website, 
                                _linkedin, 
                                _focusArea);
    }

    // Chức năng lấy thông tin của doanh nghiệp
    function getBusinessProfile(address _businessOwner) public view returns(
        address businessOwner, 
        string memory name, 
        string memory country, 
        string memory facebook, 
        string memory website, 
        string memory linkedin, 
        string memory focusArea) {
            return listBusiness.getProfile(_businessOwner);
    }

    // Chức năng kiểm tra tài khoản doanh nghiệp có tồn tại hay không? (Đăng nhập)
    function checkBusinessProfile(
        address _businessOwner, 
        string memory _password) public view returns(uint) {
            return listBusiness.checkDN(_businessOwner, _password);
    }

    // Chức năng kiểm tra địa chỉ doanh nghiệp có tồn tại hay không?
    function checkExistBusiness(address _businessOwner) public view returns(uint x) {
            return listBusiness.checkExistDN(_businessOwner);
    }

    // Chức năng lấy danh sách CV đã nộp vào doanh nghiệp
    function getListCV(address _businessOwner) public view returns(
        address[] memory, 
        address[] memory, 
        string[] memory, 
        string[] memory,
        string[] memory) {
            return applyCV.getCV(_businessOwner);
    }
    
    //Chức năng duyệt CV vào vòng interview
    function interviewCV(
        address _studentOwner, 
        address _businessOwner, 
        string memory _jobTitle,
        string memory _statusCV) public {
            applyCV.interviewCV(_studentOwner, 
                                _businessOwner, 
                                _jobTitle, 
                                _statusCV);
    }

    //Chức năng duyệt CV vào vòng onboard
    function onboardCV(
        address _studentOwner, 
        address _businessOwner, 
        string memory _jobTitle,
        string memory _statusCV) public {
            applyCV.onboardCV(_studentOwner, 
                            _businessOwner, 
                            _jobTitle, 
                            _statusCV);
    }

    // Chức năng thêm thông tin tuyển dụng của doanh nghiệp
    function addRecruit(
        address _businessOwner,
        string memory _jobTitle,
        string memory _jobDescription,
        string memory _recruitDate,
        uint _amount) public {
            applyCV.addRecruit(_businessOwner, 
                                _jobTitle, 
                                _jobDescription,
                                _recruitDate,
                                _amount);
    }

    // Chức năng kiểm tra số lượng tuyển dụng đã đủ hay chưa?
    function checkAmountBusinessRecruit(
        address _businessOwner,
        string memory _jobTitle,
        string memory _recruitDate) public view returns(uint x) {
            uint numCV = applyCV.checkNumCV(_businessOwner);
            uint amountRecuit = applyCV.checkAmountRecruit(_businessOwner, _jobTitle, _recruitDate);
            if(numCV > amountRecuit){
                return 1;
            }
    }

    // Chức năng đánh giá thực tập cho sinh viên
    function sendReview(
        address _studentOwner, 
        address _businessOwner, 
        string memory _content) public {
            applyCV.addReview(_studentOwner, 
                            _businessOwner, 
                            _content);
    }

    // ======================================
    // ========= Chức năng cho IIG ==========
    // ======================================

    // Chức năng thêm thông tin IIG (Đăng ký)
    function addIIGProfile(
        address _iigOwner,
        string memory _name,
        string memory _country,
        string memory _facebook,
        string memory _website,
        string memory _linkedin,
        string memory _password) public {
            listIIG.addIIG(_iigOwner, 
                            _name, 
                            _country, 
                            _facebook, 
                            _website, 
                            _linkedin, 
                            _password);
    }

    // Chức năng chỉnh sửa thông tin IIG
    function editIIGProfile(
        address _iigOwner,
        string memory _name,
        string memory _country,
        string memory _facebook,
        string memory _website,
        string memory _linkedin) public {
            listIIG.editIIG(_iigOwner, 
                            _name, 
                            _country, 
                            _facebook, 
                            _website, 
                            _linkedin);
    }

    // Chức năng lấy danh sách IIG
    function getListIIG() public view returns(
        address[] memory,
        string[] memory,
        string[] memory,
        string[] memory,
        string[] memory,
        string[] memory,
        string[] memory) {
            return listIIG.getListIIG();
    }

    // Chức năng lấy thông tin của IIG
    function getIIGProfile(address _iigOwner) public view returns(
        address iigOwner,
        string memory name,
        string memory country,
        string memory facebook,
        string memory website,
        string memory linkedin) {
            return listIIG.getProfile(_iigOwner);
    }

    // Chức năng kiểm tra tài khoản IIG có tồn tại hay không? (Đăng nhập)
    function checkIIGProfile(
        address _iigOwner, 
        string memory _password) public view returns(uint) {
            return listIIG.checkIIG(_iigOwner, _password);
    }

    // Chức năng kiểm tra địa chỉ IIG có tồn tại hay không?
    function checkExistIIG(address _iigOwner) public view returns(uint x) {
            return listIIG.checkExistIIG(_iigOwner);
    }

    // Chức năng gửi thông tin yêu cầu chứng chỉ IIG
    function sendIIGRequest (
        address _studentOwner,
        address _iigOwner,
        string memory _identityCard) public {
            listIIG.addRequest(_studentOwner, 
                            _iigOwner,
                            _identityCard);
    }

    // Chức năng lấy danh sách yêu cầu chứng chỉ IIG
    function getListIIGRequest(address _iigOwner) public view returns(
        address[] memory, 
        address[] memory, 
        string[] memory,
        string[] memory) {
            return listIIG.getListRequest(_iigOwner);
    }

    //Chức năng duyệt yêu cầu chứng chỉ IIG
    function confirmIIGRequest(
        address _studentOwner, 
        address _iigOwner, 
        string memory _statusRequest) public {
            listIIG.confirmRequest(_studentOwner,
                                    _iigOwner,
                                    _statusRequest);
    }

    // Chức năng nhập thông tin điểm thi Listening - Reading
    function addIIGLRResult (
        address _iigOwner,
        address _studentOwner,
        string memory _testDate,
        string memory _shiftTest,
        string memory _expireDate,
        uint _listeningScore,
        uint _readingScore) public {
            listIIG.addLRResult(_iigOwner, 
                                _studentOwner, 
                                _testDate,
                                _shiftTest, 
                                _expireDate, 
                                _listeningScore, 
                                _readingScore);
    }

    // Chức năng nhập thông tin điểm thi Speaking - Writing
    function addIIGSWResult (
        address _iigOwner,
        address _studentOwner,
        string memory _testDate,
        string memory _shiftTest,
        string memory _expireDate,
        uint _speakingScore,
        uint _writingScore) public {
            listIIG.addSWResult(_iigOwner, 
                                _studentOwner, 
                                _testDate,
                                _shiftTest,
                                _expireDate, 
                                _speakingScore, 
                                _writingScore);
    }

    //Chức năng lấy thông tin điểm thi Listening - Reading
    function getIIGLRResult(address _iigOwner, address _studentOwner) public view returns(
        string[] memory,
        string[] memory,
        string[] memory,
        uint[] memory,
        uint[] memory,
        uint[] memory) {
            return listIIG.getListLRResult(_iigOwner, _studentOwner);
        }

    //Chức năng lấy thông tin điểm thi Speaking - Writing
    function getIIGSWResult(address _iigOwner, address _studentOwner) public view returns(
        string[] memory,
        string[] memory,
        string[] memory,
        uint[] memory,
        uint[] memory,
        uint[] memory) {
            return listIIG.getListSWResult(_iigOwner, _studentOwner);
        }

    // Chức năng kiểm tra kết quả ngày thi Listening - Reading của sinh viên đã tồn tại hay chưa?
    function checkExistIIGLRResult(
        address _studentOwner,
        string memory _testDate,
        string memory _shiftTest) public view returns(uint x) {
            return listIIG.checkExistLRResult(_studentOwner, 
                                            _testDate, 
                                            _shiftTest);
    }

    // Chức năng kiểm tra kết quả ngày thi Speaking - Writing của sinh viên đã tồn tại hay chưa?
    function checkExistIIGSWResult(
        address _studentOwner,
        string memory _testDate,
        string memory _shiftTest) public view returns(uint x) {
            return listIIG.checkExistSWResult(_studentOwner, 
                                            _testDate, 
                                            _shiftTest);
    }
}