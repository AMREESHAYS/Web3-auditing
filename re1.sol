// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract safeVault {


  
  mapping(address => uint256) public balances;

  function deposit() public payable{
    balances[msg.sender] += msg.value;
  }

  function withdraw(uint256 _amount) public{
    require(balances[msg.sender] >= _amount, "Insufficient balance"); //check
    balances[msg.sender] -= _amount;  //effect 
    payable(msg.sender).transfer(_amount); //interaction
  }
}