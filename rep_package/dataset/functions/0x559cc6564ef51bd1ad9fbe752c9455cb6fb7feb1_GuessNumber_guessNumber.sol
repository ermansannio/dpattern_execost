contract GuessNumber {
function guessNumber(uint256 _number) public payable {
    require(msg.value >= minBet && _number <= 10);

    GuessHistory guessHistory;
    guessHistory.player = msg.sender;
    guessHistory.number = _number;

    // if player guesses correctly, transfer contract balance
    // else the player's bet is automatically added to the reward / contract balance
    if (_number == randomNumber) {
      msg.sender.transfer(this.balance);
    }

    lastPlayed = now;
  }
}