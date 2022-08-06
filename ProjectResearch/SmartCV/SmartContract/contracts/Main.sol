// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import {BusinessController} from "./controller/BusinessController.sol";
import {Ownable} from "./abstract/Ownable.sol";
import {ListBusiness} from "./database/ListBusiness.sol";

contract Main is Ownable {
    // bosungchuyentien
    address listBusinessAddress;

    constructor(address _listBusinessAddress) Ownable() {
        listBusinessAddress = _listBusinessAddress;
    }

    //BusinessController
    BusinessController businessController =
        new BusinessController(listBusinessAddress);

    function addBusiness(
        uint256 catergory,
        address user,
        string memory name,
        string memory phone,
        string memory professional,
        string memory email,
        string memory github,
        string memory linkedin,
        string memory sourceImage,
        string memory password
    ) public returns (uint256) {
        return
            businessController.addBusiness(
                catergory,
                user,
                name,
                phone,
                professional,
                email,
                github,
                linkedin,
                sourceImage,
                password
            );
    }
}
