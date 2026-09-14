    // SPDX-License-Identifier: MIT

    pragma solidity 0.8.19;

    contract Counter{
        uint256 public count;

        function increment() public {
            count += 1;
        }

        function getCount() public view returns (uint256) {
            return count;
        
        }

        function incrementby (uint256 _value) public {
            require(_value > 0, "Value must be greater than zero");
            count += _value;
        }

        function whoCalledMe() public view returns (address) {
            return msg.sender;
        }
    }