// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract ClassRoster {
    struct Student {
        string name;
        uint256 score;
    }

    Student[] public roster;

    function addStudent(string memory _name, uint256 _score) public {
        roster.push(Student(_name, _score));
    }

    function countPassing() public view returns (uint256) {
        uint256 passingCount = 0;
        for (uint256 i = 0; i < roster.length; i++) {
            if (roster[i].score >= 60) {
                passingCount += 1;
                return passingcount;
            }
            
        }
    }
}