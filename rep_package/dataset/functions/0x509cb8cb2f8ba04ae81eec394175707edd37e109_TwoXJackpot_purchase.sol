contract TwoXJackpot {
function purchase() public payable isStarted  {
    // Check if the game is still running
    if (now > lastAction + timeBeforeJackpot &&
      jackpotLastQualified != 0x0) {
      claim();
      // Next game/round will start, return back money to user
      if (msg.value > 0) {
        msg.sender.transfer(msg.value);
      }
      return;
    }

    // Check if JackPot is less then 1 ETH, then
    // use predefined minimum and maximum buy in values
    if (jackpotBalance <= 1 ether) {
      require(msg.value >= minMinBuyETH); // >= 0.02 ETH
      require(msg.value <= minMaxBuyETH); // <= 0.5 ETH
    } else {
      uint256 purchaseMin = SafeMath.mul(msg.value, minBuy);
      uint256 purchaseMax = SafeMath.mul(msg.value, maxBuy);
      require(purchaseMin >= jackpotBalance);
      require(purchaseMax <= jackpotBalance);
    }

    uint256 valueAfterTax = SafeMath.div(SafeMath.mul(msg.value, buyFee), 100);     // Take a 10% fee for Jackpot, example on 1ETH Buy:  0.9 = (1.0 * 90) / 100
    uint256 potFee = SafeMath.sub(msg.value, valueAfterTax);                        // Calculate the absolute number to put into pot.


    jackpotBalance += potFee;           // Add it to the jackpot
    jackpotLastQualified = msg.sender;  // You are now the rightly heir to the Jackpot...for now...
    lastAction = now;                   //  Reset jackpot timer
    timeBeforeJackpot += timeIncreasePerTx;                // Increase Jackpot Timer by 1 minute.
    uint256 valueMultiplied = SafeMath.mul(msg.value, 2);  // Double it

    // Update Global Investing Information
    games[gameIndex].gameTotalInvested += msg.value;
    games[gameIndex].gameTotalBacklog += valueMultiplied;

    // Update Game Investing Information
    games[gameIndex].totalInvested[msg.sender] += msg.value;
    games[gameIndex].totalValue[msg.sender] += valueMultiplied;

    // Push new Buy In information in our game list of buy ins
    games[gameIndex].buyIns.push(BuyIn({
      value: valueMultiplied,
      owner: msg.sender
    }));
    //Emit a deposit event.
    emit Purchase(msg.value, msg.sender);

    while (games[gameIndex].index < games[gameIndex].buyIns.length
            && valueAfterTax > 0) {

      BuyIn storage buyIn = games[gameIndex].buyIns[games[gameIndex].index];

      if (valueAfterTax < buyIn.value) {
        buyIn.owner.transfer(valueAfterTax);

        // Update game information
        games[gameIndex].gameTotalBacklog -= valueAfterTax;
        games[gameIndex].gameTotalPaidOut += valueAfterTax;

        // game paid out and value update
        games[gameIndex].totalPaidOut[buyIn.owner] += valueAfterTax;
        games[gameIndex].totalValue[buyIn.owner] -= valueAfterTax;
        buyIn.value -= valueAfterTax;
        valueAfterTax = 0;
      } else {
        buyIn.owner.transfer(buyIn.value);

        // Update game information
        games[gameIndex].gameTotalBacklog -= buyIn.value;
        games[gameIndex].gameTotalPaidOut += buyIn.value;

        // game paid out and value update
        games[gameIndex].totalPaidOut[buyIn.owner] += buyIn.value;
        games[gameIndex].totalValue[buyIn.owner] -= buyIn.value;
        valueAfterTax -= buyIn.value;
        buyIn.value = 0;
        games[gameIndex].index++;
      }
    }
  }
}