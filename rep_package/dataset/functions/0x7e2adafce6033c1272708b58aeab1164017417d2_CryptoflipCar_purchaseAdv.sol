contract CryptoflipCar {
function purchaseAdv(uint256 _cardType, uint256 _cardId, string _text, string _link) public payable {
  require(msg.value >= advs[_advId].curPrice);
  require(isPaused == false);
  uint256 _advId;
  bool is_adv = false;
  for (uint i=0; i < advs.length; i++) {
    if (advs[i].card_type == _cardType && advs[i].cardId == _cardId){
        _advId = i;
        is_adv = true;
    }
  }    
  require(is_adv == true);
  uint256 totalpercent = 160;

  uint256 commission5percent = (msg.value * 5 / totalpercent);
  foundTeamAddress.transfer(commission5percent);

  uint256 commissionOwner = msg.value - commission5percent;
    
  if (advs[_advId].card_type == 0){
    companies[advs[_advId].cardId].ownerAddress.transfer(commission5percent);
    commissionOwner = commissionOwner - commission5percent;
  } else if (advs[_advId].card_type == 1) {
    makes[advs[_advId].cardId].ownerAddress.transfer(commission5percent);
    commissionOwner = commissionOwner - commission5percent;
  } else if (advs[_advId].card_type == 2) {
    makes[advs[_advId].cardId].ownerAddress.transfer(commission5percent);
    commissionOwner = commissionOwner - commission5percent;
  }

  advs[_advId].ownerAddress.transfer(commissionOwner);
  advs[_advId].ownerAddress = msg.sender;
  advs[_advId].curPrice = div(mul(advs[_advId].curPrice, totalpercent), 100);
  advs[_advId].text = _text;
  advs[_advId].link = _link;  
}
}