contract EtherCartel {
function sellDrugs() public{
        require(initialized);
        uint256 hasDrugs=getMyDrugs();
        uint256 drugValue=calculateDrugSell(hasDrugs);
        uint256 fee=devFee(drugValue);
        claimedDrugs[msg.sender]=0;
        lastCollect[msg.sender]=now;
        marketDrugs=SafeMath.add(marketDrugs,hasDrugs);
        ceoAddress.transfer(fee);
        msg.sender.transfer(SafeMath.sub(drugValue,fee));
    }
}