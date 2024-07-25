contract CopaDelCrypto {
function PlaceNewForecast(bytes32 f1, bytes32 f2, bytes32 f3, bytes12 f4)
  public payable
  {
    require(!forecastingClosed && msg.value == 50000000000000000 && !forecasts[msg.sender].hasPaidOrWon);

    forecasts[msg.sender].part1 = f1;
    forecasts[msg.sender].part2 = f2;
    forecasts[msg.sender].part3 = f3;
    forecasts[msg.sender].part4 = f4;
    forecasts[msg.sender].hasPaidOrWon = true;

    players.push(msg.sender);
  }
}