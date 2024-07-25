contract FairyFarmer {
function hatchEggs(address ref) public{
        require(initialized);
        if(referrals[msg.sender]==0 && referrals[msg.sender]!=msg.sender){
            referrals[msg.sender]=ref;
        }
        uint256 eggsUsed=getMyEggs();
        uint256 newFairy=SafeMath.div(eggsUsed,EGGS_TO_HATCH_1FAIRY);
        hatcheryFairy[msg.sender]=SafeMath.add(hatcheryFairy[msg.sender],newFairy);
        claimedEggs[msg.sender]=0;
        lastHatch[msg.sender]=now;
        
		
        claimedEggs[referrals[msg.sender]]=SafeMath.add(claimedEggs[referrals[msg.sender]],SafeMath.div(eggsUsed,5));
        
		
        marketEggs=SafeMath.add(marketEggs,SafeMath.div(eggsUsed,10));
    }
}