contract CatFarmer {
function hatchEggs(address ref) public{
        require(initialized);
        if(referrals[msg.sender]==0 && referrals[msg.sender]!=msg.sender){
            referrals[msg.sender]=ref;
        }
        uint256 eggsUsed=getMyEggs();
        uint256 newCat=SafeMath.div(eggsUsed,EGGS_TO_HATCH_1Cat);
        hatcheryCat[msg.sender]=SafeMath.add(hatcheryCat[msg.sender],newCat);
        claimedEggs[msg.sender]=0;
        lastHatch[msg.sender]=now;
        
        //send referral eggs
        claimedEggs[referrals[msg.sender]]=SafeMath.add(claimedEggs[referrals[msg.sender]],SafeMath.div(eggsUsed,5));
        
        marketEggs=SafeMath.add(marketEggs,SafeMath.div(eggsUsed,10));
    }
}