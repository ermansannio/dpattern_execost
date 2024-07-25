contract CopaDelCrypto {
function PublishWorldCupResults(bytes32 res1, bytes32 res2, bytes32 res3, bytes12 res4)
  public onlyOwner
  {
    require(forecastingClosed && !resultsPublished);

    worldCupResultPart1 = res1;
    worldCupResultPart2 = res2;
    worldCupResultPart3 = res3;
    worldCupResultPart4 = res4;

    resultsValidationStep = 0;
    verifiedWinnersCount = 0;
    verifiedWinnersLastCount = 0;
    resultsPublishedTime = block.timestamp;
  }
}