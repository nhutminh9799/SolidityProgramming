pragma solidity ^0.8.6;

/**
 * Contract Event Solidity 
 */
contract EventSolidity {

    // Mapping Address to Balance
    mapping(address => uint) public tokenBalance;

    event TokenSent(address _from, address _to, uint _amount);
    /**
     * Constructor Token Balance
     */
    constructor() public {
        tokenBalance[msg.sender] = 100;
    }

    /**
     * Send Token From To
     */
    function sendToken(address _to, uint _amount) public returns(bool) {
        require(tokenBalance[msg.sender] > _amount, "Not Enough Money");
        assert(tokenBalance[_to] + _amount >= tokenBalance[_to]);
        assert(tokenBalance[msg.sender] - _amount <= tokenBalance[msg.sender]);

        tokenBalance[msg.sender]-=_amount;
        tokenBalance[_to]+=_amount;

        emit TokenSent(msg.sender, _to, _amount);

        return true;
    }

}