contract AnthillFarmer {
function buyAnts() public payable{
        require(initialized);
        uint256 antsBought=calculateAntBuy(msg.value,SafeMath.sub(this.balance,msg.value));
        antsBought=SafeMath.sub(antsBought,devFee(antsBought));
        ceoAddress.transfer(devFee(msg.value));
        claimedAnts[msg.sender]=SafeMath.add(claimedAnts[msg.sender],antsBought);
    }
}