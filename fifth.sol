// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

contract TokenVault{

    function depositAmount() public payable {
        balances[msg.sender] += msg.value;
    }


    mapping (address => uint256) public balances;

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the Owner");
        _;
    }

    function checkbalance() public view returns (uint256) {
        return address(this).balance;
    }
    function withdraw() public onlyOwner {
        payable(owner).transfer(address(this).balance);
    }
}

    