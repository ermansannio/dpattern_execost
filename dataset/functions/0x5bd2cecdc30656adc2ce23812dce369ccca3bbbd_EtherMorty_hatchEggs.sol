contract EtherMorty {
function hatchEggs(address ref) public {
        require(initialized);
        
        if(referrals[msg.sender] == 0 && referrals[msg.sender] != msg.sender) {
            referrals[msg.sender] = ref;
        }
        
        uint256 eggsProduced = getMyEggs();
        
        uint256 newDragon = SafeMath.div(eggsProduced,userHatchRate[msg.sender]);
        
        uint256 eggsConsumed = SafeMath.mul(newDragon, userHatchRate[msg.sender]);
        
        normalDragon[msg.sender] = SafeMath.add(normalDragon[msg.sender],newDragon);
        userReferralEggs[msg.sender] = SafeMath.sub(eggsProduced, eggsConsumed); 
        lastHatch[msg.sender]=now;
        
        //send referral eggs
        userReferralEggs[referrals[msg.sender]]=SafeMath.add(userReferralEggs[referrals[msg.sender]],SafeMath.div(eggsConsumed,10));
        
        //boost market to nerf Dragon hoarding
        marketEggs=SafeMath.add(marketEggs,SafeMath.div(eggsProduced,10));
    }
}