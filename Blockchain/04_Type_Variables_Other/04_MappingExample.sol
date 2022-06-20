pragma solidity ^0.8.6;

contract LedgerBalance {
   mapping(address => uint) public balances;
   mapping(address => string) public tenChuTaiKhoan;

     function updateBalance(uint newBalance) public {
      balances[msg.sender] = newBalance;
     }

     function updateTenChuTaiKhoan(string memory newName) public {
        tenChuTaiKhoan[msg.sender] = newName;
     }
}

contract Updater {
   function updateBalance() public returns (uint) {
      LedgerBalance ledgerBalance = new LedgerBalance();
      ledgerBalance.updateBalance(10);
      return ledgerBalance.balances(address(this));
   }
}