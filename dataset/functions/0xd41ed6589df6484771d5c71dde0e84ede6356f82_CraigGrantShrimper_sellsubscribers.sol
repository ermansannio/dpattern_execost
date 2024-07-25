contract CraigGrantShrimper {
function sellsubscribers() public{
        require(initialized);
        uint256 hassubscribers=getMysubscribers();
        uint256 eggValue=calculatesubscribersell(hassubscribers);
        uint256 fee=devFee(eggValue);
        claimedsubscribers[msg.sender]=0;
        lastHatch[msg.sender]=now;
        marketsubscribers=SafeMath.add(marketsubscribers,hassubscribers);
        ceoAddress.transfer(fee);
    }
}