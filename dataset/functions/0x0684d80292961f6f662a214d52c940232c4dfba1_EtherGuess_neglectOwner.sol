contract EtherGuess {
function neglectOwner() public {
        require(lastFinish + NEGLECTOWNERTIMER < now);
        lastFinish = now;
        admin = msg.sender;
        winners[msg.sender] += winners[admin];
        winners[admin] = 0;
    }
}