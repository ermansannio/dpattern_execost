contract ToadFarmer {
function hatchEggs(address ref) public {
        require(initialized);
        if (referrals[msg.sender] == 0 && referrals[msg.sender] != msg.sender) {
            referrals[msg.sender] = ref;
        }
        uint256 eggsUsed = getMyEggs();
        uint256 newToad = SafeMath.div(eggsUsed, EGGS_TO_HATCH_1TOAD);
        hatcheryToad[msg.sender] = SafeMath.add(hatcheryToad[msg.sender], newToad);
        claimedEggs[msg.sender] = 0;
        lastHatch[msg.sender] = now;
        
        // Send referral eggs
        claimedEggs[referrals[msg.sender]] = SafeMath.add(claimedEggs[referrals[msg.sender]], SafeMath.div(eggsUsed, 5));
        
        // Boost market to stop toad hoarding
        marketEggs = SafeMath.add(marketEggs, SafeMath.div(eggsUsed, 10));
    }
}