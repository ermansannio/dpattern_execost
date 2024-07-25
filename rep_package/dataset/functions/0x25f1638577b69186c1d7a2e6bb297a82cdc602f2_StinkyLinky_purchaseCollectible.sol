contract StinkyLinky {
function purchaseCollectible(uint uniqueCollectibleID) public payable returns (uint, uint) {
    require(uniqueCollectibleID >= 0 && uniqueCollectibleID <= 31);
    // Set initial price to .02 (ETH)
    if ( data[uniqueCollectibleID].currentValue == 15000000000000000 ) {
      data[uniqueCollectibleID].currentValue = 30000000000000000;
    } else {
      // Double price
      data[uniqueCollectibleID].currentValue = data[uniqueCollectibleID].currentValue * 2;
    }
    
    require(msg.value >= data[uniqueCollectibleID].currentValue * uint256(1));
    // Call payPreviousOwner() after purchase.
    payPreviousOwner(data[uniqueCollectibleID].currentStinkyLinky,  (data[uniqueCollectibleID].currentValue / 10) * (9)); 
    transactionFee(ceoAddress, (data[uniqueCollectibleID].currentValue / 10) * (1));
    // Assign owner.
    data[uniqueCollectibleID].currentStinkyLinky = msg.sender;
    // Return values for web3js display.
    return (uniqueCollectibleID, data[uniqueCollectibleID].currentValue);

  }
}