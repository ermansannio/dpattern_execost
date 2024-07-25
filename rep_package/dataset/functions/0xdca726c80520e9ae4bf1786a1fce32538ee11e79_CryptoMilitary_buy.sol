contract CryptoMilitary {
function buy (uint256 _itemId) payable public {
    require(priceOf(_itemId) > 0);
    require(ownerOf(_itemId) != address(0));
    require(msg.value >= priceOf(_itemId));
    require(ownerOf(_itemId) != msg.sender);
    require(!isContract(msg.sender));
    require(msg.sender != address(0));

    address oldOwner = ownerOf(_itemId);
    address newOwner = msg.sender;
    uint256 price = priceOf(_itemId);
    uint256 excess = msg.value.sub(price);

    _transfer(oldOwner, newOwner, _itemId);
    priceOfItem[_itemId] = nextPriceOf(_itemId);

    emit Bought(_itemId, newOwner, price);
    emit Sold(_itemId, oldOwner, price);

    // Devevloper's cut which is left in contract and accesed by
    // `withdrawAll` and `withdrawAmountTo` methods.
    uint256 devCut = calculateDevCut(price);

    // Transfer payment to old owner minus the developer's cut.
    oldOwner.transfer(price.sub(devCut));

    if (excess > 0) {
      newOwner.transfer(excess);
    }
  }
}