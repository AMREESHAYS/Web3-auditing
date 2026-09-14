// Layout of Contract:
// license
// version
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// internal & private view & pure functions
// external & public view & pure functions

// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/**
 * @title A sample Raffle contract
 * @author Amreesh
 * @notice This contract is for a sample raffle contract
 * @dev Implement chainlink VRFv2.5
 */
contract raffle {
    error Raffle__NotenoughETHEntered();

    uint256 private immutable i_entrancefee;
    address payable[] private s_players;
    uint256 private immutable i_interval;
    uint256 private s_lasttimeStamp;

    /* Events */

    event RaffleEnter(address indexed player);

    constructor(uint256 entrancefee, uint256 interval) {
        i_entrancefee = entrancefee;
        i_interval = interval;
        s_lasttimeStamp = block.timestamp;
    }

    function enterraffle() public payable {
        if (msg.value < i_entrancefee) {
            revert Raffle__NotenoughETHEntered();
        }
        s_players.push(payable(msg.sender));
        emit RaffleEnter(msg.sender);
    }

    function pickwinner() public {
        if (block.timestamp - s_lasttimeStamp < i_interval) {
            // Logic for picking winner
            revert("Interval time has not passed yet");
        }
    }

    /**Getter function */

    function getentrancefee() external view returns (uint256) {
        return i_entrancefee;
    }
}
