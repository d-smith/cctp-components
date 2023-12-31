// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/Token.sol";

contract DeployScript is Script {
    uint256 private deployerPrivateKey;
    address private ownerAddress;

    function setUp() public {
        deployerPrivateKey = vm.envUint("MB_DEPLOYER_KEY");
        ownerAddress = vm.envAddress("MB_OWNER_ADDRESS");
    }

    function run() public {
        vm.startBroadcast(deployerPrivateKey);
        new FiddyCent(ownerAddress,ownerAddress,ownerAddress);
        vm.stopBroadcast();
    }
}