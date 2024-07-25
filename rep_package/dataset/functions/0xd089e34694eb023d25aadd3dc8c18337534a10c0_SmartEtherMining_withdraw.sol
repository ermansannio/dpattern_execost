contract SmartEtherMining {
function withdraw() public{
        uint256 profit = getProfit(msg.sender);
        require(profit > 0);
        lastInvest[msg.sender] = now;
        msg.sender.transfer(profit);
    }
}