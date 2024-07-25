contract Soccer {
function buyToken(uint _tokenId) public payable {
    require(!isContract(msg.sender));
    
    Token memory token = collectibleIdx[_tokenId];
    address oldOwner = address(0);
    uint256 sellingPrice;
    if (token.owner == address(0)) {
        sellingPrice = getInitialPriceOfToken(_tokenId);
        token = Token({
            owner: msg.sender,
            price: sellingPrice
        });
    } else {
        oldOwner = token.owner;
        sellingPrice = token.price;
        require(oldOwner != msg.sender);
    }
    require(msg.value >= sellingPrice);
    
    address[3] storage lastOwners = mapToLastOwners[_tokenId];
    uint256 payment = _handle(_tokenId, sellingPrice, lastOwners);

    // Transfers the Token
    token.owner = msg.sender;
    token.price = getNextPrice(sellingPrice, _tokenId);
    mapToLastOwners[_tokenId] = _addLastOwner(lastOwners, oldOwner);

    collectibleIdx[_tokenId] = token;
    if (oldOwner != address(0)) {
      // Payment for old owner
      oldOwner.transfer(payment);
      // clear any previously approved ownership exchange
      delete collectibleIndexToApproved[_tokenId];
    } else {
      Birth(_tokenId, sellingPrice);
      tokens.push(_tokenId);
    }

    TokenSold(_tokenId, sellingPrice, oldOwner, msg.sender);
    Transfer(oldOwner, msg.sender, _tokenId);

    // refund when paid too much
    uint256 purchaseExcess = msg.value.sub(sellingPrice);
    if (purchaseExcess > 0) {
        msg.sender.transfer(purchaseExcess);
    }
  }
}