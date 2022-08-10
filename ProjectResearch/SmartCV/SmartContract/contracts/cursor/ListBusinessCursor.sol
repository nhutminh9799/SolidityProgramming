// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import {ListBusiness} from "../database/ListBusiness.sol";
import {Ownable} from "../abstract/Ownable.sol";

abstract contract ListBusinessCursor is Ownable {
    ListBusiness private listBusinessCursor;
    address private listBusinessAddress;

    constructor(address value) Ownable() {
        listBusinessAddress = value;
        listBusinessCursor = ListBusiness(value);
    }

    function _changeListBusinessCursor(address value)
        public
        virtual
        onlyOwner
        returns (bool)
    {
        listBusinessAddress = value;
        listBusinessCursor = ListBusiness(value);
        return true;
    }

    function _getListBusinessCursor() public view returns (ListBusiness) {
        return listBusinessCursor;
    }
}
