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
const util = require("util")

const request = util.promisify(require("request"))

task("change-beneficiary", "")
    .addParam("contractaddress", "The SimpleCoin address")
    .addParam("beneficiary", "")
    .addParam("quota", "")
    .addParam("expiration", "")
    .setAction(async (taskArgs) => {
        const contractAddr = taskArgs.contractaddress
        const { beneficiary, quota, expiration } = taskArgs
        const networkId = network.name

        const priorityFee = await callRpc("eth_maxPriorityFeePerGas")

        async function callRpc(method, params) {
            var options = {
                method: "POST",
                url: "https://api.zondax.ch/fil/node/hyperspace/rpc/v0",
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
            }
            const res = await request(options)
            return JSON.parse(res.body).result
        }

        console.log("Calling change_beneficiary method")
        const MinerAPI = await ethers.getContractFactory("MinerAPI")

        //Get signer information
        const accounts = await ethers.getSigners()
        const signer = accounts[0]

        const minerAPIContract = new ethers.Contract(contractAddr, MinerAPI.interface, signer)
        await minerAPIContract.change_beneficiary([beneficiary, quota, expiration], {
            gasLimit: 1000000000,
            maxPriorityFeePerGas: priorityFee,
        })
    })

module.exports = {}
