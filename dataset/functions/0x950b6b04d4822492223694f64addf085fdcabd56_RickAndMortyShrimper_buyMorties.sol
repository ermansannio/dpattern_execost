contract RickAndMortyShrimper {
function buyMorties() public payable{
        require(initialized);
        uint256 mortiesBought=calculateEggBuy(msg.value,SafeMath.sub(this.balance,msg.value));
        mortiesBought=SafeMath.sub(mortiesBought,devFee(mortiesBought));
        ceoAddress.transfer(devFee(msg.value));
        claimedmorties[msg.sender]=SafeMath.add(claimedmorties[msg.sender],mortiesBought);
    }
}