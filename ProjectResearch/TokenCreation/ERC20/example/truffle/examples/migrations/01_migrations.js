var MyToken = artifacts.require("MyToken.sol");

module.exports = async function(deployer) {
    await deployer.deploy(MyToken, 1000000000);
};