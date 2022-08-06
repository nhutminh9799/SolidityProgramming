// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Student {
    struct StudentInfo {
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
}

contract ListStudent {
    address private owner;

    constructor() {
        owner = msg.sender;
    }

    Student.StudentInfo[] public listStudent;

    function addStudent(
        address _studentOwner,
        string memory _name,
        string memory _phoneNumber,
        string memory _professionalTitle,
        string memory _email,
        string memory _github,
        string memory _linkedin,
        string memory _sourceImage,
        string memory _password) public {
            listStudent.push(
                Student.StudentInfo(_studentOwner, 
                                    _name, 
                                    _phoneNumber, 
                                    _professionalTitle, 
                                    _email, 
                                    _github, 
                                    _linkedin,
                                    _sourceImage,
                                    _password));
    }

    function getStudent() public view returns(Student.StudentInfo[] memory){
        return listStudent;
    }
}

contract Main {

    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    // function addStudent(
    //     address addr,
    //     address _studentOwner,
    //     string memory _name,
    //     string memory _phoneNumber,
    //     string memory _professionalTitle,
    //     string memory _email,
    //     string memory _github,
    //     string memory _linkedin,
    //     string memory _sourceImage,
    //     string memory _password) public {
    //         ListStudent cursor = ListStudent(addr);
    //         cursor.listStudent.push(
    //             Student.StudentInfo(owner, 
    //                                 _name, 
    //                                 _phoneNumber, 
    //                                 _professionalTitle, 
    //                                 _email, 
    //                                 _github, 
    //                                 _linkedin,
    //                                 _sourceImage,
    //                                 _password));
    // }
}
