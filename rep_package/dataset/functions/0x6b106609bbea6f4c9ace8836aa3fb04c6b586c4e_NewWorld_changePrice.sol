contract NewWorld {
function changePrice(uint256 newPrice, uint256 _tokenId) public {
    require((_owns(msg.sender, _tokenId) && !isChangePriceLocked) || (_owns(address(0), _tokenId) && msg.sender == cooAddress));
    require(newPrice<collectibleIndexToPrice[_tokenId]);
    collectibleIndexToPrice[_tokenId] = newPrice;
  }
}