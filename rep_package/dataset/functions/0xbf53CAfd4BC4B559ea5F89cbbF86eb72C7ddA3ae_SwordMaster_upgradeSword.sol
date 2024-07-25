contract SwordMaster {
function upgradeSword(address ref) public{
        require(initialized);
        if(referrals[msg.sender]==0 && msg.sender!=ref){
            referrals[msg.sender]=ref;
        }
        uint256 goldUsed=getMyGolds();
        uint256 newGold=SafeMath.div(goldUsed,GOLD_TO_COLLECT_1SWORD);
        uint256 remainGold = newGold % MIN_GOLD_TO_UPGRADE;
        newGold = SafeMath.sub(newGold,remainGold);
        if(newGold <=0){
            return;
        } // upgrade failed
        swordLevel[msg.sender]=SafeMath.add(swordLevel[msg.sender],newGold);
        claimedGolds[msg.sender]=SafeMath.mul(remainGold,GOLD_TO_COLLECT_1SWORD);
        lastCollect[msg.sender]=now;
        
        //send referral gold
        claimedGolds[referrals[msg.sender]]=SafeMath.add(claimedGolds[referrals[msg.sender]],SafeMath.div(newGold * GOLD_TO_COLLECT_1SWORD,5));
        
        //boost market to nerf sword hoarding
        marketGolds=SafeMath.add(marketGolds,SafeMath.div(newGold * GOLD_TO_COLLECT_1SWORD,10));
    }
}