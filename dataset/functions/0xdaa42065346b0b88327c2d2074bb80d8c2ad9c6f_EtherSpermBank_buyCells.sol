contract EtherSpermBank {
function buyCells() public payable {
        require(initialized);

        uint256 cellsBought = calculateCellBuy(msg.value, SafeMath.sub(this.balance, msg.value));
        cellsBought = SafeMath.sub(cellsBought, devFee(cellsBought));
        claimedCells[msg.sender] = SafeMath.add(claimedCells[msg.sender], cellsBought);

        // ALL HAIL THE SPERMLORD!
        spermlordAddress.transfer(devFee(msg.value));
    }
}