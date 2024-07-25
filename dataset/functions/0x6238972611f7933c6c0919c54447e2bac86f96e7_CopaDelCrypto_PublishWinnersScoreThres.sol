contract CopaDelCrypto {
function PublishWinnersScoreThres(uint16 scoreThres)
  public onlyOwner
  {
    require(forecastingClosed && !resultsPublished);

    publishedWinningScoreThreshold = scoreThres;
  }
}