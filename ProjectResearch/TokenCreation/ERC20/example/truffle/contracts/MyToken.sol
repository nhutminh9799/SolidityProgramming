pragma solidity >=0.6.0;

// Import Thư viện ERC20
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * MyToken Contract 
 */
contract MyToken is ERC20 {
    //Constructor 
    constructor(uint256 initialSupply) ERC20("IS-Research Token", "IST") public {
        _mint(msg.sender, initialSupply);
        _setupDecimals(0);
    }
}