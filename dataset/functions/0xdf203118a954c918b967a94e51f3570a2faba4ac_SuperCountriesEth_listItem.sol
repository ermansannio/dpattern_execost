contract SuperCountriesEth {
function listItem (uint256 _itemId, uint256 _price, address _owner) onlyOwner() public {
		require(_price > 0);
		require(priceOfItem[_itemId] == 0);
		require(ownerOfItem[_itemId] == address(0));

		ownerOfItem[_itemId] = _owner;
		priceOfItem[_itemId] = _price;
		previousPriceOfItem[_itemId] = 0;
		listedItems.push(_itemId);
		newEntity(_itemId, _price);
	}
}