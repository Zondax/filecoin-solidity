const util = require("util");

const request = util.promisify(require("request"));

task("change-beneficiary", "")
  .addParam("contractaddress", "The SimpleCoin address")
  .addParam("beneficiary", "")
  .addParam("quota", "")
  .addParam("expiration", "")
  .setAction(async (taskArgs) => {
  const contractAddr = taskArgs.contractaddress
    const {beneficiary, quota, expiration} = taskArgs
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

    console.log("Calling change_beneficiary method")
    const MinerAPI = await ethers.getContractFactory("MinerAPI")

    //Get signer information
    const accounts = await ethers.getSigners()
    const signer = accounts[0]


    const minerAPIContract = new ethers.Contract(contractAddr, MinerAPI.interface, signer)
    await minerAPIContract.change_beneficiary([beneficiary, quota, expiration], {
      gasLimit: 1000000000,
      maxPriorityFeePerGas: priorityFee
    })
  })

module.exports = {}
