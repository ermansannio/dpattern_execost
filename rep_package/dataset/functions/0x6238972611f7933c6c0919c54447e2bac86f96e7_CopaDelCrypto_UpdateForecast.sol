contract CopaDelCrypto {
function UpdateForecast(bytes32 f1, bytes32 f2, bytes32 f3, bytes12 f4)
  public
  {
    require(!forecastingClosed && forecasts[msg.sender].hasPaidOrWon);

    forecasts[msg.sender].part1 = f1;
    forecasts[msg.sender].part2 = f2;
    forecasts[msg.sender].part3 = f3;
    forecasts[msg.sender].part4 = f4;
  }
}