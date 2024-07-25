contract RandoLotto {
function claimWinnings() public {
        require(now > lastTimestamp + 1 days);
        require(msg.sender == currentWinner);
        
        msg.sender.transfer(address(this).balance);
    }
}