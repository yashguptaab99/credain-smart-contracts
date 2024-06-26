# CredainPayments contracts

This is CredainPayments contracts  
CredainPayments(Goerli) - [0x65D50e4A3A3E290219dEa5f439831c1665a996c1](https://goerli.etherscan.io/address/0x65D50e4A3A3E290219dEa5f439831c1665a996c1#code)  
CredainPayments(Fuji) - [0x3470CAe04f07f0945Cd18F4D4E7A90a720858B36](https://testnet.snowtrace.io/address/0x3470CAe04f07f0945Cd18F4D4E7A90a720858B36#code)

### Tools

-   [Hardhat](https://github.com/nomiclabs/hardhat): compile and run the smart contracts on a local development network
-   [Ethers](https://github.com/ethers-io/ethers.js/): renowned Ethereum library and wallet implementation
-   [Waffle](https://github.com/EthWorks/Waffle): tooling for writing comprehensive smart contract tests
-   [Commitlint](https://github.com/conventional-changelog/commitlint): checks if your commit messages meet the conventional commit format
-   [ESlint](https://github.com/eslint/eslint): Tool for identifying and reporting on patterns found in ECMAScript/JavaScript code
-   [Husky](https://github.com/typicode/husky): Git hooks tool
-   [Mocha](https://github.com/mochajs/mocha): JavaScript test framework running on Node.js
-   [Prettier Plugin Solidity](https://github.com/prettier-solidity/prettier-plugin-solidity): code formatter
-   [Solhint](https://github.com/protofire/solhint): Solidity linter
-   [Solidity-Docgen](https://github.com/OpenZeppelin/solidity-docgen): Solidity Document generator

### Added plugins

-   [hardhat-waffle](https://hardhat.org/hardhat-runner/plugins/nomiclabs-hardhat-waffle): Plugin to build smart contract tests using Waffle in Hardhat
-   [hardhat-etherscan](https://hardhat.org/plugins/nomiclabs-hardhat-etherscan.html): Plugin helps you verify the source code for your Solidity contracts on Etherscan
-   [solidity-coverage](https://www.npmjs.com/package/solidity-coverage): Plugin for coverage generation scripts for test-environment using the solidity-coverage API
-   [hardhat-gas-reporter](https://hardhat.org/plugins/hardhat-gas-reporter.html): Gas usage per unit test. Average gas usage per method. A mocha reporter.
-   [hardhat-deploy](https://www.npmjs.com/package/hardhat-deploy): Hardhat plugin for Deployments
-   [hardhat-contract-sizer](https://www.npmjs.com/package/hardhat-contract-sizer): Calculate compiled contract sizes
-   [hardhat-abi-exporter](https://www.npmjs.com/package/hardhat-abi-exporter): Automatically export Solidity contract ABIs on compilation
-   [hardhat-upgrades](https://www.npmjs.com/package/@openzeppelin/hardhat-upgrades): Hardhat plugin for deploying and managing upgradeable contracts.

## Usage

### Pre Requisites

Before running any command, make sure to prepare install dependencies:

```sh
$ npm install
```

```sh
$ npm prepare
```

### Compile

Compile the smart contracts with Hardhat:

```sh
$ npm run compile
```

### Contract Size

To get the contract size:

```sh
$ npm run contract-size
```

### Test

Run the Mocha tests:

```sh
$ npm test
```

```sh
$ npm run test-staging
```

### Testing coverage

To run the contract testing coverage:

```sh
$ npm run coverage
```

### Docgen

To generate the documents for contracts:

```sh
$ npm run docgen
```

### Deploy contract to goerli (requires Mnemonic and infura API key)

```
npm run deploy:goerli
```

### Validate a contract with etherscan (requires API key)

```
npm run verify:goerli <DEPLOYED_CONTRACT_ADDRESS>
```

### Upgrade contract to goerli (requires Mnemonic and infura API key)

```
npm run upgrade:goerli
```
