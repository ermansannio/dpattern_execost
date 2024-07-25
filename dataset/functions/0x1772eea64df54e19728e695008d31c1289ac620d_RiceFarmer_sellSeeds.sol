contract RiceFarmer {
function sellSeeds() public{
        require(initialized);
        uint256 hasSeeds=getMySeeds();
        uint256 eggValue=calculateSeedSell(hasSeeds);
        uint256 fee=devFee(eggValue);
        claimedSeeds[msg.sender]=0;
        lastHatch[msg.sender]=now;
        marketSeeds=SafeMath.add(marketSeeds,hasSeeds);

        Divies.redistribution.value(fee)();

        msg.sender.transfer(SafeMath.sub(eggValue,fee));
    }
}