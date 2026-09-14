// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Agechecker{
    function checkAge(uint256 _age) public pure returns (string memory) {
        if (_age >= 18) {
            return "Adult";
        }
        else {
            return "Minor";
        }
        
    }
}