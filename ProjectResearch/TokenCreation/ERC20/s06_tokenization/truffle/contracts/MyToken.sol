pragma solidity ^0.6.0;

//Import thư viện ERC20
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {

    //Khởi tạo một Token ERC20 tên là IS-Research IS-Research Token mã là IST
    constructor(uint256 initialSupply) ERC20("IS-Research Token", "IST") public {
        _mint(msg.sender, initialSupply);
    _setupDecimals(0);
    }

}