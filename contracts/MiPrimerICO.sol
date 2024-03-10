// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract ICO {
    IERC20 public token;
    address public wallet;
    uint256 public rate;

    event TokensPurchased(address indexed purchaser, address indexed beneficiary, uint256 value, uint256 amount);

    constructor(address _token, address _wallet, uint256 _rate) {
        require(_token != address(0), "ICO: token is the zero address");
        require(_wallet != address(0), "ICO: wallet is the zero address");
        require(_rate > 0, "ICO: rate is 0");
        
        token = IERC20(_token);
        wallet = _wallet;
        rate = _rate;
    }

    function buyTokens(address beneficiary, uint256 weiAmount) public payable {
        require(beneficiary != address(0), "ICO: beneficiary is the zero address");
        require(weiAmount > 0, "ICO: weiAmount is 0");

        uint256 tokens = weiAmount * rate;
        token.transferFrom(wallet, beneficiary, tokens);

        emit TokensPurchased(msg.sender, beneficiary, weiAmount, tokens);
    }

    receive() external payable {
        buyTokens(msg.sender, msg.value);
    }
}