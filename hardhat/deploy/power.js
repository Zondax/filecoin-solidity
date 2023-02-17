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
require("hardhat-deploy")
require("hardhat-deploy-ethers")

const ethers = require("ethers")
const fa = require("@glif/filecoin-address")
const util = require("util")
const request = util.promisify(require("request"))

const DEPLOYER_PRIVATE_KEY = network.config.accounts[0]

function hexToBytes(hex) {
    for (var bytes = [], c = 0; c < hex.length; c += 2) bytes.push(parseInt(hex.substr(c, 2), 16))
    return new Uint8Array(bytes)
}

async function callRpc(method, params) {
    var options = {
        method: "POST",
        url: "https://api.zondax.ch/fil/node/hyperspace/rpc/v1",
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

const deployer = new ethers.Wallet(DEPLOYER_PRIVATE_KEY)

module.exports = async ({ deployments }) => {
    const { deploy } = deployments

    const priorityFee = await callRpc("eth_maxPriorityFeePerGas")
    const f4Address = fa.newDelegatedEthAddress(deployer.address).toString()
    const nonce = await callRpc("Filecoin.MpoolGetNonce", [f4Address])

    console.log("Wallet Ethereum Address:", deployer.address)
    console.log("Wallet f4Address: ", f4Address)

    await deploy("PowerAPI", {
        from: deployer.address,
        args: [],
        // since it's difficult to estimate the gas before f4 address is launched, it's safer to manually set
        // a large gasLimit. This should be addressed in the following releases.
        // since Ethereum's legacy transaction format is not supported on FVM, we need to specify
        // maxPriorityFeePerGas to instruct hardhat to use EIP-1559 tx format
        maxPriorityFeePerGas: priorityFee,
        log: true,
    })
}

module.exports.tags = ["PowerAPI"]
