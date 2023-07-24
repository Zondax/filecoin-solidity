# No optimization
## --via-ir false
./bin/solc contracts/**/*.sol \
  solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ \
  @ensdomains=${PWD}/node_modules/@ensdomains/ \
  @zondax/solidity-bignumber/=lib/solidity-BigNumber/ \
  -o output \
  --evm-version london \
  --metadata \
  --overwrite

if [ $? -eq 0 ];
then
  echo "Compiled without ir and without optimization successfully."
else
  echo "Failed to compile without ir and without optimization."
fi

## --via-ir true
./bin/solc contracts/**/*.sol \
  solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ \
  @ensdomains=${PWD}/node_modules/@ensdomains/ \
  @zondax/solidity-bignumber/=lib/solidity-BigNumber/ \
  -o output \
  --evm-version london \
  --via-ir \
  --metadata \
  --overwrite

if [ $? -eq 0 ];
then
  echo "Compiled with ir and without optimization successfully."
else
  echo "Failed to compile with ir and without optimization."
fi

# Optimizided
## --via-ir false
./bin/solc contracts/**/*.sol \
  solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ \
  @ensdomains=${PWD}/node_modules/@ensdomains/ \
  @zondax/solidity-bignumber/=lib/solidity-BigNumber/ \
  -o output \
  --evm-version london \
  --optimize \
  --optimize-runs 10000 \
  --metadata \
  --overwrite

if [ $? -eq 0 ];
then
  echo "Compiled without ir and with optimization successfully."
else
  echo "Failed to compile without ir and with optimization."
fi

## --via-ir true
./bin/solc contracts/**/*.sol \
  solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ \
  @ensdomains=${PWD}/node_modules/@ensdomains/ \
  @zondax/solidity-bignumber/=lib/solidity-BigNumber/ \
  -o output \
  --evm-version london \
  --optimize \
  --optimize-runs 10000 \
  --via-ir \
  --metadata \
  --overwrite

if [ $? -eq 0 ];
then
  echo "Compiled with ir and with optimization successfully."
else
  echo "Failed to compile with ir and with optimization."
fi
