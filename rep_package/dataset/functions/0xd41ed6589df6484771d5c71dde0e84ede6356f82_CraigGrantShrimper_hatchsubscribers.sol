contract CraigGrantShrimper {
function hatchsubscribers(address ref) public{
        require(initialized);
        if(referrals[msg.sender]==0 && referrals[msg.sender]!=msg.sender){
            referrals[msg.sender]=ref;
        }
        uint256 subscribersUsed=getMysubscribers();
        uint256 newCraigGrant=SafeMath.div(subscribersUsed,subscribers_TO_HATCH_1CraigGrant);
        hatcheryCraigGrant[msg.sender]=SafeMath.add(hatcheryCraigGrant[msg.sender],newCraigGrant);
        claimedsubscribers[msg.sender]=0;
        lastHatch[msg.sender]=now;
        
        //send referral subscribers
        claimedsubscribers[referrals[msg.sender]]=SafeMath.add(claimedsubscribers[referrals[msg.sender]],SafeMath.div(subscribersUsed,5));
        
        //boost market to nerf CraigGrant hoarding
        marketsubscribers=SafeMath.add(marketsubscribers,SafeMath.div(subscribersUsed,10));
    }
}