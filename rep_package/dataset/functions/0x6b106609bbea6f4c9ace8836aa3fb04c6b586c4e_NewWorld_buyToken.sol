contract NewWorld {
function buyToken(uint _tokenId) public payable {
    address oldOwner = collectibleIndexToOwner[_tokenId];
    require(oldOwner!=msg.sender);
    uint256 sellingPrice = collectibleIndexToPrice[_tokenId];
    if (sellingPrice==0) {
      sellingPrice = getInitialPriceOfToken(_tokenId);
      // if it is a new city or other subcountryToken, the creator is saved for rewards on later trades
      if (_tokenId>MAX_COUNTRY_INDEX)
        subTokenCreator[_tokenId] = msg.sender;
    }

    require(msg.value >= sellingPrice);
    uint256 purchaseExcess = msg.value.sub(sellingPrice);

    uint256 payment = sellingPrice.mul(92).div(100);
    uint256 feeOnce = sellingPrice.sub(payment).div(8);

    if (_tokenId > 0) {
      // Taxes for World owner
      if (collectibleIndexToOwner[WORLD_TOKEN_ID]!=address(0))
        collectibleIndexToOwner[WORLD_TOKEN_ID].transfer(feeOnce);
      if (_tokenId > MAX_CONTINENT_INDEX) {
        // Taxes for continent owner
        if (collectibleIndexToOwner[_tokenId % MAX_CONTINENT_INDEX]!=address(0))
          collectibleIndexToOwner[_tokenId % MAX_CONTINENT_INDEX].transfer(feeOnce);
        if (_tokenId > MAX_SUBCONTINENT_INDEX) {
          // Taxes for subcontinent owner
          if (collectibleIndexToOwner[_tokenId % MAX_SUBCONTINENT_INDEX]!=address(0))
            collectibleIndexToOwner[_tokenId % MAX_SUBCONTINENT_INDEX].transfer(feeOnce);
          if (_tokenId > MAX_COUNTRY_INDEX) {
            // Taxes for country owner
            if (collectibleIndexToOwner[_tokenId % MAX_COUNTRY_INDEX]!=address(0))
              collectibleIndexToOwner[_tokenId % MAX_COUNTRY_INDEX].transfer(feeOnce);
            // Taxes for city creator
            subTokenCreator[_tokenId].transfer(feeOnce);
          }
        }
      }
    }
    // Transfers the Token
    collectibleIndexToOwner[_tokenId] = msg.sender;
    if (oldOwner != address(0)) {
      // Payment for old owner
      oldOwner.transfer(payment);
      // clear any previously approved ownership exchange
      delete collectibleIndexToApproved[_tokenId];
    } else {
      Birth(_tokenId, sellingPrice);
      tokens.push(_tokenId);
    }
    // Update prices
    collectibleIndexToPrice[_tokenId] = getNextPrice(sellingPrice, _tokenId);

    TokenSold(_tokenId, sellingPrice, oldOwner, msg.sender);
    Transfer(oldOwner, msg.sender, _tokenId);
    // refund when paid too much
    if (purchaseExcess>0)
      msg.sender.transfer(purchaseExcess);
  }
}