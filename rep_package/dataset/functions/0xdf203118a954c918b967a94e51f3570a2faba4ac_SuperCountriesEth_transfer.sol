contract SuperCountriesEth {
function transfer(address _to, uint256 _itemId) onlyERC721() public {
		require(msg.sender == ownerOf(_itemId));
		_transfer(msg.sender, _to, _itemId);
	}
}