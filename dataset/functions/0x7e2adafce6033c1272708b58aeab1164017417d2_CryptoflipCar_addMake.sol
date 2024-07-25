contract CryptoflipCar {
function addMake(string name, address address1, uint256 companyId, uint256 price) public onlyOwner {
  uint makeId = makes.length++;
  makes[makeId].name = name;
  makes[makeId].curPrice   = price;
  makes[makeId].ownerAddress = address1;
  makes[makeId].companyId   = companyId;
  makes[makeId].is_released   = true;

  uint advId = advs.length++;
  advs[advId].text = 'Your Ad here';
  advs[advId].link = 'http://cryptoflipcars.site/';
  advs[advId].curPrice   = 5000000000000000;
  advs[advId].card_type   = 1;
  advs[advId].ownerAddress = address1;
  advs[advId].cardId = makeId;
}
}