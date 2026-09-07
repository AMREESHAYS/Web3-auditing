// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract NumberList {
    uint256[] public numbers;

    function addNumber(uint256 _num) public {
        numbers.push(_num);

    
    }

    function getLength() public view returns(uint256) {
        return numbers.length;
    }
}