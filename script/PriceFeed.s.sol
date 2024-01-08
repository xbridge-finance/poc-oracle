// SPDX-License-Identifier: AGPL-3.0-only

pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "forge-std/console.sol";
import "src/interfaces/AggregatorV3Interface.sol";

contract QueryScript is Script {
    // ETH/USD price feed
    AggregatorV3Interface priceFeed = AggregatorV3Interface(0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419);

    function run() external view {
        (
            /* uint80 roundID */
            ,
            int256 price,
            /* uint256 startedAt */
            ,
            /* uint256 timeStamp */
            ,
            /* uint80 answeredInRound */
        ) = priceFeed.latestRoundData();
        console.log("ETH/USD price:", uint256(price) / (1e8));
    }
}
