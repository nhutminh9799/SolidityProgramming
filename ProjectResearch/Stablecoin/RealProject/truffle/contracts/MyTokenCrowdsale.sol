pragma solidity ^0.6.2;

import "./Crowdsale.sol";
import "./KycContract.sol";


/**
 *
 * My Token Crowdsale is Crowdsale
 *
 * @author nguyen_minh_nhut
 */
contract MyTokenCrowdsale is Crowdsale {
    // Được thêm tại bước 6
    KycContract kyc;

    /**
     * Contructor My Token Crowdsale
     */
    constructor(
        uint256 rate, // rate in TKNbits
        address payable wallet,
        IERC20 token,
        KycContract _kyc // Được thêm tại bước 6
    ) public Crowdsale(rate, wallet, token) {
        kyc = _kyc; // Được thêm tại bước 6
    }

    /**
     * Được thêm tại bước 6
     */
    function _preValidatePurchase(address beneficiary, uint256 weiAmount)
        internal
        view
        override
    {
        super._preValidatePurchase(beneficiary, weiAmount);
        require(
            kyc.kycCompleted(beneficiary),
            "KYC not completed yet, aborting"
        );
    }
}
