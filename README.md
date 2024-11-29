# Degen Token Smart Contract

This repository contains the smart contract for the **Degen Token** (DGN) on the **Avalanche Fuji Testnet**. The token is an **ERC-20** token that is used within a gaming environment to reward players, allow them to transfer tokens, redeem in-game items, and burn tokens they no longer need.

## Overview

The **Degen Token (DGN)** is an ERC-20 token used in the **Degen Gaming** platform. The contract includes several key features:

- **Minting**: The platform (contract owner) can mint tokens and distribute them as rewards to players.
- **Transferring**: Players can transfer tokens to others in the system.
- **Redeeming**: Players can redeem tokens for in-game TikTok-themed items.
- **Burning**: Players can burn tokens to remove them from circulation.
- **Checking Balances**: Players can check their token balances at any time.

## Smart Contract Features

1. Minting Tokens
- Minting can only be done by the contract owner (Degen Gaming platform).
- This is achieved using the mintTokens function.

2. Transferring Tokens
- Any player can transfer their tokens to another player using the transferTokens function.

3. Redeeming Tokens
- Players can redeem tokens for **TikTok-themed in-game items**.
- Examples of items available for redemption:
  - **TikTok Video Filter** – 5 DGN
  - **Exclusive TikTok Sticker** – 10 DGN
  - **TikTok Coin Boost** – 20 DGN
  - **TikTok Custom Sound** – 30 DGN
  - **Premium TikTok Profile Theme** – 50 DGN
- The tokens are burned when redeemed.

4. Burning Tokens
- Players can burn their tokens using the burnTokens function to remove them from circulation.

5. Checking Token Balance
- Players can check their balance at any time using the checkBalance function.

## Conclusion
Conclusion
In this project, we successfully followed the instructions to:
1. Create the Degen Token (DGN) as an ERC-20 token with features like minting, transferring, redeeming, burning, and checking balances.
2. Deploy the contract to the Avalanche Fuji Testnet.
3. Test the contract's core functionalities.
4. Verify the smart contract on Snowtrace for transparency and security.

### Author:
Neal Tracy D. Jestingor | 202111095@fit.edu.ph

### License
This project is licensed under the MIT License.


