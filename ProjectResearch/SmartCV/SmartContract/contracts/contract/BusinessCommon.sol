// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import {IBusiness} from "../interface/IBusiness.sol";

interface IBusinessCommon is IBusiness {}

contract BusinessCommon is IBusinessCommon {
    uint256 private catergory = 1;
    address private user;
    string private name;
    string private phone;
    string private professional;
    string private email;
    string private github;
    string private linkedin;
    string private sourceImage;
    string private password;

    constructor(
        address _user,
        string memory _name,
        string memory _phone,
        string memory _professional,
        string memory _email,
        string memory _github,
        string memory _linkedin,
        string memory _sourceImage,
        string memory _password
    ) {
        user = _user;
        name = _name;
        phone = _phone;
        professional = _professional;
        email = _email;
        github = _github;
        linkedin = _linkedin;
        sourceImage = _sourceImage;
        password = _password;
    }

    // setter
    function setUser(address value) public {
        user = value;
    }

    function setName(string memory value) public {
        name = value;
    }

    function setPhone(string memory value) public {
        phone = value;
    }

    function setProfessional(string memory value) public {
        professional = value;
    }

    function setEmail(string memory value) public {
        email = value;
    }

    function setGithub(string memory value) public {
        github = value;
    }

    function setLinkedin(string memory value) public {
        linkedin = value;
    }

    function setSourceImage(string memory value) public {
        sourceImage = value;
    }

    function setPassword(string memory value) public {
        password = value;
    }

    //getter
    function getCategory() public view returns (uint256) {
        return catergory;
    }

    function getUser() public view returns (address) {
        return user;
    }

    function getName() public view returns (string memory) {
        return name;
    }

    function getPhone() public view returns (string memory) {
        return phone;
    }

    function getProfessional() public view returns (string memory) {
        return professional;
    }

    function getEmail() public view returns (string memory) {
        return email;
    }

    function getGithub() public view returns (string memory) {
        return github;
    }

    function getLinkedin() public view returns (string memory) {
        return linkedin;
    }

    function getSourceImage() public view returns (string memory) {
        return sourceImage;
    }

    function getPassword() public view returns (string memory) {
        return password;
    }
}
