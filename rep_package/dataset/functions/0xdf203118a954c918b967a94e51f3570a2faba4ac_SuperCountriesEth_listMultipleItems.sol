contract SuperCountriesEth {
function listMultipleItems (uint256[] _itemIds, uint256 _price, address _owner) onlyOwner() external {
		for (uint256 i = 0; i < _itemIds.length; i++) {
			listItem(_itemIds[i], _price, _owner);
		}
	}
}