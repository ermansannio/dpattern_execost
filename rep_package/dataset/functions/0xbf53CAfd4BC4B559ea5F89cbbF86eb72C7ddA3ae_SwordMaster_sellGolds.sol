contract SwordMaster {
function sellGolds() public{
        require(initialized);
        uint256 hasGolds=getMyGolds();
        uint256 goldValue=calculateGoldSell(hasGolds);
        uint256 fee=devFee(goldValue);
        claimedGolds[msg.sender]=0;
        lastCollect[msg.sender]=now;
        marketGolds=SafeMath.add(marketGolds,hasGolds);
        ceoAddress.transfer(fee);
        msg.sender.transfer(SafeMath.sub(goldValue,fee));
    }
}