//SPDX-License-Identifier: Unlicense

/**  very basic smart contract. 
When deployed, it sets a Greeting variable and exposes 
a function (greet) that can be called to return the greeting. */
pragma solidity ^0.8.3;

import "hardhat/console.sol";

contract Greeter {
    string private greeting;

    constructor(string memory _greeting) {
        console.log("Deploying a Greeter with greeting:", _greeting);
        greeting = _greeting;
    }

    function greet() public view returns (string memory) {
        return greeting;
    }

    function setGreeting(string memory _greeting) public {
        console.log("Changing greeting from '%s' to '%s'", greeting, _greeting);
        greeting = _greeting;
    }
}
