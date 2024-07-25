contract EtherCard {
function createGift(bytes32 hashedCoupon) public payable {
        if (msg.value * 1000 < 1) { // Send minimum 0.001 ETH
            return;
        }
        uint256 calculatedFees = msg.value/feeAmount;
        
        var gift = gifts[hashedCoupon];
        gift.amount = msg.value;
        gift.amountToRedeem = msg.value - calculatedFees;
        gift.from = msg.sender;
        gift.redeemed = false;

        //Transfer ether to owner
        owner.transfer(calculatedFees);                
  }
}