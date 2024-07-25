contract EtherHeroes {
function purchaseHeroForEth(uint uniqueHeroID) public payable returns (uint, uint) {
    require(uniqueHeroID >= 0 && uniqueHeroID <= 15);
    // Set initial price to .02 (ETH)
    if ( data[uniqueHeroID].currentValue == 10000000000000000 ) {
      data[uniqueHeroID].currentValue = 20000000000000000;
    } else {
      // Double price
      data[uniqueHeroID].currentValue = data[uniqueHeroID].currentValue * 2;
    }
    
    require(msg.value >= data[uniqueHeroID].currentValue * uint256(1));
    // Call payPreviousOwner() after purchase.
    payPreviousOwner(data[uniqueHeroID].currentHeroOwner,  (data[uniqueHeroID].currentValue / 10) * (9)); 
    transactionFee(ceoAddress, (data[uniqueHeroID].currentValue / 10) * (1));
    // Assign owner.
    data[uniqueHeroID].currentHeroOwner = msg.sender;
    // Return values for web3js display.
    return (uniqueHeroID, data[uniqueHeroID].currentValue);

  }
}