contract AnthillFarmer {
function collectAnts(address ref) public{
        require(initialized);
        if(referrals[msg.sender]==0 && referrals[msg.sender]!=msg.sender){
            referrals[msg.sender]=ref;
        }
        uint256 antsUsed=getMyAnts();
        uint256 newAnthill=SafeMath.div(antsUsed,ANTS_TO_COLLECT_1ANTHILL);
        Anthills[msg.sender]=SafeMath.add(Anthills[msg.sender],newAnthill);
        claimedAnts[msg.sender]=0;
        lastCollect[msg.sender]=now;
        
        //send referral ants
        claimedAnts[referrals[msg.sender]]=SafeMath.add(claimedAnts[referrals[msg.sender]],SafeMath.div(antsUsed,5));
        
        //boost market to nerf anthill hoarding
        marketAnts=SafeMath.add(marketAnts,SafeMath.div(antsUsed,10));
    }
}