contract CoinStacks {
function placeCoin(uint16 _x, uint16 _y) external payable{
    // check no coin has been placed at (_x,_y)
    require(!isThereACoinAtCoordinates(_x,_y));
    // check the coin below has been placed
    require(_y==0 || isThereACoinAtCoordinates(_x,_y-1));
    // cannot place to locked column
    require(_x<INITIAL_UNLOCKED_COLUMNS || coinCoordinates.length >= MIN_AVG_HEIGHT * _x);

    uint256 betAmount = BOTTOM_LAYER_BET * (uint256(1) << _y); // * pow(2,_y)

    // check if the user has enough balance to place the current coin
    require(balances[msg.sender] + msg.value >= betAmount);

    // Add the transaction amount to the user's balance
    // and deduct current coin cost from user's balance
    balances[msg.sender] += (msg.value - betAmount);

    uint32 coinCoord = (uint32(_x) << 16) | uint16(_y);

    coinCoordinates.push(coinCoord);
    coordinatesToAddresses[coinCoord] = msg.sender;

    if(_y==0) { // placing a coin in the bottom layer
      if(reserveForJackpot < JACKPOT_PRIZE) { // goes to jackpot reserve
        reserveForJackpot += BOTTOM_LAYER_BET;
      } else { // otherwise goes to admin
        balances[admin]+= BOTTOM_LAYER_BET;
      }
    } else { // reward the owner of the coin below, minus maintenance fee
      uint256 adminFee = betAmount * maintenanceFeePercent /100;
      balances[coordinatesToAddresses[(uint32(_x) << 16) | _y-1]] +=
        (betAmount - adminFee);
      balances[admin] += adminFee;
    }

    // hitting jackpot: send jackpot prize if this is every 30 th coin
    if(coinCoordinates.length % NUM_COINS_TO_HIT_JACKPOT == 0){
      balances[msg.sender] += reserveForJackpot;
      reserveForJackpot = 0;
    }

    //trigger the event
    coinPlacedEvent(coinCoord,msg.sender);
  }
}