# CCTP Components

This project contains elements to use an arbitrary ERC20 token with CCTP



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

## Deploy

```
forge script script/Token.s.sol:DeployScript --broadcast --rpc-url http://127.0.0.1:8545 --extra-output-files abi --extra-output-files bin
```

For Moonbeam:

```
forge script script/MBToken.s.sol:DeployScript --broadcast --rpc-url http://127.0.0.1:9933 --legacy --extra-output-files abi --extra-output-files bin
```

## CCTP Deployment

Get the token contract details

node script/deploy-details.js 
export FIDDY_ETH_ADDRESS=0xdb98a5bFBA239000213813B2615B8A96E950A79B

node script/mbdeploy-details.js 
export FIDDY_MB_ADDRESS=0xc01Ee7f10EA4aF4673cFff62710E1D7792aBa8f3

Deploy the contracts:

Determine the remote deploy - here we use moonbeam 9
export REMOTE_TOKEN_MESSENGER_DEPLOYER=0x2898FE7a42Be376C8BC7AF536A940F7Fd5aDd423

 python3 scripts/precomputeRemoteMessengerAddress.py --REMOTE_RPC_URL http://127.0.0.1:9933



```
export DEPLOYER_KEY=0xf9832eeac47db42efeb2eca01e6479bfde00fda8fdd0624d45efd0e4b9ddcd3b
export ADMIN_ADDRESS=0x73dA1eD554De26C467d97ADE090af6d52851745E
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

export USDC_CONTRACT_ADDRESS=$FIDDY_ETH_ADDRESS
export REMOTE_USDC_CONTRACT_ADDRESS=$FIDDY_MB_ADDRESS
```

When deploying cctp...

```
export REMOTE_TOKEN_MESSENGER_DEPLOYER=0xf24FF3a9CF04c71Dbc94D0b566f7A27B94566cac
 python3 scripts/precomputeRemoteMessengerAddress.py --REMOTE_RPC_URL http://127.0.0.1:9933
```

## Deployment 

Note: this section in flux at the moment...

1. Install the token on eth and moonbeam
2. Harvest the token addresses on ethereum and moonbeam

export FIDDY_ETH_ADDRESS=0x95BEcB2e0fa7A2Cfb05ed04ad73650e424BE1cF6
export FIDDY_MB_ADDRESS=0x970951a12F975E6762482ACA81E57D5A2A4e73F4

3. Precompute the remote messenger address

export REMOTE_TOKEN_MESSENGER_DEPLOYER=0xf24FF3a9CF04c71Dbc94D0b566f7A27B94566cac
python3 scripts/precomputeRemoteMessengerAddress.py --REMOTE_RPC_URL http://127.0.0.1:9933

(grab the .env entry)

REMOTE_TOKEN_MESSENGER_ADDRESS=0x0f5078e4bb393df0286d31759c0c6da63ea98451

4. Deploy the cctp contracts

Set all the env vars from above

make deploy RPC_URL=http://localhost:8545 SENDER=$ADMIN_ADDRESS


5. Harvest the cctp addresses


export CCTPCTX=$HOME/code/evm-cctp-contracts/broadcast/deploy.s.sol/31337/run-latest.json

node script/cctp-details.js
export MESSAGE_TRANSMITTER=0xB9aF40cA151f74CB11075c78C1A1FE56c75C2ccb
export TOKEN_MESSENGER=0x738D1D469142E3779A28927cA610bCf4156b169B
export TOKEN_MINTER=0x84a3Dc38b787AC2C2f5e0a62bd5f9Ec4dDEbD43e

## Misc

Project init - forge init
Open zepp contracts - forge install OpenZeppelin/openzeppelin-contracts

For python:

virtualenv -p python3 .venv
$ . .venv/bin/activate
(.venv) $ pip install -r requirements.txt

abigen --abi mt.abi --pkg mt --type MessageTransmitter --out MessageTransmitter.go


