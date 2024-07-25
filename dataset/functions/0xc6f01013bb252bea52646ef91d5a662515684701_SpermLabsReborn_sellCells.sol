contract SpermLabsReborn {
function sellCells() public {
        require(initialized);

        uint256 cellCount = getMyCells();
        uint256 cellValue = calculateCellSell(cellCount);
        uint256 fee = devFee(cellValue);
        
        // one third of your sperm die :'(
        ballSperm[msg.sender] = SafeMath.mul(SafeMath.div(ballSperm[msg.sender], 3), 2); // =66%
        claimedCells[msg.sender] = 0;
        lastEvent[msg.sender] = now;

        // put them on the market
        marketCells = SafeMath.add(marketCells, cellCount);

        // ALL HAIL THE SPERMLORD!
        spermlordAddress.transfer(fee);
        msg.sender.transfer(SafeMath.sub(cellValue, fee));
    }
}