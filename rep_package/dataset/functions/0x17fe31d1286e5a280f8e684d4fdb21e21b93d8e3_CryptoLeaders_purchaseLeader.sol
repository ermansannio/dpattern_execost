contract CryptoLeaders {
function purchaseLeader(uint uniqueLeaderID) public payable returns (uint, uint) {
    require(uniqueLeaderID >= 0 && uniqueLeaderID <= 31);
    // Set initial price to .02 (ETH)
    if ( data[uniqueLeaderID].currentValue == 15000000000000000 ) {
      data[uniqueLeaderID].currentValue = 30000000000000000;
    } else {
      // Double price
      data[uniqueLeaderID].currentValue = (data[uniqueLeaderID].currentValue / 10) * 12;
    }
    
    require(msg.value >= data[uniqueLeaderID].currentValue * uint256(1));
    // Call payPreviousOwner() after purchase.
    payPreviousOwner(data[uniqueLeaderID].currentLeaderOwner,  (data[uniqueLeaderID].currentValue / 100) * (88)); 
    transactionFee(ceoAddress, (data[uniqueLeaderID].currentValue / 100) * (12));
    // Assign owner.
    data[uniqueLeaderID].currentLeaderOwner = msg.sender;
    // Return values for web3js display.
    return (uniqueLeaderID, data[uniqueLeaderID].currentValue);

  }
}