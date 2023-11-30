

const main = async () => {

    const CCTPCTX = process.env.CCTPCTX;
    const ethDeploy = require(CCTPCTX);

    console.log(ethDeploy.transactions);
    messageTransmitter =
        ethDeploy.transactions.filter(t => t.contractName == "MessageTransmitter" && t.transactionType == "CREATE")
            .map(t => t.contractAddress)[0];
    console.log(`export MESSAGE_TRANSMITTER=${messageTransmitter}`);

    tokenMessenger =
        ethDeploy.transactions.filter(t => t.contractName == "TokenMessenger" && t.transactionType == "CREATE")
            .map(t => t.contractAddress)[0];
    console.log(`export TOKEN_MESSENGER=${tokenMessenger}`);
   
    tokenMinter =
        ethDeploy.transactions.filter(t => t.contractName == "TokenMinter" && t.transactionType == "CREATE")
            .map(t => t.contractAddress)[0];
    console.log(`export TOKEN_MINTER=${tokenMinter}`);
}

main();