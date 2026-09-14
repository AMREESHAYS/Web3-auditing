// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PrizePool {
    address public owner;
    mapping(address => bool) public hasClaimed;
    uint256 public prizeAmount = 1 ether;

    constructor() {
        owner = msg.sender;
    }

    function claimPrize() public {
        require(!hasClaimed[msg.sender], "Already claimed");

        (bool success, ) = msg.sender.call{value: prizeAmount}("");
        

        require(success, "Claim failed");
        hasClaimed[msg.sender] = true;
    }
}