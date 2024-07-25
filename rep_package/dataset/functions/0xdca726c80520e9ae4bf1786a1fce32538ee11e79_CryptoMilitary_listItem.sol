contract CryptoMilitary {
function listItem (uint256 _itemId, uint256 _price, address _owner) onlyAdmins() public {
    require(_price > 0);
    require(priceOfItem[_itemId] == 0);
    require(ownerOfItem[_itemId] == address(0));

    ownerOfItem[_itemId] = _owner;
    priceOfItem[_itemId] = _price;
    startingPriceOfItem[_itemId] = _price;
    listedItems.push(_itemId);
  }
}