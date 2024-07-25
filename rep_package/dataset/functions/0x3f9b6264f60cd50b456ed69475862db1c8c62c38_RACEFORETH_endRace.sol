contract RACEFORETH {
function endRace() public {
        require(msg.sender == owner);
        require(now > latestTimestamp + 3 days);
        
        msg.sender.transfer(this.balance);
    }
}