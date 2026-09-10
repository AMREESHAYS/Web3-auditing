// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

contract Raffle {

    address public entryfee;

    constructor() {
        msg.sender = host;
        entryfee = 0.005 ether;
    }

    modifier onlyHost() {
        require(msg.sender == host, "Not the host");
        _;
    }

    function enterRaffle() public payable {
        require(msg.value == entryfee, "Wrong entry Fee");


    }

    function winnerPayout(address _winner) public onlyHost {
        payable(_winner).transfer(address(this).balance);
    }

    function totalPot() public view returns(uint256) {
        return address(this).balance;
    }
}