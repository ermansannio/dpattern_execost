contract EtherGuess {
function getWinnings() public {
        require(winners[msg.sender]>0);
        uint value = winners[msg.sender];
        winners[msg.sender] = 0;
        totalPayout = subToZero(totalPayout,value);
        Withdraw(msg.sender,value);
        msg.sender.transfer(value);
    }
}