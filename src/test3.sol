// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract OrderSystem {
    enum OrderStatus{Placed, Shipped, Delivered}

    address public owner;

    constructor()  {
        owner = msg.sender;
    }

    OrderStatus public status = OrderStatus.Placed;

    error NotOwner();

    event StatusChanged (OrderStatus newStatus);

    function advanceStatus() public {
        if (msg.sender != owner) {
            revert NotOwner();
        }

        if (status == OrderStatus.Placed) {
            status = OrderStatus.Shipped;

        }
        if (status == OrderStatus.Shipped) {
            status = OrderStatus.Delivered;
        }

        emit StatusChanged(status);
    }  
}