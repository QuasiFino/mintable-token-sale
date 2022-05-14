// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./MinterRole.sol";

abstract contract ERC20Mintable is ERC20, MinterRole {

  function mint(address account, uint256 amount) public onlyMinter returns(bool) {
    _mint(account, amount);
    return true;
  }
}
