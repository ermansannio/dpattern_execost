contract TwoXJackpot {
function claim() public payable isStarted {
    require(now > lastAction + timeBeforeJackpot);
    require(jackpotLastQualified != 0x0); // make sure last jackpotLastQualified is not 0x0

    // Each game has 4 Jackpot payouts, increasing in payout percentage.
    // Funds owed to you do not reset between Jackpots, but will reset after 1 game (4 Jackpots)
    uint256 reseed = SafeMath.div(SafeMath.mul(jackpotBalance, gameReseeds[jackpotCount]), 100);
    uint256 payout = jackpotBalance - reseed;


    jackpotLastQualified.transfer(payout); // payout entire jackpot minus seed.
    jackpotBalance = reseed;
    jackpotLastWinner = jackpotLastQualified;
    jackpotLastPayout = payout;

    // Let's store now new winner in list of game winners
    games[gameIndex].winners.push(jackpotLastQualified);
    games[gameIndex].winnerPayouts.push(payout);

    // RESET all the settings
    timeBeforeJackpot = timeBeforeJackpotReset; // reset to 30 min on each round timer
    jackpotLastQualified = 0x0; // set last qualified to 0x0

    if(jackpotCount == gameReseeds.length - 1){
      // Reset all outstanding owed money after 4 claimed jackpots to officially restart the game.
      gameStartTime = now + timeBetweenGames;    // Restart the game in a specified period (24h)
      lastAction = gameStartTime; // Reset last action to the start of the game
      gameIndex += 1; // Next Game!
      jackpotCount = 0;  // Reset Jackpots back to 0 after game end.

    } else {
      lastAction = now + timeBetweenRounds;
      roundStartTime = lastAction;
      jackpotCount += 1;
    }
  }
}