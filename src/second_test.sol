// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

contract AdminBank{
    uint256 public totalDeposits;

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the Owner");
        _;

    }

    function resetDeposits() public onlyOwner{
        totalDeposits = 0;
    }
    
}

