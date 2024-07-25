contract EtherBags {
function purchase(uint256 bagId) public payable {
    Bag storage bag = bags[bagId];

    address oldOwner = bag.owner;
    address newOwner = msg.sender;

    // Making sure token owner is not sending to self
    require(oldOwner != newOwner);

    // Safety check to prevent against an unexpected 0x0 default.
    require(_addressNotNull(newOwner));
    
    uint256 sellingPrice = getBagSellingPrice(bag);

    // Making sure sent amount is greater than or equal to the sellingPrice
    require(msg.value >= sellingPrice);

    // Take a transaction fee
    uint256 payment = uint256(SafeMath.div(SafeMath.mul(sellingPrice, 92), 100));
    uint256 purchaseExcess = SafeMath.sub(msg.value, sellingPrice);

    uint256 level = getBagLevel(bag);
    bag.level = SafeMath.add(level, 1);
    bag.owner = newOwner;
    bag.purchasedAt = now;

    // Pay previous tokenOwner if owner is not contract
    if (oldOwner != address(this)) {
      oldOwner.transfer(payment);
    }

    // Trigger BagSold event
    BagSold(bagId, bag.multiplier, sellingPrice, getBagSellingPrice(bag), oldOwner, newOwner);

    newOwner.transfer(purchaseExcess);
  }
}