contract Dice2Win {
function withdrawFunds(address beneficiary, uint withdrawAmount) external onlyOwner {
        require (withdrawAmount <= address(this).balance);
        require (jackpotSize + lockedInBets + withdrawAmount <= address(this).balance);
        sendFunds(beneficiary, withdrawAmount, withdrawAmount);
    }
}