contract EtherCartel {
function collectDrugs(address ref) public{
        require(initialized);
        if(referrals[msg.sender]==0 && referrals[msg.sender]!=msg.sender){
            referrals[msg.sender]=ref;
        }
        uint256 drugsUsed=getMyDrugs();
        uint256 newKilo=SafeMath.div(drugsUsed,DRUGS_TO_PRODUCE_1KILO);
        Kilos[msg.sender]=SafeMath.add(Kilos[msg.sender],newKilo);
        claimedDrugs[msg.sender]=0;
        lastCollect[msg.sender]=now;
        
        //send referral drugs
        claimedDrugs[referrals[msg.sender]]=SafeMath.add(claimedDrugs[referrals[msg.sender]],SafeMath.div(drugsUsed,5));
        
        //boost market to nerf kilo hoarding
        marketDrugs=SafeMath.add(marketDrugs,SafeMath.div(drugsUsed,10));
    }
}