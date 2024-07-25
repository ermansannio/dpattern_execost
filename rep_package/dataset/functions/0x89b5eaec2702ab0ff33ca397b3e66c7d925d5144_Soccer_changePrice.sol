contract Soccer {
function changePrice(uint256 _tokenId, uint256 newPrice) public {
    require((_owns(msg.sender, _tokenId) && !isChangePriceLocked) || (_owns(address(0), _tokenId) && msg.sender == cooAddress));
    Token storage token = collectibleIdx[_tokenId];
    require(newPrice < token.price);
    token.price = newPrice;
    collectibleIdx[_tokenId] = token;
  }
}