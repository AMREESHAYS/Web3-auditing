// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Greeting {
    event Greeted(address indexed greeter);

    function sayHello() public {
        emit Greeted(msg.sender);
    }
}