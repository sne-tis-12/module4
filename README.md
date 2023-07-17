# DegenToken Contract

## Description

The DegenToken contract is an ERC20 token smart contract deployed on the Avalanche Fuji network. It allows users to interact with the DegenToken, transfer tokens, mint new tokens, burn existing tokens, redeem items, and manage allowances.

## Getting Started

### Installing

To use the DegenToken contract, follow these steps:

1. Download the contract code.
2. Run `npm install` to install the required libraries

### Executing Program

To deploy and interact with the DegenToken contract, follow these steps:

1. Configure Hardhat to use the Avalanche Fuji network by updating the `hardhat.config.js` file with the necessary network details.
2. Deploy the DegenToken contract to the Avalanche Fuji network using Hardhat. Run the following command in your project directory:

   ```
   npx hardhat run --network fuji scripts/deploy.js
   ```

3. Use Remix and Metamask as the injected provider to interact with the contract. Connect Metamask to the Avalanche Fuji network and ensure you have some test AVAX in your Metamask wallet for gas fees.
4. Copy the DegenToken contract code into a new file in Remix and compile the contract.
5. Select the "Injected Web3" environment in Remix to connect to Metamask.
6. Use the provided functions in the contract to interact with the DegenToken.

## Acknowledgement

This project was completed as part of the assessment for the Avalanche course offered by MetaCrafters. I would like to express our gratitude to MetaCrafters for providing the valuable learning resources and guidance throughout the course.

## License

This project is licensed under the MIT License.

## Author
[Sneha Kumari](https://www.linkedin.com/in/snetis/)