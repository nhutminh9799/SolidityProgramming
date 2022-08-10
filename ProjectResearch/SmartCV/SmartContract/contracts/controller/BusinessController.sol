// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// import {Ownable} from "../abstract/Ownable.sol";
import {ListBusinessCursor} from "../cursor/ListBusinessCursor.sol";
import {ListBusiness} from "../database/ListBusiness.sol";
import {IBusiness} from "../interface/IBusiness.sol";
import {BusinessCommon} from "../contract/BusinessCommon.sol";

contract BusinessController is ListBusinessCursor {
    constructor(address listBusinessAddress)
        ListBusinessCursor(listBusinessAddress)
    {}

    //Chức năng đổi mật khẩu
    function changePassword(uint256 id, string memory value)
        public
        returns (uint256)
    {
        IBusiness item = getListBusinessCursor().at(id);

        _checkUser(item.getUser(), msg.sender);

        item.setPassword(value);
        return 1;
    }
}
