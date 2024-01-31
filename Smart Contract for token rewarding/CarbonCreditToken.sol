// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CarbonCreditToken is ERC20, Ownable {
    mapping(address => uint256) public carbonReduction;

    event CarbonReductionClaimed(address indexed user, uint256 amount);

    constructor(address initialOwner) ERC20("CarbonCreditToken", "CCT") Ownable(initialOwner) {
        _mint(msg.sender, 1000000 * 10**decimals());
    }

    function claimCarbonReduction(uint256 amount) external {
        require(amount > 0, "Amount must be greater than 0");
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");

        // Perform additional verification based on carbon reduction actions (not implemented in this example)

        // Mint tokens and update carbon reduction mapping
        _mint(msg.sender, amount);
        carbonReduction[msg.sender] += amount;

        emit CarbonReductionClaimed(msg.sender, amount);
    }
}