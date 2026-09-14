// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

contract Wallet {
    mapping(address => uint256) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }
}
