pragma solidity ^0.8.6;

import "ProjectResearch/SupplyChain/Item.sol";
import "ProjectResearch/SupplyChain/Ownable.sol";

contract ItemManager is Ownable {
    
    // Saves the present state of each item in the supply chain
    enum SupplyChainSteps{Created, Paid, Delivered}
     
    // An object which defines an item in the supply chain
    struct S_item {
        Item _item;
        ItemManager.SupplyChainSteps _step;
        string _identifier;
    }
    
    // A mapping of all objects in the supply chain for easier access and keeping note of history
    mapping(uint => S_item) public items;
    uint index;
    
    // Emitting an event on the state change of an object
    event SupplyChainStep(uint _index, uint step, address _address);
    
    // Creating a new object by saving all the parameters of the item object
    function createItem(string memory _identifier, uint _priceInWei) public onlyOwner {
        // Creates an item object
        Item item = new Item(this, _priceInWei, index);
        items[index]._item = item;
        items[index]._identifier = _identifier;
        items[index]._step = SupplyChainSteps.Created;
        emit SupplyChainStep(index, uint(items[index]._step), address(item));
        index++;
    }
    
    // Triggering payment when the given conditions satisfy
    function triggerPayment(uint _index) public payable {
        // Fetches an existing item object
        Item item = items[_index]._item;
        // Only item object itself can trigger its payment
        require(address(item) == msg.sender, "Only items are allowed to update themselves");
        require(item.priceInWei() >= msg.value, "Not fully paid");
        require(items[_index]._step == SupplyChainSteps.Created, "Item further in supply chain");
        items[_index]._step = SupplyChainSteps.Paid;
        emit SupplyChainStep(_index, uint(items[_index]._step), address(item));
    }
    
    // Triggering delivery when the given conditions satisfy
    function triggerDelivery(uint _index) public onlyOwner {
        require(items[_index]._step == SupplyChainSteps.Paid, "Item further in supply chain");
        items[_index]._step = SupplyChainSteps.Delivered;
        emit SupplyChainStep(_index, uint(items[_index]._step), address(items[_index]._item));
    }
}