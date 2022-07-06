import React, { Component } from "react";
// Vì 3 Contract đã được Migrate nên nó đã vào thư mục Json trong Project Client
import MyToken from "./contracts/MyToken.json";
import MyTokenSale from "./contracts/MyTokenSale.json";
import KycContract from "./contracts/KycContract.json";

// Thư viện cho Web 3
import getWeb3 from "./getWeb3";

import "./App.css";

class App extends Component {
  // Trạng thái ban đầu loaded: false, kycAddress: "0x123", tokenSaleAddress: "" 
  state = { loaded: false, kycAddress: "0x123", tokenSaleAddress: "" };

  componentDidMount = async () => {
    try {
      // Get network provider and web3 instance.
      this.web3 = await getWeb3();

      // Use web3 to get the user's accounts.
      this.accounts = await this.web3.eth.getAccounts();

      // Get the contract instance.
      //this.networkId = await this.web3.eth.net.getId(); <<- this doesn't work with MetaMask anymore
      this.networkId = await this.web3.eth.getChainId();

      //Gọi Contract MyToken
      this.myToken = new this.web3.eth.Contract(
        MyToken.abi,
        MyToken.networks[this.networkId] && MyToken.networks[this.networkId].address,
      );

      //Gọi Contract MyToken Sale
      this.myTokenSale = new this.web3.eth.Contract(
        MyTokenSale.abi,
        MyTokenSale.networks[this.networkId] && MyTokenSale.networks[this.networkId].address,
      );

      //Gọi Contract KycContract
      this.kycContract = new this.web3.eth.Contract(
        KycContract.abi,
        KycContract.networks[this.networkId] && KycContract.networks[this.networkId].address,
      );

      // Set web3, accounts, and contract to the state, and then proceed with an
      // example of interacting with the contract's methods.
      this.setState({ loaded:true, tokenSaleAddress: this.myTokenSale._address });
    } catch (error) {
      // Catch any errors for any of the above operations.
      alert(
        `Failed to load web3, accounts, or contract. Check console for details.`,
      );
      console.error(error);
    }

  };


  handleInputChange = (event) => {
    const target = event.target;
    const value = target.type === "checkbox" ? target.checked : target.value;
    const name = target.name;
    this.setState({
      [name]: value
    });
  }


  handleKycSubmit = async () => {
    const {kycAddress} = this.state;
    await this.kycContract.methods.setKycCompleted(kycAddress).send({from: this.accounts[0]});
    alert("Account "+kycAddress+" is now whitelisted");
  }

  render() {
    if (!this.state.loaded) {
      return <div>Loading Web3, accounts, and contract...</div>;
    }
    return (
      <div className="App">
        <h1>IS Ressearch Project</h1>
        <p>Get Your Token In IST</p>
        <h2>Smart Contract Example</h2>
        Address to allow: <input type="text" name="kycAddress" value={this.state.kycAddress} onChange={this.handleInputChange} />
        <button type="button" onClick={this.handleKycSubmit}>Add Address to Whitelist</button>
        <h2>Buy ISResearch-Tokens</h2>
        <p> Send Ether to this address: {this.state.tokenSaleAddress}</p>
      </div>
    );
  }
}

export default App;