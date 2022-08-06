// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import {Ownable} from "../abstract/Ownable.sol";
import {ListBusiness} from "../database/ListBusiness.sol";
import {BusinessCommon} from "../contract/BusinessCommon.sol";

contract BusinessCommonController is Ownable {
    ListBusiness private listBusinessCursor;

    constructor(address listBusinessAddress) public Ownable() {
        listBusinessCursor = ListBusiness(listBusinessAddress);
    }

}
