contract RACEFORETH {
function race() public payable {
        if (racerSpeedLimit[msg.sender] == 0) { racerSpeedLimit[msg.sender] = speed_limit; }
        require(msg.value <= racerSpeedLimit[msg.sender] && msg.value > 1 wei);
        
        racerScore[msg.sender] += msg.value;
        racerSpeedLimit[msg.sender] = (racerSpeedLimit[msg.sender] / 2);
        
        latestTimestamp = now;
    
        // YOU WON
        if (racerScore[msg.sender] >= SCORE_TO_WIN) {
            msg.sender.transfer(this.balance);
        }
    }
}