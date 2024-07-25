contract LowRiskBag {
function buyToken() public payable {
    address currentOwner = tokenOwner;
    uint256 currentPrice = tokenPrice;

    require(currentOwner != msg.sender);
    require(msg.value >= currentPrice);
    require(currentPrice > 0);

    uint256 paidTooMuch = msg.value.sub(currentPrice);
    uint256 payment = currentPrice.div(2);
    
    tokenPrice = currentPrice.mul(110).div(50);
    tokenOwner = msg.sender;
    lastBuyBlock = block.number;

    Transfer(currentOwner, msg.sender, currentPrice);
    if (currentOwner != address(0))
      currentOwner.transfer(payment);
    if (paidTooMuch > 0)
      msg.sender.transfer(paidTooMuch);
  }
}