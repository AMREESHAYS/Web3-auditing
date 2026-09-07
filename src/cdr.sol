//Access-Control Bug (modifier)

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TreasuryVault {
    address public owner;
    uint256 public totalFunds;

    constructor() {
        owner = msg.sender;
    }



    function deposit() public payable {
        totalFunds += msg.value;
    }

    function setWithdrawLimit(uint256 _limit) public { //it should not be public means anyone can set the withdrawal limit 
        withdrawLimit = _limit;
    }

    uint256 public withdrawLimit;

    function withdraw(uint256 _amount) public {
        require(_amount <= withdrawLimit, "Exceeds limit"); //check
        require(msg.sender == owner, "Not the owner"); //for this we can use modifier onlyOwnwer()
        totalFunds -= _amount;  //effect and it will do anyother person amount subtract {msg.sender(_amount)} something like that

        (bool success, ) = msg.sender.call{value: _amount}(""); //interaction
        require(success, "Withdraw failed");

        
    }
}