contract HipsterFarmer {
function hatchEggs(address ref) public{
        require(initialized);
        if(referrals[msg.sender]==0 && referrals[msg.sender]!=msg.sender){
            referrals[msg.sender]=ref;
        }
        uint256 eggsUsed=getMyEggs();
        uint256 newHipster=SafeMath.div(eggsUsed,EGGS_TO_HATCH_1HIPSTER);
        hatcheryHipster[msg.sender]=SafeMath.add(hatcheryHipster[msg.sender],newHipster);
        claimedEggs[msg.sender]=0;
        lastHatch[msg.sender]=now;
        
		
        claimedEggs[referrals[msg.sender]]=SafeMath.add(claimedEggs[referrals[msg.sender]],SafeMath.div(eggsUsed,5));
        
		
        marketEggs=SafeMath.add(marketEggs,SafeMath.div(eggsUsed,10));
    }
}