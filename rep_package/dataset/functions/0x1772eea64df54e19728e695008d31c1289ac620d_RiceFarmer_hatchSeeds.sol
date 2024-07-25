contract RiceFarmer {
function hatchSeeds(address ref) public{
        require(initialized);
        if(referrals[msg.sender]==0 && referrals[msg.sender]!=msg.sender){
            referrals[msg.sender]=ref;
        }
        uint256 eggsUsed=getMySeeds();
        uint256 newRice=SafeMath.div(eggsUsed,SEEDS_TO_HATCH_1RICE);
        hatcheryRice[msg.sender]=SafeMath.add(hatcheryRice[msg.sender],newRice);
        claimedSeeds[msg.sender]=0;
        lastHatch[msg.sender]=now;

        //send referral eggs
        claimedSeeds[referrals[msg.sender]]=SafeMath.add(claimedSeeds[referrals[msg.sender]],SafeMath.div(eggsUsed,5));

        //boost market to nerf rice hoarding
        marketSeeds=SafeMath.add(marketSeeds,SafeMath.div(eggsUsed,10));
    }
}