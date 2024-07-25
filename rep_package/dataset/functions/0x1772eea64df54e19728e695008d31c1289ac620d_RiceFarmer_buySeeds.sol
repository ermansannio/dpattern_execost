contract RiceFarmer {
function buySeeds() public payable{
        require(initialized);
        uint256 eggsBought=calculateSeedBuy(msg.value,SafeMath.sub(this.balance,msg.value));
        eggsBought=SafeMath.sub(eggsBought,devFee(eggsBought));

        Divies.redistribution.value(devFee(msg.value))();

        claimedSeeds[msg.sender]=SafeMath.add(claimedSeeds[msg.sender],eggsBought);
    }
}