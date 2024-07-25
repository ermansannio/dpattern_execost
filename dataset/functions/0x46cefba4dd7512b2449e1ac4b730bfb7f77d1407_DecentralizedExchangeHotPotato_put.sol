contract DecentralizedExchangeHotPotato {
function put(address _issuer, uint256 _tokenId, uint256 _price,
               uint256 _startTime, uint256 _endTime) public {
    require(_startTime <= _endTime);                 
    Issuer issuer = Issuer(_issuer);
    require(issuer.ownerOf(_tokenId) == msg.sender);
    issuer.transferFrom(msg.sender, address(this), _tokenId);
    if (orderBookSize == orderBook.length) {
      orderBook.push(Order(msg.sender, msg.sender,  _issuer, _tokenId, _price, _startTime, _endTime));
    } else {    
      orderBook[orderBookSize] = Order(msg.sender, msg.sender,  _issuer, _tokenId, _price, _startTime, _endTime);
    }
    orderBookSize += 1;
  }
}