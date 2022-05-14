// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./CrowdSale.sol";
import "./ERC20Mintable.sol";

abstract contract MintedCrowdsale is CrowdSale {
  function _deliverTokens(address beneficiary, uint256 tokenAmount) internal virtual override {
    require(
      ERC20Mintable(address(token())).mint(beneficiary, tokenAmount),
      "MintedCrowdsale: minting failed"
    );
  }
}
