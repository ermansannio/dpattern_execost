contract GVSFjackpot {
function bid (uint256 _roundNumber, string _message) payable public {
    require(!isContract(msg.sender));
    require(bytes(_message).length <= maxMessageChars);
    require(msg.value > 0);
    
    if (_roundNumber == currentRoundNumber && !roundExpired()) {
      // bid in active round
      require(msg.value > lastBidAmount);
    }else if (_roundNumber == (currentRoundNumber+1) && roundExpired()) {
      // first bid of new round, process old round
      var lastRoundPotBalance = this.balance.sub(msg.value);
      uint256 devFee = lastRoundPotBalance.mul(devFeePercent).div(100);
      owner.transfer(devFee);
      uint256 winnings = lastRoundPotBalance.sub(devFee).mul(100 - rolloverPercent).div(100);
      king.transfer(winnings);

      // save previous round data
      roundToKing[currentRoundNumber] = king;
      roundToWinnings[currentRoundNumber] = winnings;
      roundToFinalBid[currentRoundNumber] = lastBidAmount;
      roundToFinalMessage[currentRoundNumber] = kingsMessage;

      currentBidNumber = 0;
      currentRoundNumber++;

      if (nextBidExpireBlockLength != 0) {
        bidExpireBlockLength = nextBidExpireBlockLength;
        nextBidExpireBlockLength = 0;
      }
    }else {
      require(false);
    }

    // new king
    king = msg.sender;
    kingsMessage = _message;
    lastBidAmount = msg.value;
    lastBidBlock = block.number;

    NewKing(currentRoundNumber, king, kingsMessage, lastBidAmount, currentBidNumber, lastBidBlock);

    currentBidNumber++;
  }
}