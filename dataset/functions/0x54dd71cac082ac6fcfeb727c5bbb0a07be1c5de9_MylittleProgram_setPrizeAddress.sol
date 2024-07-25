contract MylittleProgram {
function setPrizeAddress (address _WinnerAddress) onlyAdmins() public {
winnerAddress = _WinnerAddress;
}
}