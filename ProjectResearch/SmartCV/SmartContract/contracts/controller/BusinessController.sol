// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import {Ownable} from "../abstract/Ownable.sol";
import {ListBusiness} from "../database/ListBusiness.sol";
import {IBusiness} from "../interface/IBusiness.sol";
import {BusinessCommon} from "../contract/BusinessCommon.sol";

contract BusinessController is Ownable {
    ListBusiness private listBusinessCursor;

    constructor(address listBusinessAddress) Ownable() {
        listBusinessCursor = ListBusiness(listBusinessAddress);
    }

    // Chức năng thêm thông tin doanh nghiệp
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
        // label2:
        while (true) {
            // Code here is executed at least once, and repeats while a is true.
            if (catergory == 1) {
                BusinessCommon item = new BusinessCommon(
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
                // item.
                listBusinessCursor.add(item);
            }
            break;
        }
        return 1;
    }
}
