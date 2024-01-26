## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

How to make and deploy a token using foundry

make a driectory
forge init

delete the 3 counter.sol files
Add the dependencies
forge install OpenZeppelin/openzeppelin-contracts --no-commit
Update Foundry toml file
remappings = ['@openzeppelin=lib/openzeppelin-contracts']
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
write the contract
forge build

make a deploy script

forge script ./script/deploy.s.sol

forge script ./script/deploy.s.sol --rpc-url http://127.0.0.1:8545 --broadcast --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80

cast --to-base 0x714c2 dec    // converts hex to decimal  

SETTING UP .env
after setting up .env file in a terminal run the command
source .env  check it worked with echo $PRIVATE_KEY
forge script ./script/deploy.s.sol --rpc-url $RPC_URL --broadcast --private-key $PRIVATE_KEY
 

verify contract
forge verify-contract 0x19a8e55e7C7E3977Ec1A1C5f11745614443114c5
forge verify-contract --etherscan-api-key $ETHERSCAN_API_KEY --contract-address 0x19a8e55e7C7E3977Ec1A1C5f11745614443114c5 --contract-source-file ./src/usdc.sol --constructor-args "0x8685dBD0dc3a32b15d32Ed8CdF89d34C096B695d"

forge verify-contract --etherscan-api-key $ETHERSCAN_API_KEY --rpc-url $RPC_URL --encoded-constructor-args "0x1d9B1b7B055Ae22C2Dd03aB1946E35ebC3Cbd4A7" 0x3f35E06A06aef82f799E13acd7DA9aD9084Aa503 ./src/usdc.sol:USDC


Best practise 
cast wallet import defaultKey --interactive
save the address 0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266
cast wallet list
forge script ./script/deploy.s.sol --rpc-url $RPC_URL --account defaultKey --sender 0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266 --broadcast -vvvv

another way to deploy
npx thirdweb deploy

INTERACTING WITH SCRIPTS
call the USDC mint function
cast send 0x19a8e55e7C7E3977Ec1A1C5f11745614443114c5 "mint(address, uint256)" 0xE90Eee57653633E7558838b98F543079649c9C2F 500 --rpc-url $RPC_URL --private-key $PRIVATE_KEY