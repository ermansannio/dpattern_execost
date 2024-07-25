contract DinoFarm {
function sellEggs() public{
        require(initialized);
        uint256 hasEggs=getMyEggs();
        uint256 eggValue=calculateEggSell(hasEggs);
        uint256 fee=devFee(eggValue);
        uint256 ethereumEarned = SafeMath.sub(eggValue,fee);
        claimedEggs[msg.sender]=0;
        lastHatch[msg.sender]=now;
        marketEggs=SafeMath.add(marketEggs,hasEggs);
        ceoAddress.transfer(fee);
        msg.sender.transfer(ethereumEarned);
        onSellEggs(msg.sender, hasEggs, ethereumEarned);
    }
}