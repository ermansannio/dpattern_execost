contract Dogs {
function createSecondPromoCollectible(uint256 tokenId, address _creator, uint256 _price, address _owner) public onlyCOO {
    require(collectibleIndexToOwner[tokenId]==address(0));
    require(promoCreatedCount < PROMO_CREATION_LIMIT);

    address collectibleOwner = _owner;
    if (collectibleOwner == address(0)) {
      collectibleOwner = cooAddress;
    }

    if (_price <= 0) {
      _price = getInitialPriceOfToken(tokenId);
    }

    promoCreatedCount++;
    _createCollectible(tokenId, _price);
    subTokenCreator[tokenId] = _creator;
    unlocked[tokenId] = true;
    // This will assign ownership, and also emit the Transfer event as
    // per ERC721 draft
    _transfer(address(0), collectibleOwner, tokenId);

  }
}