// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PiggyBank {
    mapping(address => uint256) public balances;

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the Owner");
        _;
    }
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        balances[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);

    }
    
    function getContractBalance() public view onlyOwner returns (uint256) {
        return address(this).balance;
    }
}