contract NewWorld {
function takeOwnership(uint256 _tokenId) public {
    address newOwner = msg.sender;
    address oldOwner = collectibleIndexToOwner[_tokenId];

    // Safety check to prevent against an unexpected 0x0 default.
    require(_addressNotNull(newOwner));

    // Making sure transfer is approved
    require(_approved(newOwner, _tokenId));

    _transfer(oldOwner, newOwner, _tokenId);
  }
}