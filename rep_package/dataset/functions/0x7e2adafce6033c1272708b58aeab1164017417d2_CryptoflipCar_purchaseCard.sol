contract CryptoflipCar {
function purchaseCard(uint256 _cardType, uint256 _cardId) public payable {
  require(isPaused == false);   
  uint256 totalpercent = 150;
  uint256 ownercount = 0;
  if (_cardType == 0){
      require(companies[_cardId].is_released == true);
      require(msg.value >= companies[_cardId].curPrice);
      totalpercent = totalpercent + 5;
  } else if (_cardType == 1) {
      require(makes[_cardId].is_released == true);
      require(msg.value >= makes[_cardId].curPrice);      
      totalpercent = totalpercent + 5 + 2;
  } else if (_cardType == 2) {
      require(cars[_cardId].is_released == true);
      require(msg.value >= cars[_cardId].curPrice);            
      uint256 len = cars[_cardId].ownerAddresses.length;
      ownercount = 1;
      if (cars[_cardId].ownerAddresses.length > 4){
        ownercount = 3;
      } else {
        ownercount = len-1;
      }
      totalpercent = 150 + 5 + 2 + 2 + mul(ownercount, 2);
  }

  uint256 commissionOwner = msg.value;
  uint256 commission1percent = div(mul(msg.value, 1) , totalpercent);  
  if (whalecardAreInitiated == true){
    totalpercent = totalpercent + 1;

    whalecard.ownerAddress.transfer(commission1percent);
    commissionOwner = commissionOwner - commission1percent;    
  }
  
  uint256 commission5percent = mul(commission1percent, 5);
  foundTeamAddress.transfer(commission5percent);

  commissionOwner = commissionOwner - commission5percent;
  uint256 commission2percent = mul(commission1percent, 2);

  if (_cardType == 0){
    companies[_cardId].ownerAddress.transfer(commissionOwner);
    companies[_cardId].ownerAddress = msg.sender;
    companies[_cardId].curPrice = div(mul(companies[_cardId].curPrice, totalpercent), 100);
  } else if (_cardType == 1) {
    uint256 companyId = makes[_cardId].companyId;
    companies[companyId].ownerAddress.transfer(commission2percent);
    commissionOwner = commissionOwner - commission5percent;
    makes[_cardId].ownerAddress.transfer(commissionOwner);
    makes[_cardId].ownerAddress = msg.sender;
    makes[_cardId].curPrice = div(mul(makes[_cardId].curPrice, totalpercent), 100);
  } else if (_cardType == 2){
    companyId = makes[_cardId].companyId;
    companies[companyId].ownerAddress.transfer(commission2percent);
    commissionOwner = commissionOwner - commission2percent;
    
    uint256 makeId = cars[_cardId].makeId;

    makes[makeId].ownerAddress.transfer(commission2percent);
    commissionOwner = commissionOwner - commission2percent;

    if (len > 1){
        for (uint i=len-2; i>=0; i--) {
            if (i > len-5){
                cars[_cardId].ownerAddresses[i].transfer(commission2percent);
                commissionOwner = commissionOwner - commission2percent;
            }
        }
    }

    cars[_cardId].ownerAddresses[len-1].transfer(commissionOwner);
    cars[_cardId].ownerAddresses.push(msg.sender);
    if (ownercount < 3) totalpercent = totalpercent + 2;
    cars[_cardId].curPrice = div(mul(cars[_cardId].curPrice, totalpercent), 100);
  }
}
}