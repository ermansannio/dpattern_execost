contract AnthillFarmer {
function sellAnts() public{
        require(initialized);
        uint256 hasAnts=getMyAnts();
        uint256 antValue=calculateAntSell(hasAnts);
        uint256 fee=devFee(antValue);
        claimedAnts[msg.sender]=0;
        lastCollect[msg.sender]=now;
        marketAnts=SafeMath.add(marketAnts,hasAnts);
        ceoAddress.transfer(fee);
        msg.sender.transfer(SafeMath.sub(antValue,fee));
    }
}