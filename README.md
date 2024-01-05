# CCTP Components

This project contains elements to use an arbitrary ERC20 token with the [Circle CCTP](https://github.com/circlefin/evm-cctp-contracts) contracts



## Nodes

Start a local ethereum node:

```
cd anvil
./start-anvil.sh
```

Polyon - access Mumbai testnet via Alchemy

For polygon, set the following environment variables:

* PG - EOA for the polygon network
* PGKEY - private key for the polygon network
* PG_URL - Alchemy API URL for the polygon Mumbai test network, including the api version and api key url components.

## Deploy

Use the Python notebooks in the demo directory to deploy:

* deployment-notes-local.ipynb for deployment of two domains to a local ethereum node
* deployment-notes-polygon.ipynb for deployment of one domain to polygon mumbai and one domain to a local ethereum node



## Misc

Project init - forge init
Open zepp contracts - forge install OpenZeppelin/openzeppelin-contracts

For python:

virtualenv -p python3 .venv
$ . .venv/bin/activate
(.venv) $ pip install -r requirements.txt

abigen --abi mt.abi --pkg mt --type MessageTransmitter --out MessageTransmitter.go

One challenge in the implementation was the difference in signatures between the mint functions in the ERC20 and the Circle contracts:ERC20 has a void return type, while the Circle contract returns a boolean. This required a custom implementation of the mint function in my version of the ERC20 contract.



