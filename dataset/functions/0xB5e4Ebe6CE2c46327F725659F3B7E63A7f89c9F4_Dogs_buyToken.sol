contract Dogs {
function buyToken(uint _tokenId) public payable {
    address oldOwner = collectibleIndexToOwner[_tokenId];
    require(oldOwner!=msg.sender);
    uint256 sellingPrice = collectibleIndexToPrice[_tokenId];
    if (sellingPrice==0) {
      sellingPrice = getInitialPriceOfToken(_tokenId);
      if (_tokenId>MAX_SETS_INDEX)
        subTokenCreator[_tokenId] = msg.sender;
    }

    require(msg.value >= sellingPrice);
    uint256 purchaseExcess = msg.value.sub(sellingPrice);

    uint256 payment = sellingPrice.mul(92).div(100);
    uint256 feeOnce = sellingPrice.sub(payment).div(8);

    // transfer taxes
    if (_tokenId > 0) {
      if (collectibleIndexToOwner[BASE_TOKEN_ID]!=address(0))
        collectibleIndexToOwner[BASE_TOKEN_ID].transfer(feeOnce);
      if (_tokenId > MAX_SETS_INDEX) {
        if (collectibleIndexToOwner[_tokenId % MAX_SETS_INDEX]!=address(0))
          collectibleIndexToOwner[_tokenId % MAX_SETS_INDEX].transfer(feeOnce);
        if (subTokenCreator[_tokenId]!=address(0))
          subTokenCreator[_tokenId].transfer(feeOnce);

        if (unlocked[_tokenId]) {
          lastSubTokenBuyer[BASE_TOKEN_ID] = msg.sender;
          lastSubTokenBuyer[_tokenId % MAX_SETS_INDEX] = msg.sender;
        }
      } else {
        lastSubTokenBuyer[_tokenId].transfer(feeOnce*2);
      }
    } else {
      lastSubTokenBuyer[_tokenId].transfer(feeOnce*2);
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