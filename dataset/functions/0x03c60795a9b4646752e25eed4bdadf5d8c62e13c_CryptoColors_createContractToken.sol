contract CryptoColors {
function createContractToken(uint256 _tokenId, uint256 _startingPrice, uint256 _payoutPercentage, address _owner) onlyOwner() public {

    // make sure price > 0
    require(_startingPrice > 0);
    // make sure token hasn't been used yet
    require(cryptoColorData[_tokenId].price == 0);
    
    // create new token
    CryptoColor storage newCryptoColor = cryptoColorData[_tokenId];

    newCryptoColor.owner = _owner;
    newCryptoColor.price = getNextPrice(_startingPrice);
    newCryptoColor.lastPrice = _startingPrice;
    newCryptoColor.payout = _payoutPercentage;
    newCryptoColor.startingPrice = _startingPrice;

    // store cryptoColor in storage
    listedCryptoColors.push(_tokenId);
    
    // mint new token
    _mint(_owner, _tokenId);
  }
}