// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

interface IBusiness {
    // setter
    function setId(uint256 value) external;

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
    function getId() external returns (uint256);

    function getCategory() external returns (uint256);

    function getUser() external returns (address);

    function getName() external returns (string memory);

    function getPhone() external returns (string memory);

    function getProfessional() external returns (string memory);

    function getEmail() external returns (string memory);

    function getGithub() external returns (string memory);

    function getLinkedin() external returns (string memory);

    function getSourceImage() external returns (string memory);

    function getPassword() external returns (string memory);
}
