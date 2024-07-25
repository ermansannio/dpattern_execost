contract Spineth {
function changeBetLimits(uint minBet, uint maxBet) public
    {
        require(msg.sender == authority);
        require(maxBet >= minBet);

        minBetWei = minBet;
        maxBetWei = maxBet;
    }
}