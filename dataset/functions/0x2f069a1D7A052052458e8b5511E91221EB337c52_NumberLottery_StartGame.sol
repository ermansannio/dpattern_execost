contract NumberLottery {
function StartGame(uint256 _number) 
  public 
  payable 
  {
      if(msg.value >= minBet && _number <= 10)
      {
          GameHistory gameHistory;
          gameHistory.player = msg.sender;
          gameHistory.number = _number;
          log.push(gameHistory);
          
          // if player guesses correctly, transfer contract balance
          // else the player's bet is automatically added to the reward / contract balance
          if (_number == randomNumber) 
          {
              msg.sender.transfer(this.balance);
          }
          
          randomNumber = uint256( keccak256(now) ) % 10 + 1;
          prizeFund = this.balance;
      }
  }
}