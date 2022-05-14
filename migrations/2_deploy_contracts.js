const MyToken = artifacts.require("MyToken");
const MyTokenSale = artifacts.require("MyTokenSale");
const KycContract = artifacts.require("KycContract");
// const MinterRole = artifacts.require("MinterRole");

require("dotenv").config({ path: "../.env" });
// console.log(process.env);

module.exports = async (deployer) => {
  let addr = await web3.eth.getAccounts();
  await deployer.deploy(MyToken);
  await deployer.deploy(KycContract);
  await deployer.deploy(MyTokenSale, 1, addr[0], MyToken.address, KycContract.address);
  let tokenInstance = await MyToken.deployed();
  await tokenInstance.addMinter(MyTokenSale.address);
  // await tokenInstance.transfer(MyTokenSale.address, process.env.INITIAL_TOKENS);
};