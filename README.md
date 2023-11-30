# CCTP Components

This project contains elements to use an arbitrary ERC20 token with CCTP

## Deploy

forge script script/Token.s.sol:DeployScript --broadcast --rpc-url http://127.0.0.1:8545 --extra-output-files abi --extra-output-files bin

For Moonbeam:

forge script script/MBToken.s.sol:DeployScript --broadcast --rpc-url http://127.0.0.1:9933 --legacy --extra-output-files abi --extra-output-files bin

## Nodes

Start a local ethereum node:

```
cd anvil
./start-anvil.sh
```

Local moonbeam:

```
docker pull purestake/moonbeam:v0.32.2
docker run --rm --name moonbeam_development -p 9944:9944 -p 9933:9933 purestake/moonbeam:v0.32.2 --dev --ws-external --rpc-external 
```

## CCTP Deployment




export DEPLOYER_KEY=0xcb1a18dff8cfcee16202bf86f1f89f8b3881107b8192cd06836fda9dbc0fde1b
export ADMIN_ADDRESS=0x892BB2e4F6b14a2B5b82Ba8d33E5925D42D4431F
export MESSAGE_TRANSMITTER_DEPLOYER_KEY=$DEPLOYER_KEY
export TOKEN_MESSENGER_DEPLOYER_KEY=$DEPLOYER_KEY
export TOKEN_MINTER_DEPLOYER_KEY=$DEPLOYER_KEY
export TOKEN_CONTROLLER_DEPLOYER_KEY=$DEPLOYER_KEY
export ATTESTER_ADDRESS=$ADMIN_ADDRESS

export MESSAGE_TRANSMITTER_PAUSER_ADDRESS=$ADMIN_ADDRESS
export TOKEN_MINTER_PAUSER_ADDRESS=$ADMIN_ADDRESS
export MESSAGE_TRANSMITTER_RESCUER_ADDRESS=$ADMIN_ADDRESS
export TOKEN_MESSENGER_RESCUER_ADDRESS=$ADMIN_ADDRESS
export TOKEN_MINTER_RESCUER_ADDRESS=$ADMIN_ADDRESS
export TOKEN_CONTROLLER_ADDRESS=$ADMIN_ADDRESS
export DOMAIN=1
export REMOTE_DOMAIN=2
export BURN_LIMIT_PER_MESSAGE=10000000

export REMOTE_TOKEN_MESSENGER_ADDRESS=0x970951a12f975e6762482aca81e57d5a2a4e73f4
export USDC_CONTRACT_ADDRESS=0xdb98a5bFBA239000213813B2615B8A96E950A79B
export REMOTE_USDC_CONTRACT_ADDRESS=0xc01Ee7f10EA4aF4673cFff62710E1D7792aBa8f3




## Misc

Project init - forge init
Open zepp contracts - forge install OpenZeppelin/openzeppelin-contracts