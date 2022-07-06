pragma solidity ^0.8.6;
// SPDX-License-Identifier: MIT

contract SimpleBank {
    mapping (address => uint) public balances; //Ánh xạ từ kiểu dữ liệu address sang unsigned int
    event sent(address from, address to, uint amount); //Tạo 1 sự kiện

    //Chức năng nạp tiền cho người dùng
    function deposit(address myAddress, uint amount) public {
        require(amount > 0, unicode"Nhập số tiền nạp khả dụng."); 
        balances[myAddress] += amount;
    }

    //Chức năng lấy số dư của người dùng
    function getBalance(address myAddress) public view returns(uint){
        return balances[myAddress];
    }

    //Chức năng chuyển tiền giữa 2 người dùng
    function send(address sender, address receiver, uint amount) public {
        require(amount <= balances[sender], unicode"Nhập số tiền chuyển khả dụng."); 
        balances[sender] -= amount; 
        balances[receiver] += amount; 
        emit sent(sender, receiver, amount); //Gọi sự kiện sent
    }
}