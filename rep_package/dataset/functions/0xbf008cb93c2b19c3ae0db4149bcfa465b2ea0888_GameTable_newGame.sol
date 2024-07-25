contract GameTable {
function newGame(bytes32 name, uint startDuration, uint endDuration, uint openDuration)  public returns (uint) {
        if(startDuration < 1 || openDuration>888888888888 || endDuration<startDuration || openDuration<startDuration || openDuration<endDuration || owner != msg.sender) revert();
        address manager =  msg.sender;
        uint startTime = now + startDuration * 1 minutes;
        uint endTime = now + endDuration * 1 minutes;
        uint openTime = now + openDuration * 1 minutes;
        games[numGames] = Game(manager, name, 0, 0, 0, 0, startTime, endTime, openTime, 0);
        numGames = numGames+1; 
        return (numGames-1);
    }
}