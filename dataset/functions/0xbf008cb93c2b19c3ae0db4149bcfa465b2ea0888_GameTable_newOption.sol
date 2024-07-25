contract GameTable {
function newOption(uint gameinx, uint optionid, bytes32 name, bytes32 optionimage)  public returns (uint) {
        if (owner != msg.sender) revert();
        if (gameinx > numGames) revert();
        if (now >= games[gameinx].startTime) revert();
        if (games[gameinx].runingStatus == 0){
            games[gameinx].runingStatus = 1;
        }
        games[gameinx].numOptions = games[gameinx].numOptions+1;
        games[gameinx].options[games[gameinx].numOptions-1] = Option(optionid, name, optionimage, 0, 0);
        return games[gameinx].numOptions-1;
    }
}