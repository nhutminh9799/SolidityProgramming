// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// import {Ownable} from "../abstract/Ownable.sol";
import {ListBusinessCursor} from "../cursor/ListBusinessCursor.sol";
import {ListBusiness} from "../database/ListBusiness.sol";
import {IBusiness} from "../interface/IBusiness.sol";
import {BusinessCommon} from "../contract/BusinessCommon.sol";
import {IBusinessCommon} from "../interface/IBusinessCommon.sol";

contract BusinessCommonController is ListBusinessCursor {
    constructor(address listBusinessAddress)
        ListBusinessCursor(listBusinessAddress)
    {}

    // Chức năng thêm thông tin doanh nghiệp
    function addBusiness(
        string memory name,
        string memory phone,
        string memory professional,
        string memory email,
        string memory github,
        string memory linkedin,
        string memory sourceImage,
        string memory password
    ) public returns (uint256) {
        address user = msg.sender;
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
        _getListBusinessCursor().add(item);

        return 1;
    }

    // Chức năng chỉnh sửa thông tin doanh nghiệp
    function editBusiness(
        uint256 id,
        string memory name,
        string memory phone,
        string memory professional,
        string memory email,
        string memory github,
        string memory linkedin,
        string memory sourceImage
    ) public returns (uint256) {
        IBusiness item = _getListBusinessCursor().at(id);

        _checkUser(item.getUser(), msg.sender);

        item.setName(name);
        item.setPhone(phone);
        item.setProfessional(professional);
        item.setEmail(email);
        item.setGithub(github);
        item.setLinkedin(linkedin);
        item.setSourceImage(sourceImage);
        return 1;
    }

    // function getProfile(uint256 id) public returns (BusinessCommon) {
    //     IBusiness item = _getListBusinessCursor().at(id);
    //     IBusinessCommon(item);
    // }

    function getAddress(uint256 id) public view returns (address) {
        IBusiness item = _getListBusinessCursor().at(id);
        return address(item);
    }
}
