const ethDeploy = require("../broadcast/PGToken.s.sol/80001/run-latest.json");

const main = async () => {
    //console.log(ethDeploy.transactions);
    fiddyAddress =
        ethDeploy.transactions.filter(t => t.contractName == "FiddyCent")
            .map(t => t.contractAddress)[0];
    console.log(`${fiddyAddress}`)
}

main();