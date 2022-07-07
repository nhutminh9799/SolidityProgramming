// Gán Biến MyToken thành hợp đồng MyToken.sol
var MyToken = artifacts.require("./MyToken.sol");

// Được tiến hành tại Bước 5
// Gán Biến MyTokenSales thành hợp đồng MyTokenSale.sol
var MyTokenSales = artifacts.require("./MyTokenCrowdsale.sol");

// Được tiến hành tại bước 6
// Gán biến KycContract thành hợp đồng KycContract.sol
var KycContract = artifacts.require("./KycContract.sol");

// Export module Migration với async await function
module.exports = async function (deployer) {
    // Được thêm tại bước 5
    // Lấy tất cả accounts trong ganache
    let addr = await web3.eth.getAccounts();

    await deployer.deploy(MyToken, 1000000000);

    //Được thêm tại bước 6
    await deployer.deploy(KycContract);

    // Được thêm tại bước 5
    // Deploy MyTokenSales
    await deployer.deploy(MyTokenSales, 1, addr[0], MyToken.address,KycContract.address);
    let tokenInstance = await MyToken.deployed();
    await tokenInstance.transfer(MyTokenSales.address, 1000000000);

};



