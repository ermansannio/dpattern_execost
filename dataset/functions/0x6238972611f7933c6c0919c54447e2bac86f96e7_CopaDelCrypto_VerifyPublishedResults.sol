contract CopaDelCrypto {
function VerifyPublishedResults(uint16 stepSize)
  public onlyOwner
  {
    require(forecastingClosed && !resultsPublished);
    require(stepSize > 0 && resultsValidationStep + stepSize <= players.length);

    uint32 wins;
    uint32 lasts;

    for (uint32 i = resultsValidationStep; i < resultsValidationStep + stepSize; i++) {

      Forecast memory fc = forecasts[players[i]];

      uint16 score = scoreGroups(fc.part1, fc.part2, worldCupResultPart1, worldCupResultPart2)
                     + scoreKnockouts(fc.part2, fc.part3, fc.part4);

      if (score >= publishedWinningScoreThreshold) {
        wins++;
        if (score == publishedWinningScoreThreshold) {
          lasts++;
        }
        forecasts[players[i]].hasPaidOrWon = true;
      } else {
        forecasts[players[i]].hasPaidOrWon = false;
      }
    }

    resultsValidationStep += stepSize;
    verifiedWinnersCount += wins;
    verifiedWinnersLastCount += lasts;

    if (resultsValidationStep == players.length) {
      verifiedWinnersCount = validateWinnersCount(verifiedWinnersCount, verifiedWinnersLastCount, expectedWinnersCount);
      verifiedWinnersLastCount = 0;
      expectedWinnersCount = 0;

      if (verifiedWinnersCount > 0) {
        prizeValue = address(this).balance / verifiedWinnersCount;
        resultsPublished = true;
      }
    }
  }
}