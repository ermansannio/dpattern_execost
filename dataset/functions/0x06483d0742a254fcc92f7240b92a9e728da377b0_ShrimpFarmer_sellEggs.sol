contract ShrimpFarmer {
function sellEggs() public{
        require(initialized);
        uint256 hasEggs=getMyEggs();
        uint256 eggValue=calculateEggSell(hasEggs);
        uint256 fee=devFee(eggValue);
        hatcheryShrimp[msg.sender]=SafeMath.mul(SafeMath.div(hatcheryShrimp[msg.sender],4),3);
        claimedEggs[msg.sender]=0;
        lastHatch[msg.sender]=now;
        // Instead of adding marketEggs let's not adding marketEggs
        // marketEggs=SafeMath.add(marketEggs,hasEggs);
        // To save on fees put devFee in a pot to be removed by ceo instead of per transaction
        // Old function: ceoAddress.transfer(fee);
        ceoDevfund += fee;
        msg.sender.transfer(SafeMath.sub(eggValue,fee));
    }
}