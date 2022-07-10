const StudentBusiness = artifacts.require("StudentBusiness");

module.exports = function(deployer) {
    deployer.deploy(StudentBusiness);
};