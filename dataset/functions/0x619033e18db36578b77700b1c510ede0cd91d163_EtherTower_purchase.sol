contract EtherTower {
function purchase(uint256 _tokenId) public payable onlyGameStarted {
    Token storage token = tokens[_tokenId];

    // Value must be greater than or equal to the token price
    require(msg.value >= token.price);

    // Prevent user from buying their own token
    require(msg.sender != token.owner);

    uint256 purchaseExcess = msg.value.sub(token.price);

    address newOwner = msg.sender;
    address oldOwner = token.owner;

    uint256 devCut = token.price.mul(4).div(100); // 4%
    uint256 towerBossCut = token.price.mul(3).div(100); // 3%
    uint256 managerCut = getManagerCut(_tokenId, token.price); // 0% - 3%
    uint256 oldOwnerProfit = token.price.sub(devCut).sub(towerBossCut).sub(managerCut);

    // Update token
    uint256 oldPrice = token.price;
    token.owner = newOwner;
    token.price = getNextPrice(token.price);

    // send funds to the dev
    earnings[owner] = earnings[owner].add(devCut);

    // send funds to the big boss
    earnings[tokens[TOWER_BOSS_TOKEN_ID].owner] = earnings[tokens[TOWER_BOSS_TOKEN_ID].owner].add(towerBossCut);

    // send funds to the manager (if applicable)
    if (managerCut > 0) {
      address managerAddress = getManagerAddress(_tokenId);
      earnings[managerAddress] = earnings[managerAddress].add(managerCut);
    }

    // send profit to the previous owner
    sendFunds(oldOwner, oldOwnerProfit);

    // refund any excess to the sender
    if (purchaseExcess > 0) {
      sendFunds(newOwner, purchaseExcess);
    }

    TokenPurchased(_tokenId, oldOwner, newOwner, oldPrice, token.price, now);
  }
}