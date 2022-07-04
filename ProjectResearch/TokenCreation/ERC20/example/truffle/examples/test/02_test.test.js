//1. Khai báo một Contract
const Token = artifacts.require("MyToken");

//2. Khai báo thư viện chai để test Contract
var chai = require("chai");

//2.1 Khai báo các hằng số chai-bn
const BN = web3.utils.BN;
const chaiBN = require('chai-bn')(BN);
chai.use(chaiBN);

//2.2 Khai báo Chai-as-Promised
var chaiAsPromised = require("chai-as-promised");
chai.use(chaiAsPromised);

//2.3 Khai báo chai expect
const expect = chai.expect;

contract("Token Test", async (accounts) => {
    const [ initialHolder, recipient, anotherAccount ] = accounts;

    beforeEach(async() => {
        this.myToken = await Token.new(1000000);
    })

    it("All tokens should be in my account", async () => {
    let instance = this.myToken;
    //Hàm Total Supply lấy tất cả  Supply hiện có
    let totalSupply = await instance.totalSupply();
    //old style:
    //let balance = await instance.balanceOf.call(initialHolder);
    //assert.equal(balance.valueOf(), 0, "Account 1 has a balance");
    //condensed, easier readable style:
    await expect(instance.balanceOf(initialHolder)).to.eventually.be.a.bignumber.equal(totalSupply);
    });

    it("I can send tokens from Account 1 to Account 2", async () => {
        const sendTokens = 1;
        let instance = this.myToken;
       
        let totalSupply = await instance.totalSupply();
        await expect(instance.balanceOf(initialHolder)).to.eventually.be.a.bignumber.equal(totalSupply);
        await expect(instance.transfer(recipient, sendTokens)).to.eventually.be.fulfilled;      
        await expect(instance.balanceOf(initialHolder)).to.eventually.be.a.bignumber.equal(totalSupply.sub(new BN(sendTokens)));
        await expect(instance.balanceOf(recipient)).to.eventually.be.a.bignumber.equal(new BN(sendTokens));
      });
  
  
      it("It's not possible to send more tokens than account 1 has", async () => {
        let instance = this.myToken;
        let balanceOfAccount = await instance.balanceOf(initialHolder);
        await expect(instance.transfer(recipient, new BN(balanceOfAccount+1))).to.eventually.be.rejected;
  
        //check if the balance is still the same
        await expect(instance.balanceOf(initialHolder)).to.eventually.be.a.bignumber.equal(balanceOfAccount);
  
      });
});