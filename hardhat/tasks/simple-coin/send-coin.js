/*******************************************************************************
 *   (c) 2022 Zondax AG
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 ********************************************************************************/
//
// DRAFT!! THIS CODE HAS NOT BEEN AUDITED - USE ONLY FOR PROTOTYPING
//
const util = require("util");
const request = util.promisify(require("request"));

task("send-coin", "Sends SimpleCoin")
.addParam("contractaddress", "The SimpleCoin address")
.addParam("amount", "The amount to send")
.addParam("toaccount", "The account to send to")
.setAction(async (taskArgs) => {
    const contractAddr = taskArgs.contractaddress
    const amount = taskArgs.amount
    const toAccount = taskArgs.toaccount
    const networkId = network.name
    const SimpleCoin = await ethers.getContractFactory("SimpleCoin")
    //Get signer information
    const accounts = await ethers.getSigners()
    const signer = accounts[0]
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

    const simpleCoinContract = new ethers.Contract(contractAddr, SimpleCoin.interface, signer)
    console.log("Sending:", amount, "SimpleCoin to", toAccount)
    await simpleCoinContract.sendCoin(toAccount, amount, {
        gasLimit: 1000000000,
        maxPriorityFeePerGas: priorityFee
    })
    let result = BigInt(await simpleCoinContract.getBalance(toAccount)).toString()
    console.log("Total SimpleCoin at:", toAccount, "is", result)
})

module.exports = {}
