// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract TrafficLight {
    enum LightColor { Red, Yellow, Green}

    LightColor public currentLight = LightColor.Red;

    function nextLight() public {
        if (currentLight == LightColor.Green) {
            currentLight = LightColor.Yellow;
        }
        if (currentLight == LightColor.Yellow) {
            currentLight = LightColor.Red;
        }
        if (currentLight == LightColor.Red) {
            currentLight = LightColor.Green;
        }
    }
}