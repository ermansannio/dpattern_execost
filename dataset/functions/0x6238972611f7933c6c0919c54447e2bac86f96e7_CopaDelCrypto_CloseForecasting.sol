contract CopaDelCrypto {
function CloseForecasting(uint16 exWinCount)
  public onlyOwner
  {
    require(!forecastingClosed);
    require((exWinCount == 0 && players.length > 10000)
             || (exWinCount > 0 && (uint32(exWinCount) * uint32(exWinCount) >= players.length
                 && uint32(exWinCount - 1) * uint32(exWinCount - 1) < players.length)));
    expectedWinnersCount = (players.length) > 10000 ? uint16(players.length / 100) : exWinCount;

    forecastingClosed = true;
  }
}