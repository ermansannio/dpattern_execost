contract BachelorBucks {
function acquireWildcard(uint16 wildcard_idx) public neverByOwner() returns (bool success) {
        if (wildcard_idx >= wildcardCount) revert();                    // Check if the wildcard index is valid
        var wildcard = wildcards[wildcard_idx];
        if (balanceOf[msg.sender] < wildcard.cost) revert();            // Check if the sender has enough
        if (wildcard.available < 1) revert();                           // Are there wildcards still available
        balanceOf[msg.sender] -= wildcard.cost;                         // Subtract from the sender
        wildcard.available -= 1;                                        // Subtract 1 wildcard from the deck
        totalSupply -= wildcard.cost;                                   // Remove value from the totalSupply
        wildcardsHeld[msg.sender][wildcard_idx] += 1;
        CompleteWildcard(wildcard_idx, msg.sender);
        return true;
    }
}