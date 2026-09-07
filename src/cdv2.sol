// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract StakingRewards {
    address public admin;
    mapping(address => uint256) public stakes;

    constructor() {
        admin = msg.sender;
    }

    function setRewardRate(uint256 _rate) public {
        rewardRate = _rate;
    }

    uint256 public rewardRate;

    function stake() public payable {
        stakes[msg.sender] += msg.value;
    }
}