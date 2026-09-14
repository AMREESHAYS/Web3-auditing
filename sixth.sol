// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

contract SavingsGoal{

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    mapping (address => uint256) public balances;
    
    uint256 public goalAmount;

    constructor() {
        goalAmount = 1 ether; 
    }

    function withdraw(uint256 _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balance"); //check
        balances[msg.sender] -= _amount; //effect
        payable(msg.sender).transfer(_amount); //interact

    }

    function hasReachedGoal(address _user) public view returns (bool) {
        return balances[_user] >= goalAmount;
    }
}