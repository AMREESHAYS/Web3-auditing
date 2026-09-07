// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

contract TrackedBank{
    uint256 public totalDeposits;

    address public lastDepositor;


    function addDeposit(uint256 _amount) public {
        require(_amount > 0, "deposit amount must be greater than zero");
        totalDeposits += _amount;
        lastDepositor = msg.sender;
    }
}
