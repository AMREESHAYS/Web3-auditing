// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

interface IRewardToken {
    function reward(address to, uint256 amount) external;
}

contract Gym {
    enum MembershipTier { Basic, Premium }

    struct Member {
        string name;
        MembershipTier tier;
        uint256 visits;
    }

    address public owner;
    Member[] public members;
    mapping(address => uint256) public memberIndex;

    error NotOwner();
    event CheckedIn(address indexed member, uint256 visitCount);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    function registerMember(string memory _name, MembershipTier _tier) public onlyOwner {
        members.push(Member(_name, _tier, 0));
        memberIndex[msg.sender] = members.length - 1;
    }

    function checkIn() public {
        uint256 index = memberIndex[msg.sender];
        members[index].visits += 1;
        emit CheckedIn(msg.sender, members[index].visits);
    }

    function countPremiumMembers() public view returns (uint256) {
        uint256 count = 0;
        for (uint256 i = 0; i < members.length; i++) {
            if (members[i].tier == MembershipTier.Premium) {
                count += 1;
            }
        }
        return count;
    }
}