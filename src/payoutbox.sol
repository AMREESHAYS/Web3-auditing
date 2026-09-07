// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PayoutBox {

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function withdraw() public {
        require(msg.sender == owner, "Not the owner");
        (bool success, ) = payable(owner).call{value: address(this).balance}("");
        require(success, "Transfer failed.");
    }
}