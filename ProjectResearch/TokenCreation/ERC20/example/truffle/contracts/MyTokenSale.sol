pragma solidity ^0.6.0;

import "./Crowdsale.sol";

contract MyTokenSale is Crowdsale {

    constructor(
        uint256 rate, // rate in TKNbits
        address payable wallet,
        IERC20 token
    ) public Crowdsale(rate, wallet, token) {}
}
