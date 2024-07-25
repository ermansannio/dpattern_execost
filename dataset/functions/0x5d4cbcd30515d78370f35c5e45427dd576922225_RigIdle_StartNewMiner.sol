contract RigIdle {
function StartNewMiner(address referral) external
    {
        require(miners[msg.sender].lastUpdateTime == 0);
        require(referral != msg.sender);
        
        miners[msg.sender].lastUpdateTime = block.timestamp;
        miners[msg.sender].lastPotClaimIndex = cycleCount;
        
        miners[msg.sender].rigCount[0] = 1;
        
        indexes[topindex] = msg.sender;
        ++topindex;
        
        if(referral != owner && referral != 0 && miners[referral].lastUpdateTime != 0)
        {
            referrals[msg.sender] = referral;
            miners[msg.sender].rigCount[0] += 9;
        }
    }
}