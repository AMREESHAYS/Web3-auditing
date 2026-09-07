// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract AuctionHouse {
    enum AuctionState{ Open, Closed}

    address public owner;

    constructor() {
        owner = msg.sender;

    }

    AuctionState public state = AuctionState.Open;

    mapping(address => uint256) public bids;

    error NotOwner();

    event BidPlaced(address indexed bidder, uint256 amount);

    function placeBid() public payable {
        require(state == AuctionState.Open, "Auction Closed");
        bids[msg.sender] += msg.value;
        emit BidPlaced(msg.sender, msg.value);
    }

    function closeAuction() public {
        if (msg.sender != owner) {
            revert NotOwner();
        }
        state = AuctionState.Closed;
    }

    function withdrawFunds() public {
        require(msg.sender == owner, "Not the owner");
        (bool success, ) = payable(owner).call{value: address(this).balance}("");
        require(success, "Transfer failed.");
    }


}