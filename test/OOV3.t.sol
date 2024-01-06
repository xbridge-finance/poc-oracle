// SPDX-License-Identifier: AGPL-3.0-only

pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "src/OOV3.sol";
import "src/OptimisticOracleV3Interface.sol";

contract TestOOV3 is Test {
    OOV3 oo;

    function setUp() public {
        vm.createSelectFork("testnet", 10331380);
        oo = new OOV3();
    }

    function testAssert() public {
        oo.assertTruth();
        console.log("time:", block.timestamp);
        vm.warp(block.timestamp + 30*1000);
        console.log("after:", block.timestamp);
        bool r = oo.settleAndGetAssertionResult();
        assertTrue(r, "settleAndGetAssertionResult");
          r = oo.getAssertionResult();
        assertTrue(r, "getAssertionResult");
        OptimisticOracleV3Interface.Assertion memory ass = oo.getAssertion();
        console.log("assertionTime:", ass.assertionTime);
        console.log("bond:", ass.bond);
        console.log("callbackRecipient:", ass.callbackRecipient);
    }
}
