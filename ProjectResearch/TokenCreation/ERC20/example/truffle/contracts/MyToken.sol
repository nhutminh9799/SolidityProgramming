pragma solidity ^0.6.2;

// Import Thư viện ERC20
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * MyToken Contract
 */
contract MyToken is ERC20 {
    //Constructor
    constructor(uint256 initialSupply)
        public
        ERC20("IS-Research Token", "IST")
    {
        //Mint là quá trình đưa dữ liệu vào trong mạng Blockchain
        _mint(msg.sender, initialSupply);
        _setupDecimals(0);
    }
}
