contract CryptoMyWord {
function listItem (uint256 _price, address _owner, string _name) onlyAdmins() public {
    require(nameToItems[_name].length == 0);
    Token memory token = Token({
      firstMintedBy: _owner,
      mintedAt: uint64(now),
      startingPrice: _price,
      priceOfItem: _price,
      name: _name,
      url: "",
      firstIdOfName: "",
      secondIdOfName: "",
      owner: _owner
    });
    tokenId = tokens.push(token) - 1;
    Name memory namesval = Name({
      name: _name,
      parent: tokenId
    });
    ownerOfItem[tokenId] = _owner;
    priceOfItem[tokenId] = _price;
    startingPriceOfItem[tokenId] = _price;
    nameOfItem[tokenId] = _name;
    nameToItems[_name].push(tokenId);
    listedItems.push(tokenId);
    nameToParents[_name] = tokenId;
    nameTokenId = names.push(namesval) - 1;
    nameToNameToken[_name] = nameTokenId;
  }
}