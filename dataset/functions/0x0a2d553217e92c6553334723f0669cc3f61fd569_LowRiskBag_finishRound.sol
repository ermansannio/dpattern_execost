contract LowRiskBag {
function finishRound() public {
    require(tokenPrice > tokenStartPrice);
    require(tokenOwner == msg.sender || lastBuyBlock + newRoundDelay < block.number);
    lastBuyBlock = block.number;
    uint payout = tokenPrice.mul(50).div(110).mul(85).div(100); // 85% of last paid price
    address owner = tokenOwner;
    tokenPrice = tokenStartPrice;
    tokenOwner = address(0);
    owner.transfer(payout);
    NewRound();
  }
}