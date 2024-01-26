// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

import {Script} from "forge-std/Script.sol";
import {USDC} from "../src/usdc.sol";
import {Vault} from "../src/vault.sol";
import {console} from "forge-std/console.sol";


contract DeployVault is Script {
    function run() external returns (USDC) {
        vm.startBroadcast();

        USDC usdc = new USDC(msg.sender);
        console.log("USDC Contract address: ", address(usdc));
        Vault vault = new Vault(address(usdc), msg.sender);
        console.log("Vault ontract address: ", address(vault));
        vm.stopBroadcast();
        return usdc;
    }
}