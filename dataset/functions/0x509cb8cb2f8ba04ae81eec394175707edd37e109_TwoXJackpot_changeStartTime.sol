contract TwoXJackpot {
function changeStartTime(uint256 _time) public onlyContractOwner {
    require(now < _time); // only allow changing it to something in the future
    gameStartTime = _time;
    lastAction = gameStartTime; // Don't forget to update last action too :)
  }
}