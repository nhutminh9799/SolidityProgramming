// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import {IBusiness} from "../interface/IBusiness.sol";

interface IBusinessGap is IBusiness {}

contract BusinessGap is IBusinessGap {
    uint256 private catergory = 0;

    // address private user;
    // string private name;
    // string private phone;
    // string private professional;
    // string private email;
    // string private github;
    // string private linkedin;
    // string private sourceImage;
    // string private password;

    // setter
    function setUser(address value) public {}

    function setName(string memory value) public {}

    function setPhone(string memory value) public {}

    function setProfessional(string memory value) public {}

    function setEmail(string memory value) public {}

    function setGithub(string memory value) public {}

    function setLinkedin(string memory value) public {}

    function setSourceImage(string memory value) public {}

    function setPassword(string memory value) public {}

    //getter
    function getCategory() public pure returns (uint256) {
        return 0;
    }

    function getUser() public pure returns (address) {
        return address(0);
    }

    function getName() public pure returns (string memory) {
        return "";
    }

    function getPhone() public pure returns (string memory) {
        return "";
    }

    function getProfessional() public pure returns (string memory) {
        return "";
    }

    function getEmail() public pure returns (string memory) {
        return "";
    }

    function getGithub() public pure returns (string memory) {
        return "";
    }

    function getLinkedin() public pure returns (string memory) {
        return "";
    }

    function getSourceImage() public pure returns (string memory) {
        return "";
    }

    function getPassword() public pure returns (string memory) {
        return "";
    }
}
