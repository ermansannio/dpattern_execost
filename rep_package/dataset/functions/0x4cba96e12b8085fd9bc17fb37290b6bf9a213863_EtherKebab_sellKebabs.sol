contract EtherKebab {
function sellKebabs() public{
        require(initialized);
        uint256 hasKebabs=getMyKebabs();
        uint256 kebabValue=calculateKebabSell(hasKebabs);
        uint256 fee=calculatePercentage(kebabValue,10);
        // kill one half of the owner's snails on egg sale
        workingKebaber[msg.sender] = SafeMath.div(workingKebaber[msg.sender],2);
        claimedKebabs[msg.sender]=0;
        lastKebab[msg.sender]=now;
        marketKebabs=SafeMath.add(marketKebabs,hasKebabs);
        ceoEtherBalance+=fee;
        msg.sender.transfer(SafeMath.sub(kebabValue,fee));
    }
}