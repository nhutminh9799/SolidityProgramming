// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import {IBusiness} from "../interface/IBusiness.sol";

interface IBusinessGap is IBusiness {}

contract BusinessGap is IBusinessGap {
    uint256 private catergory = 0;
    uint256 private id;
    address private user;

    // string private name;
    // string private phone;
    // string private professional;
    // string private email;
    // string private github;
    // string private linkedin;
    // string private sourceImage;
    // string private password;

    // setter
    function setId(uint256 value) public override {
        id = value;
    }

    function setUser(address value) public override {
        user = value;
    }

    function setName(string memory value) public override {}

    function setPhone(string memory value) public override {}

    function setProfessional(string memory value) public override {}

    function setEmail(string memory value) public override {}

    function setGithub(string memory value) public override {}

    function setLinkedin(string memory value) public override {}

    function setSourceImage(string memory value) public override {}

    function setPassword(string memory value) public override {}

    //getter
    function getCategory() public pure override returns (uint256) {
        return 0;
    }

    function getId() public view override returns (uint256) {
        return id;
    }

    function getUser() public pure override returns (address) {
        return address(0);
    }

    function getName() public pure override returns (string memory) {
        return "";
    }

    function getPhone() public pure override returns (string memory) {
        return "";
    }

    function getProfessional() public pure override returns (string memory) {
        return "";
    }

    function getEmail() public pure override returns (string memory) {
        return "";
    }

    function getGithub() public pure override returns (string memory) {
        return "";
    }

    function getLinkedin() public pure override returns (string memory) {
        return "";
    }

    function getSourceImage() public pure override returns (string memory) {
        return "";
    }

    function getPassword() public pure override returns (string memory) {
        return "";
    }
}
