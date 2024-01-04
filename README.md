# CCTP Components

This project contains elements to use an arbitrary ERC20 token with the [Circle CCTP](https://github.com/circlefin/evm-cctp-contracts) contracts



## Nodes

Start a local ethereum node:

```
cd anvil
./start-anvil.sh
```

Polyon - access Mumbai testnet via Alchemy

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


