// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

interface IBusiness {
    // setter
    function setUser(address value) external;

    function setName(string memory value) external;

    function setPhone(string memory value) external;

    function setProfessional(string memory value) external;

    function setEmail(string memory value) external;

    function setGithub(string memory value) external;

    function setLinkedin(string memory value) external;

    function setSourceImage(string memory value) external;

    function setPassword(string memory value) external;

    //getter
    function getCategory() external view returns (uint256);

    function getUser() external view returns (address);

    function getName() external view returns (string memory);

    function getPhone() external view returns (string memory);

    function getProfessional() external view returns (string memory);

    function getEmail() external view returns (string memory);

    function getGithub() external view returns (string memory);

    function getLinkedin() external view returns (string memory);

    function getSourceImage() external view returns (string memory);

    function getPassword() external view returns (string memory);
}
