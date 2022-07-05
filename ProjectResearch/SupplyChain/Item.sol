pragma solidity ^0.6.0;

import "ProjectResearch/SupplyChain/ItemManager.sol";

// Making a separate contract for each item in the supply chain, which provides every item with a unique address
contract Item {
    uint public priceInWei;
    uint public paidWei;
    uint public index;
    
    ItemManager parentContract;
    
    constructor(ItemManager _parentContract, uint _priceInWei, uint _index) public {
        priceInWei = _priceInWei;
        index = _index;
        parentContract = _parentContract;
    }
    
    receive() external payable {
        require(msg.value == priceInWei, "No partial payments accepted");
        require(paidWei == 0, "Alread is already paid");
        paidWei += msg.value;
        // Checks whether the delivery was complete
        (bool success, ) = address(parentContract).call({value: msg.value})(abi.encodeWithSignature("triggerPayment(uint256)", index));
        require(success, "Delivery did not work");
    }
    
    fallback() external {
        
    }
}