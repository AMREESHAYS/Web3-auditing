// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;
// struct is a user-defined data type that allows you to group related data together. It is similar to a class in object-oriented programming languages. In Solidity, structs are used to define complex data types that can hold multiple values of different types.


//struct in python terms is a dictionary or a named tuple
 
contract Student{
    struct StudentInfo {
        string name;
        uint256 grade;
    }
    mapping(address => StudentInfo) public students;


    function registerStudent(string memory _name, uint256 _grade) public {
        students[msg.sender] = StudentInfo(_name, _grade);
    }

}
