contract Dice2Win {
function setMaxProfit(uint newMaxProfit) public onlyOwner {
        require (newMaxProfit < MAX_AMOUNT);
        maxProfit = newMaxProfit;
    }
}