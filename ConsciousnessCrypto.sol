// Solidity version and imports
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/draft-ERC20Permit.sol";

contract ConsciousnessCrypto is ERC20, Ownable, Pausable, ERC20Permit {

    uint256 public constant MAX_SUPPLY = 999999999 * (10 ** 18); // Max supply of 999,999,999 tokens

    constructor(uint256 initialSupply) ERC20("ConsciousnessCrypto", "CNC") ERC20Permit("ConsciousnessCrypto") {
        require(initialSupply <= MAX_SUPPLY, "Initial supply exceeds maximum cap");
        _mint(msg.sender, initialSupply); // Mint the initial supply to the contract deployer
    }

    // OnlyOwner modifier ensures only the contract owner can mint new tokens
    function mint(address to, uint256 amount) external onlyOwner whenNotPaused {
        require(totalSupply() + amount <= MAX_SUPPLY, "Minting would exceed the max supply cap");
        _mint(to, amount);
    }

    // Pauses all token transfers in case of emergency
    function pause() external onlyOwner {
        _pause();
    }

    // Unpauses all token transfers
    function unpause() external onlyOwner {
        _unpause();
    }

    // Override _beforeTokenTransfer to implement pause functionality
    function _beforeTokenTransfer(address from, address to, uint256 amount) internal override whenNotPaused {
        super._beforeTokenTransfer(from, to, amount);
        require(totalSupply() <= MAX_SUPPLY, "No additional tokens can be minted");
    }

    // Burn tokens from an account to permanently reduce supply
    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    // Owner can burn tokens from a specific account (with their approval)
    function burnFrom(address account, uint256 amount) external onlyOwner {
        uint256 currentAllowance = allowance(account, msg.sender);
        require(currentAllowance >= amount, "Burn amount exceeds allowance");
        _approve(account, msg.sender, currentAllowance - amount);
        _burn(account, amount);
    }
}
