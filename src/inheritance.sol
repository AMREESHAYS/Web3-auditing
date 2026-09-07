// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Vehicle {
    
    function describe() public virtual pure returns(string memory) {
        return "This is a vehicle";    
    }


}

contract Car is Vehicle {
    function describe() public override pure returns(string memory) {
            return "This is a car";
    }
}