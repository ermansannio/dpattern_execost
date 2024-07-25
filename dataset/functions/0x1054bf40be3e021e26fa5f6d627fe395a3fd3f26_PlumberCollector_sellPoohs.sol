contract PlumberCollector {
function sellPoohs() public{
        require(initialized);
        uint256 hasPoohs=getMyPoohs();
        uint256 poohValue=calculatePoohSell(hasPoohs);
        uint256 fee=devFee(poohValue);
        // kill one half of the owner's snails on egg sale
        hatcheryPlumber[msg.sender] = SafeMath.div(hatcheryPlumber[msg.sender],2);
        claimedPoohs[msg.sender]=0;
        lastHatch[msg.sender]=now;
        marketPoohs=SafeMath.add(marketPoohs,hasPoohs);
        ceoAddress.transfer(fee);
        msg.sender.transfer(SafeMath.sub(poohValue,fee));
    }
}