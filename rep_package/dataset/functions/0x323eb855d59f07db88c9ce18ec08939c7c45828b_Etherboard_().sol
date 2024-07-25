contract Etherboard {
function () payable {
        // Bid must be larger than minBid
        require(msg.value >= minBid);
        
        // Bid must be multiple of minBid. Remainder is sent back.
        uint256 remainder  = msg.value % minBid;
        uint256 bid_amount = msg.value - remainder;
        
        // If leaderboard is full, bid needs to be larger than the lowest placed leader
        require(!((numLeaders == maxLeaders) && (bid_amount <= leaders[tail].amount)));
        
        // Get leader
        Leader memory leader = popLeader(msg.sender);
        
        // Add to leader's bid
        leader.amount += bid_amount;
        
        // Insert leader in appropriate position
        insertLeader(leader);
        
        // If leaderboard is full, drop last leader
        if (numLeaders > maxLeaders) {
            dropLast();
        }
        
        // Return remainder to sender
        if (remainder > 0) msg.sender.transfer(remainder);
    }
}