// SPDX-License-Identifier: MIT


// This contract allows users to add numbers to an array and calculate the sum of all numbers in the array using a for loop.

// array means a collection of elements of the same type, in this case, uint256. The for loop iterates through each element in the array and adds it to the sum variable. The getSum function returns the total sum of all numbers in the array.

//array means in python, a collection of elements of the same type, in this case, uint256. The for loop iterates through each element in the array and adds it to the sum variable. The getSum function returns the total sum of all numbers in the array.

pragma solidity ^0.8.19;

contract SumCalculator{
    uint256[] public numbers;

    function addNumber(uint256 _num) public {
        numbers.push(_num);
    }

    function getSum() public view returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 0; i < numbers.length; i++) { 
        //i++ = (i = i+1) 
        //condition = i < numbers.length, initialization = uint256 i = 0, i is the temp variable, numbers.length is the length of the array
            sum += numbers[i];
        }
        return sum;
    }
}