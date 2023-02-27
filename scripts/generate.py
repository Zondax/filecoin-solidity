# Generate all the tests for unsigned leb128
# Taken from https://pypi.org/project/leb128/

sol_file_header =  """
/*******************************************************************************
 *   (c) 2023 Zondax AG
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

// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.17;

import "../utils/Leb128.sol";
import "../external/Buffer.sol";

/// @notice This file is meant to serve as a deployable contract of the Leb128 lib, as the library by itself is not.
/// @notice It imports the library and create a callable method for each method in the library
/// @author Zondax AG
contract Leb128Generated{}Test {{
    using Buffer for Buffer.buffer;

    function unsiged_integer_leb128_encoding_generated() public pure {{
"""

sol_file_end = """
    }
}
"""

f = open("./u_case.txt","r")
lines = f.readlines()
num_file = 0
i = 0

for line in lines:
    (value, hex) = line.split(" ")
    hex = hex.strip("\n")

    if i % 86 == 0:
        num_file += 1
        sol_file = sol_file_header.format(num_file)

    sol_file += """
        bytes memory expected{i} = hex"{hex}";
        uint64 value{i} = {value};

        Buffer.buffer memory result{i} = Leb128.encodeUnsignedLeb128FromUInt64(value{i});

        require(keccak256(result{i}.buf) == keccak256(expected{i}), "'{value}' is not returning '{hex}'");    
""".format(i=i, hex=hex, value=value)
    i += 1

    if i % 86 == 85:
        sol_file += sol_file_end

        file = open("../contracts/v0.8/tests/leb128.generated{}.test.sol".format(num_file), 'w')
        file.write(sol_file)
        file.close()