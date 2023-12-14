const ethDeploy = require("../broadcast/Token.s.sol/31337/run-latest.json");

const main = async () => {
    //console.log(ethDeploy.transactions);
    fiddyAddress =
        ethDeploy.transactions.filter(t => t.contractName == "FiddyCent")
            .map(t => t.contractAddress)[0];
    console.log(`${fiddyAddress}`)

}

main();
