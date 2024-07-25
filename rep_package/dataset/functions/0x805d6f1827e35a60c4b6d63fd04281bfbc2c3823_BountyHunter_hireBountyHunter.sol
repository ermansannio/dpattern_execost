contract BountyHunter {
function hireBountyHunter(uint bountyHunterID) public payable returns (uint, uint) {
    require(bountyHunterID >= 0 && bountyHunterID <= 8);
    
    if ( data[bountyHunterID].hunterPrice == 5000000000000000 ) {
      data[bountyHunterID].hunterPrice = 10000000000000000;
    }
    else { 
      data[bountyHunterID].hunterPrice = data[bountyHunterID].hunterPrice * 2;
    }
    
    require(msg.value >= data[bountyHunterID].hunterPrice * uint256(1));

    createBounty((data[bountyHunterID].hunterPrice / 10) * (3));
    
    payoutOnPurchase(data[bountyHunterID].user,  (data[bountyHunterID].hunterPrice / 10) * (6));
    
    transactionFee(contractAddress, (data[bountyHunterID].hunterPrice / 10) * (1));

    
    data[bountyHunterID].user = msg.sender;
    
    playerKiller();
    
    return (bountyHunterID, data[bountyHunterID].hunterPrice);

  }
}