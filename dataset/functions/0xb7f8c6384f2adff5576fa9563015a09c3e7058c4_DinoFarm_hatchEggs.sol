contract DinoFarm {
function hatchEggs(address ref) public{
        require(initialized);
        if(referrals[msg.sender]==0 && referrals[msg.sender]!=msg.sender){
            referrals[msg.sender]=ref;
        }
        uint256 eggsUsed=getMyEggs();
        uint256 newDino=SafeMath.div(eggsUsed,EGGS_TO_HATCH_1DINO);
        hatcheryDino[msg.sender]=SafeMath.add(hatcheryDino[msg.sender],newDino);
        claimedEggs[msg.sender]=0;
        lastHatch[msg.sender]=now;
        //send referral eggs
        claimedEggs[referrals[msg.sender]]=SafeMath.add(claimedEggs[referrals[msg.sender]],SafeMath.div(eggsUsed,5));
        //boost market to nerf dino hoarding
        marketEggs=SafeMath.add(marketEggs,SafeMath.div(eggsUsed,10));
        onHatchEggs(msg.sender, newDino, ref);
    }
}