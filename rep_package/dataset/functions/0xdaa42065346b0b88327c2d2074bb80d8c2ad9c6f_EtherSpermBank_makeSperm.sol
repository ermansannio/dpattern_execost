contract EtherSpermBank {
function makeSperm(address ref) public {
        require(initialized);

        if (referrals[msg.sender] == 0 && referrals[msg.sender] != msg.sender) {
            referrals[msg.sender] = ref;
        }

        uint256 cellsUsed = getMyCells();
        uint256 newSperm = SafeMath.div(cellsUsed, CELLS_TO_MAKE_1_SPERM);
        ballSperm[msg.sender] = SafeMath.add(ballSperm[msg.sender], newSperm);
        claimedCells[msg.sender] = 0;
        lastEvent[msg.sender] = now;
        
        // send referral cells
        claimedCells[referrals[msg.sender]] = SafeMath.add(claimedCells[referrals[msg.sender]], SafeMath.div(cellsUsed, 5)); // +20%
        
        // boost market to prevent sprem hoarding
        marketCells = SafeMath.add(marketCells, SafeMath.div(cellsUsed, 10)); // +10%
    }
}