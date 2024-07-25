contract CryptoflipCar {
function addCar(string name, address address1, uint256 companyId, uint256 makeId, uint256 price ) public onlyOwner {
  uint carId = cars.length++;
  cars[carId].name = name;
  cars[carId].curPrice   = price;
  cars[carId].ownerAddresses.push(address1);
  cars[carId].companyId   = companyId;
  cars[carId].makeId   = makeId;
  cars[carId].is_released   = true;

  uint advId = advs.length++;
  advs[advId].text = 'Your Ad here';
  advs[advId].link = 'http://cryptoflipcars.site/';
  advs[advId].curPrice   = 5000000000000000;
  advs[advId].card_type   = 2;
  advs[advId].ownerAddress = address1;
  advs[advId].cardId = carId;
}
}