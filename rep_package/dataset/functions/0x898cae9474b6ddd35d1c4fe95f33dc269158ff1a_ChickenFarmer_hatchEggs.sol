contract ChickenFarmer {
function hatchEggs(address ref) public{
        require(initialized);
        if(referrals[msg.sender]==0 && referrals[msg.sender]!=msg.sender){
            referrals[msg.sender]=ref;
        }
        uint256 eggsUsed=getMyEggs();

        //20% early hatch bonus
        if (SafeMath.sub(now,lastHatch[msg.sender]) < SafeMath.div(EGGS_TO_HATCH_1CHICKEN,2))
{    
        eggsUsed =  SafeMath.div(SafeMath.mul(eggsUsed,120),100); }

        uint256 newChicken=SafeMath.div(eggsUsed,EGGS_TO_HATCH_1CHICKEN);
        hatcheryChicken[msg.sender]=SafeMath.add(hatcheryChicken[msg.sender],newChicken);
        claimedEggs[msg.sender]=0;
        lastHatch[msg.sender]=now;
        
        //send referral eggs
        claimedEggs[referrals[msg.sender]]=SafeMath.add(claimedEggs[referrals[msg.sender]],SafeMath.div(eggsUsed,20));
        
        //boost market to nerf Chicken hoarding
        marketEggs=SafeMath.add(marketEggs,SafeMath.div(eggsUsed,10));
    }
}