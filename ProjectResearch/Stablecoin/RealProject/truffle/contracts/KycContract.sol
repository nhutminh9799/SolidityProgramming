pragma solidity >=0.6.2;

import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * Kyc Contract Is Ownable
 *
 * @author nguyen_minh_nhut
 */
contract KycContract is Ownable {
    // Mapping địa chỉ => bool 
    mapping(address => bool) allowed;

    // Set KyC Completed cho một address nhất định
    function setKycCompleted(address _addr) public onlyOwner {
        // Gán quyền cho địa chỉ đó bằng true
        allowed[_addr] = true;
    }

    // Set KyC Revoked cho một address nhất định
    function setKycRevoked(address _addr) public onlyOwner {
        // Gán quyền cho địa chỉ đó bằng false
        allowed[_addr] = false;
    }

    /**
     * KyC Completed Function
     * Param: address _add
     */
    function kycCompleted(address _addr) public view returns(bool) {
        return allowed[_addr];
    }
}