// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract YoppenDEX {
    IERC20 public yoppenToken;
    address public owner;
    uint256 public tokenPrice;

    event Bought(address indexed buyer, uint256 amount);
    event Sold(address indexed seller, uint256 amount);

    constructor(address _yoppenTokenAddress, uint256 _tokenPrice) {
        require(_yoppenTokenAddress != address(0), "YoppenDEX: token address is the zero address");
        yoppenToken = IERC20(_yoppenTokenAddress);
        tokenPrice = _tokenPrice;
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "YoppenDEX: caller is not the owner");
        _;
    }

    // Buy tokens with Ether
    function buyTokens() public payable {
        uint256 amountToBuy = msg.value / tokenPrice;
        uint256 dexBalance = yoppenToken.balanceOf(address(this));
        
        require(amountToBuy > 0, "YoppenDEX: You need to send some Ether");
        require(amountToBuy <= dexBalance, "YoppenDEX: Not enough tokens in the reserve");
        
        yoppenToken.transfer(msg.sender, amountToBuy);
        emit Bought(msg.sender, amountToBuy);
    }

    // Sell tokens and receive Ether
    function sellTokens(uint256 amountToSell) public {
        require(amountToSell > 0, "YoppenDEX: You need to sell at least some tokens");
        uint256 allowance = yoppenToken.allowance(msg.sender, address(this));
        require(allowance >= amountToSell, "YoppenDEX: Check the token allowance");

        yoppenToken.transferFrom(msg.sender, address(this), amountToSell);
        payable(msg.sender).transfer(amountToSell * tokenPrice);
        emit Sold(msg.sender, amountToSell);
    }

    // Function to set a new token price
    function setTokenPrice(uint256 _newPrice) public onlyOwner {
        tokenPrice = _newPrice;
    }

    // Function to transfer ownership
    function transferOwnership(address _newOwner) public onlyOwner {
        require(_newOwner != address(0), "YoppenDEX: new owner is the zero address");
        owner = _newOwner;
    }
}

