contract Dice2Win {
function increaseJackpot(uint increaseAmount) external onlyOwner {
        require (increaseAmount <= address(this).balance);
        require (jackpotSize + lockedInBets + increaseAmount <= address(this).balance);
        jackpotSize += uint128(increaseAmount);
    }
}