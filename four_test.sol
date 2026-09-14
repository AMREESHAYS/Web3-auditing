// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MembershipClub{
    mapping(address => bool) public isMember;

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the Owner");
        _;
    }

    function joinClub() public payable{
        require(msg.value >= 0.01 ether, "Minimum payment of 0.01 ether required to join the club");
        isMember[msg.sender] = true;
    }

    function kickMember(address _member) public onlyOwner{
        isMember[_member] = false;
    }
}
