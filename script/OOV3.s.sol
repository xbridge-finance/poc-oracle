// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "forge-std/console.sol";
import "src/OOV3.sol";

contract DeployScript is Script {
    uint256 pkDeployer = vm.envUint("PRIVATE_KEY");
    OOV3 oo;

    // function setUp() external {
    //     console.log("pk:", pkDeployer);
    //     address u1 = vm.addr(pkDeployer);
    //     console.log("**** u1: ", u1);
    // }

    function run() external {
        console.log("running");
        vm.startBroadcast(pkDeployer);
        oo = new OOV3();
        console.log("oo:", address(oo));
        vm.stopBroadcast();
        console.log("done");
    }
}

contract ExecuteScript is Script {
    uint256 pkDeployer = vm.envUint("PRIVATE_KEY");
    OOV3 oo = OOV3(0xaCC68db524cfbEC93BD07908b4F6C45d30a79Ff9);

    function assertTruth() external {
        vm.startBroadcast(pkDeployer);
        oo.assertTruth();
        vm.stopBroadcast();
    }

    function settle() external {
        vm.startBroadcast(pkDeployer);
        // wait 20s
        bool r = oo.settleAndGetAssertionResult();
        console.log(r, "settleAndGetAssertionResult");
        r = oo.getAssertionResult();
        console.log(r, "getAssertionResult");
        OptimisticOracleV3Interface.Assertion memory ass = oo.getAssertion();
        console.log("assertionTime:", ass.assertionTime);
        console.log("bond:", ass.bond);
        console.log("callbackRecipient:", ass.callbackRecipient);
        vm.stopBroadcast();
    }

    function query() external view {
        bool r = oo.getAssertionResult();
        console.log(r, "getAssertionResult");
        OptimisticOracleV3Interface.Assertion memory ass = oo.getAssertion();
        console.log("assertionTime:", ass.assertionTime);
        console.log("bond:", ass.bond);
        console.log("callbackRecipient:", ass.callbackRecipient);
    }
}
