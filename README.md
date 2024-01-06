# OO

```sh
forge init
forge build
forge test
forge script script/OOV3.s.sol:DeployScript --rpc-url testnet --broadcast
forge script script/OOV3.s.sol:ExecuteScript --rpc-url testnet --broadcast -s 'assertTruth()' 
forge script script/OOV3.s.sol:ExecuteScript --rpc-url testnet --broadcast -s 'settle()'
forge script script/OOV3.s.sol:ExecuteScript --rpc-url testnet --broadcast -s 'query()'
```
