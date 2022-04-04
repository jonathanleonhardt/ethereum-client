//SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

import "hardhat/console.sol";

contract MyOwnToken {
  string public name = "Jonathan Trash Token";
  string public symbol = "JTT";
  uint public totalSupply = 1000000;
  uint8 public constant decimals = 18;

  mapping(address => uint) balances;

  constructor() {
    console.log("Deploying my own token called:", symbol );
    balances[msg.sender] = totalSupply;
  }

  function transfer(address to, uint amount) external {
    require(balances[msg.sender] >= amount, "Not enough tokens");
    balances[msg.sender] -= amount;
    balances[to] += amount;
  }

  function balanceOf(address account) external view returns (uint) {
    return balances[account];
  }
}