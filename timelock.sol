// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TimeLock {
    uint256 public unlockTime;

    constructor() {
        unlockTime = block.timestamp + 60;
    }

    function isUnlocked() public view returns (bool) {
        return block.timestamp >= unlockTime;
    }
}
