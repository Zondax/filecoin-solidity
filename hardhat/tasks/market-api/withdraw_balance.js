const util = require("util");

const request = util.promisify(require("request"));

task("withdraw_balance", "")
  .addParam("contractaddress", "The contract address")
  .addParam("providerorclient", "")
  .addParam("tokenamount", "")
  .setAction(async (taskArgs) => {
  const contractAddr = taskArgs.contractaddress
    const {providerorclient, tokenamount} = taskArgs
    const networkId = network.name

    const priorityFee = await callRpc("eth_maxPriorityFeePerGas")

    async function callRpc(method, params) {
      var options = {
        method: "POST",
        url: "https://wallaby.node.glif.io/rpc/v0",
        // url: "http://localhost:1234/rpc/v0",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          jsonrpc: "2.0",
          method: method,
          params: params,
          id: 1,
        }),
      };
      const res = await request(options);
      return JSON.parse(res.body).result;
    }

    console.log("Calling withdraw_balance method")
    const MarketAPI = await ethers.getContractFactory("MarketAPI")

    //Get signer information
    const accounts = await ethers.getSigners()
    const signer = accounts[0]


    const marketAPIContract = new ethers.Contract(contractAddr, MarketAPI.interface, signer)
    await marketAPIContract.withdraw_balance([providerorclient, tokenamount], {
      gasLimit: 1000000000,
      maxPriorityFeePerGas: priorityFee
    })
  })

module.exports = {}
