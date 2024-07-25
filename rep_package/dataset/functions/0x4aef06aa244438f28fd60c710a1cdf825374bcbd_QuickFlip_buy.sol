contract QuickFlip {
function buy() public payable {
    uint256 price;
    address oldOwner;

    (price, oldOwner) = getCard();

    require(msg.value >= price);

    address newOwner = msg.sender;
    uint256 purchaseExcess = msg.value - price;

    cardOwner = msg.sender;
    cardPrice = price.mul(12).div(10); // increase by 20%
    purchaseRound = currentRound();

    oldOwner.transfer(price);
    newOwner.transfer(purchaseExcess);
  }
}