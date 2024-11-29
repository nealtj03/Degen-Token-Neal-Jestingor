// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable (msg.sender) {
    // Define the structure for in-game items
    struct InGameItem {
        uint256 id;
        string name;
        uint256 price; // Price in DGN tokens
    }

    // List of in-game items (TikTok-themed)
    InGameItem[] public inGameItems;

    // Constructor
    constructor() ERC20("Degen", "DGN") {
        // Initialize some TikTok-themed items with prices capped at 50 DGN
        inGameItems.push(InGameItem(1, "TikTok Video Filter", 5 ));  // Price: 5 DGN
        inGameItems.push(InGameItem(2, "Exclusive TikTok Sticker", 10 ));  // Price: 10 DGN
        inGameItems.push(InGameItem(3, "TikTok Coin Boost", 20 ));  // Price: 20 DGN
        inGameItems.push(InGameItem(4, "TikTok Custom Sound", 30 ));  // Price: 30 DGN
        inGameItems.push(InGameItem(5, "Premium TikTok Profile Theme", 50));  // Price: 50 DGN
    }

    // Mint new tokens - Only the contract owner can mint tokens
    function mintTokens(address to, uint256 amount) external onlyOwner {
        require(to != address(0), "Invalid address");
        _mint(to, amount);
    }

    // Transfer tokens - Any player can transfer tokens to other players
    function transferTokens(address recipient, uint256 amount) external {
        require(amount > 0, "Amount must be greater than 0");
        require(balanceOf(msg.sender) >= amount, "Not enough tokens to transfer");
        _transfer(msg.sender, recipient, amount);
    }

    // Redeem tokens for TikTok items
    function redeemTokens(uint256 itemId) external {
        require(itemId < inGameItems.length, "Item does not exist");
        InGameItem memory item = inGameItems[itemId];
        require(balanceOf(msg.sender) >= item.price, "Not enough tokens to redeem this item");

        // Burn tokens as part of the redemption process
        _burn(msg.sender, item.price);
        
        // Here, you could include logic to grant the item to the player (e.g., sending a virtual gift)
        emit Redeemed(msg.sender, itemId, item.name, item.price);
    }

    // Burn tokens - Anyone can burn their tokens (remove them from circulation)
    function burnTokens(uint256 amount) external {
        require(amount > 0, "Amount must be greater than 0");
        require(balanceOf(msg.sender) >= amount, "Not enough tokens to burn");
        _burn(msg.sender, amount); // The player burns their tokens
    }

    // Function to check the balance of a player (this is inherent with ERC20 standard)
    function checkBalance(address account) external view returns (uint256) {
        return balanceOf(account);
    }

    // Event for redeeming items
    event Redeemed(address indexed user, uint256 indexed itemId, string itemName, uint256 price);
}


// Minting new tokens: The platform should be able to create new tokens and distribute them to players as rewards. Only the owner can mint tokens.
// Transferring tokens: Players should be able to transfer their tokens to others.
// Redeeming tokens: Players should be able to redeem their tokens for items in the in-game store.
// Checking token balance: Players should be able to check their token balance at any time.
// Burning tokens: Anyone should be able to burn tokens, that they own, that are no longer needed.

// Owner    - 0x3A24a60b69994977476b46aB8D57C93245c91EC8 150 - 20 transfer to P2 = 130
// Player 1 - 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2 120 
// Player 2 - 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db 100 + 20 = 120

