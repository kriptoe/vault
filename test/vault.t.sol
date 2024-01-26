// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

import {DeployVault} from "../../script/deploy.s.sol";
import {USDC} from "../../src/usdc.sol";
import {Vault} from "../../src/vault.sol";
import {Test, console} from "forge-std/Test.sol";
import {StdCheats} from "forge-std/StdCheats.sol";

contract FundMeTest is  Test {
    Vault public vault;
    USDC public usdc;

    uint256 public constant SEND_VALUE = 0.1 ether; // just a value to make sure we are sending enough!
    uint256 public constant STARTING_USER_BALANCE = 10 ether;
    uint256 public constant GAS_PRICE = 1;

    address public constant USER = address(1);

    function setUp() external {
        usdc = new USDC(msg.sender);
        vault = new Vault(address(usdc), msg.sender);
    }


    function testTotalSupplyUSDC() public {
       assertEq(usdc.totalSupply(), 500000 * 10 ** 18);
       console.log("USDC Total Supply = ", 500000 * 10 ** 18);
    }

    function testOwnerIsMsgSender () public {
       assertEq(vault.owner(), msg.sender);
       console.log("owner is ", vault.owner());
       console.log(" msg sender is  ", msg.sender);       
    }

function testApproval() public {
    // Initial values
    uint256 approveAmount = 300000 * 10 ** 18; // Change this to the desired deposit amount

        // Alice approves Bob to spend tokens on her behalf
        vm.prank(bob);
        ourToken.approve(alice, initialAllowance);
        uint256 transferAmount = 500;


    // Approve the Vault contract to spend tokens
    usdc.approve(address(vault), approveAmount);

    // Log the address that is calling the approve function
    console.log("Caller address: ------------------------------------------ ", msg.sender);
     console.log("Vaultaddress: ------- - ", address(vault));
    // Check allowance after approval
    assertEq(usdc.allowance(msg.sender, address(vault)), approveAmount, "Allowance mismatch");
}

}