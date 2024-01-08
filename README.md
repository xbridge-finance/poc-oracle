# Proof of Concept for Web3 Oracle Integration

## Introduction

This code repository serves as a Proof of Concept (PoC) for seamlessly integrating Web3 oracle functionality into decentralized applications. The provided code exemplifies the implementation of a secure and reliable oracle service, leveraging the capabilities of the Web3 technology stack.

## Key Features

- Web3 Oracle Integration: Explore a robust integration of Web3 oracle services to facilitate real-world data access within decentralized applications.

- Smart Contract Examples: Discover sample smart contracts demonstrating the utilization of Web3 oracle data in decentralized applications. These contracts showcase how external data can be securely incorporated into on-chain processes.

- Decentralized Data Feeds: The PoC includes modules illustrating the creation and maintenance of decentralized data feeds, allowing DApps to access up-to-date information in a trustless manner.

- Data Verification Mechanisms: Explore the implementation of data verification mechanisms to ensure the authenticity and reliability of information obtained from external sources through Web3 oracles.

## Dev

```sh
forge init
forge build
forge test
```

### Optimistic Oracle

```sh
forge script script/OOV3.s.sol:DeployScript --rpc-url testnet --broadcast
forge script script/OOV3.s.sol:ExecuteScript --rpc-url testnet --broadcast -s 'assertTruth()' 
forge script script/OOV3.s.sol:ExecuteScript --rpc-url testnet --broadcast -s 'settle()'
forge script script/OOV3.s.sol:ExecuteScript --rpc-url testnet -s 'query()'
```

### Chainlink Oracle

```sh
forge script script/PriceFeed.s.sol:QueryScript --rpc-url mainnet
```
