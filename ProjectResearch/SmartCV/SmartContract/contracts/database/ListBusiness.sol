// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import {IERC20} from "../interface/IERC20.sol";

import {IBusiness} from "../interface/IBusiness.sol";
import {BusinessGap} from "../contract/BusinessGap.sol";

import {Ownable} from "../abstract/Ownable.sol";

contract ListBusiness is Ownable {
    mapping(uint256 => IBusiness) private list;
    uint256 private autoIncrement = 0;

    constructor() Ownable() {}

    event Add(IBusiness item);

    event Remove(IBusiness item);

    function add(IBusiness item) public returns (bool) {
        autoIncrement++;
        item.setId(autoIncrement);
        list[autoIncrement] = item;
        emit Add(item);
        return true;
    }

    function at(uint256 index) public view returns (IBusiness) {
        // require(index < list.length, "index must be less than list length");
        return list[index];
    }

    // function remove(uint256 index) public returns (bool) {
    //     require(index < list.length, "index must be less than list length");
    //     delete list[index];
    //     list[index] = list[list.length - 1];
    //     list.pop();
    //     return true;
    // }

    function hide(uint256 index) public returns (bool) {
        // require(index < list.length, "index must be less than list length");
        IBusiness gap = new BusinessGap();
        gap.setId(0);
        list[index] = gap;
        return true;
    }
}
