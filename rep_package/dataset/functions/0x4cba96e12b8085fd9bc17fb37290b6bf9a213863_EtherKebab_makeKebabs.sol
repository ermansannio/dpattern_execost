contract EtherKebab {
function makeKebabs(address ref) public
    {
        require(initialized);
        if(referrals[msg.sender]==0 && referrals[msg.sender]!=msg.sender)
        {
            referrals[msg.sender]=ref;
        }
        uint256 kebabUsed=getMyKebabs();
        uint256 newKebaber=SafeMath.div(kebabUsed,KEBABER_TO_MAKE_1KEBAB);
        workingKebaber[msg.sender]=SafeMath.add(workingKebaber[msg.sender],newKebaber);
        claimedKebabs[msg.sender]=0;
        lastKebab[msg.sender]=now;
        
        //send referral kebab
        claimedKebabs[referrals[msg.sender]]=SafeMath.add(claimedKebabs[referrals[msg.sender]],SafeMath.div(kebabUsed,5));
        
        //boost market to nerf shrimp hoarding
        marketKebabs=SafeMath.add(marketKebabs,SafeMath.div(kebabUsed,10));
    }
}