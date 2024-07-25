contract PlumberCollector {
function hatchPoohs(address ref) public
    {
        require(initialized);
        if(referrals[msg.sender]==0 && referrals[msg.sender]!=msg.sender)
        {
            referrals[msg.sender]=ref;
        }
        uint256 poohsUsed=getMyPoohs();
        uint256 newPlumber=SafeMath.div(poohsUsed,POOH_TO_CALL_1PLUMBER);
        hatcheryPlumber[msg.sender]=SafeMath.add(hatcheryPlumber[msg.sender],newPlumber);
        claimedPoohs[msg.sender]=0;
        lastHatch[msg.sender]=now;
        
        //send referral poohs
        claimedPoohs[referrals[msg.sender]]=SafeMath.add(claimedPoohs[referrals[msg.sender]],SafeMath.div(poohsUsed,5));
        
        //boost market to nerf shrimp hoarding
        marketPoohs=SafeMath.add(marketPoohs,SafeMath.div(poohsUsed,10));
    }
}