// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract StrictBank {
    address public owner;

    constructor() {
        owner = msg.sender;
    }
    error NotOwner();

    function withdraw() public {
        if (msg.sender != owner){
            revert NotOwner();
        }
    }
    
}