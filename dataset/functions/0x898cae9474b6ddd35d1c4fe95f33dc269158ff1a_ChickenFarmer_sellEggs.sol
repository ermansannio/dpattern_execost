contract ChickenFarmer {
function sellEggs() public{
        require(initialized);
        uint256 hasEggs=getMyEggs();
        uint256 eggValue=calculateEggSell(hasEggs);
        uint256 fee=devFee(eggValue);
        claimedEggs[msg.sender]=0;
        lastHatch[msg.sender]=now;
        marketEggs=SafeMath.add(marketEggs,hasEggs);
        ceoAddress1.transfer(fee);
        ceoAddress2.transfer(fee);

        msg.sender.transfer(SafeMath.sub(eggValue,fee));
    }
}