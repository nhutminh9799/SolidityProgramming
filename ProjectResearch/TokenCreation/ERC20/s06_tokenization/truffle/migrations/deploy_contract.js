const SimpleStorage = artifacts.require("./MyToken.sol");

module.exports = function (deployer) {
    await deployer.deploy(MyToken, 1000000000);
};
