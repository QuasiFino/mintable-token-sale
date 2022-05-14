// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
import "./ERC20Mintable.sol";

contract MyToken is ERC20Mintable {

  constructor() ERC20Mintable() ERC20("StarDucks Capu-Token", "SCT") {}

  // The new ERC20 contract has a default decimal points of 18, we can change it to decimal points of 0 in the constructor by overriding
  function decimals() public pure override returns(uint8) {
    return 0;
  }
  
}
