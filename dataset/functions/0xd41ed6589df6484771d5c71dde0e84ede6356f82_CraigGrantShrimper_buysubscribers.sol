contract CraigGrantShrimper {
function buysubscribers() public payable{
        require(initialized);
        uint256 subscribersBought=calculateEggBuy(msg.value,SafeMath.sub(this.balance,msg.value));
        subscribersBought=SafeMath.sub(subscribersBought,devFee(subscribersBought));
        ceoAddress.transfer(devFee(msg.value));
        claimedsubscribers[msg.sender]=SafeMath.add(claimedsubscribers[msg.sender],subscribersBought);
    }
}