pragma solidity >=0.6.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 *
 * My Token (ERC20)
 * Tham khảo: https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol
 * @author nguyen_minh_nhut
 */
contract MyToken is ERC20 {

    /**
     * Hàm khởi tạo cho Token 
     * 1. initialSupply: Số lượng cung cấp tùy thuộc vào khả năng của mỗi dự án nên chỗ này
     * sẽ là tham số
     * 2. ERC20 (<Token Name>, <Token Symbol>)
     */
    constructor(uint256 initialSupply) public ERC20("StarDucks Capu-Token", "SCT") {
        // _mint function dùng để cung cấp số lượng token initialSupply cho một địa chỉ nào đó
        // _mint(address,value)
        _mint(msg.sender, initialSupply);

        // Hàm dùng để set thông số Decimals
        _setupDecimals(0);
    }
}
