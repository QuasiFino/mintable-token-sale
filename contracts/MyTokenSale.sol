// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
import "./MintedCrowdsale.sol";
import "./KycContract.sol";

contract MyTokenSale is MintedCrowdsale {
  KycContract kyc;

  // rate in TKNbits
  constructor(
    uint256 rate, 
    address payable wallet, 
    IERC20 token,
    KycContract _kyc
    ) 
    MintedCrowdsale()
    CrowdSale(rate, wallet, token)
  {
    kyc = _kyc;
  }

  function _preValidatePurchase(address beneficiary, uint256 weiAmount) internal view override {
    super._preValidatePurchase(beneficiary, weiAmount);
    require(kyc.kycCompleted(beneficiary), "KYC not completed yet, aborting");
  }
}
