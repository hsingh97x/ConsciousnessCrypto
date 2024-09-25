# ConsciousnessCrypto
ERC-20 Token for Freedom of Consciousness

## Overview

**ConsciousnessCrypto (CNC)** is an ERC-20 token with a maximum supply of 999,999,999 tokens. It includes standard minting, pausing, and burning features. The owner can mint new tokens (up to the maximum supply), pause/unpause transfers, and burn tokens.

### Key Features:
- **Maximum Supply**: 999,999,999 CNC tokens.
- **Minting**: New tokens can be minted until the total supply reaches the maximum limit.
- **Pausing**: All transfers can be paused by the owner in case of emergency.
- **Burning**: Tokens can be burned by any user or by the owner on behalf of others.

## Prerequisites

- **Node.js** and **npm** installed.
- **MetaMask** or another Ethereum wallet for deploying the contract.
- **Remix IDE** or **Hardhat** for compiling and deploying the contract.
- An Ethereum testnet (Rinkeby, Goerli) or Ethereum mainnet.

## Deployment Instructions

1. **Compile the Contract**:
   - Use **Remix IDE** or **Hardhat** to compile the Solidity contract (`ConsciousnessCrypto.sol`).
   - Ensure that Solidity version 0.8.x is used.

2. **Deploy the Contract**:
   - Deploy the contract to a testnet (e.g., Rinkeby or Goerli) or Ethereum mainnet using a web3 provider like MetaMask.
   - Set the initial supply as a constructor argument (e.g., `500000000 * 10 ** 18` for 500 million tokens).

3. **Interact with the Contract**:
   - After deployment, you can interact with the token contract functions (mint, pause, unpause, burn) via Remix, Hardhat, or directly from your wallet (e.g., MetaMask).

4. **Airdrop Instructions**:
   - Use the `mint()` function to distribute tokens via airdrop to specific addresses. A web-based airdrop UI is provided (`airdrop.html`).

---

## How to Mint More Tokens

You can mint new tokens up to the maximum supply using the `mint` function:

```javascript
await contract.mint("0xRecipientAddress", ethers.utils.parseUnits("1000", 18)); // 1000 CNC tokens
