// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TokenBalance {
    mapping(address => uint256) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balance"); //check

        unchecked {
            balances[msg.sender] -= _amount; //effect
        }

        (bool success, ) = msg.sender.call{value: _amount}(""); //interaction
        require(success, "Withdraw failed");
    }
}