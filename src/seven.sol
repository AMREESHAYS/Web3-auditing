// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

contract Raffle {
    address public host;

    mapping (address => uint256) public entries;

    uint256 public entryFee;

    constructor() {
        host = msg.sender;
        entryFee = 0.005 ether; 


    }

    modifier onlyHost() {
        require(msg.sender == host, "Not the host");
        _;
    }

    function enter() public payable {
        require(msg.value == entryFee, "Incorrect entry fee");
        entries[msg.sender] += 1;
    
    }

    function totalPot() public view returns(uint256) {
        return address(this).balance;

    }

    function payoutWinner(address _winner) public onlyHost {
        payable(_winner).transfer(address(this).balance);
    }
}