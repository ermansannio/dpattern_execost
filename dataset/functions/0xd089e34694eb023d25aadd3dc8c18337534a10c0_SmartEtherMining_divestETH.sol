contract SmartEtherMining {
function divestETH() public {
        uint256 profit = getProfit(msg.sender);
        lastInvest[msg.sender] = now;
        
        //20% fee on taking capital out
        uint256 capital = investedETH[msg.sender];
        uint256 fee = SafeMath.div(capital, 5);
        capital = SafeMath.sub(capital, fee);
        
        uint256 total = SafeMath.add(capital, profit);
        require(total > 0);
        investedETH[msg.sender] = 0;
        msg.sender.transfer(total);
    }
}