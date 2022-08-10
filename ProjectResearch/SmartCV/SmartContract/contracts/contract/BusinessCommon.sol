// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import {IBusinessCommon} from "../interface/IBusinessCommon.sol";

contract BusinessCommon is IBusinessCommon {
    uint256 private catergory = 1;
    uint256 private id;
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
    function setId(uint256 value) public override {
        id = value;
    }

    function setUser(address value) public override {
        user = value;
    }

    function setName(string memory value) public override {
        name = value;
    }

    function setPhone(string memory value) public override {
        phone = value;
    }

    function setProfessional(string memory value) public override {
        professional = value;
    }

    function setEmail(string memory value) public override {
        email = value;
    }

    function setGithub(string memory value) public override {
        github = value;
    }

    function setLinkedin(string memory value) public override {
        linkedin = value;
    }

    function setSourceImage(string memory value) public override {
        sourceImage = value;
    }

    function setPassword(string memory value) public override {
        password = value;
    }

    //getter
    function getId() public view override returns (uint256) {
        return id;
    }

    function getCategory() public view override returns (uint256) {
        return catergory;
    }

    function getUser() public view override returns (address) {
        return user;
    }

    function getName() public view override returns (string memory) {
        return name;
    }

    function getPhone() public view override returns (string memory) {
        return phone;
    }

    function getProfessional() public view override returns (string memory) {
        return professional;
    }

    function getEmail() public view override returns (string memory) {
        return email;
    }

    function getGithub() public view override returns (string memory) {
        return github;
    }

    function getLinkedin() public view override returns (string memory) {
        return linkedin;
    }

    function getSourceImage() public view override returns (string memory) {
        return sourceImage;
    }

    function getPassword() public view override returns (string memory) {
        return password;
    }
}
