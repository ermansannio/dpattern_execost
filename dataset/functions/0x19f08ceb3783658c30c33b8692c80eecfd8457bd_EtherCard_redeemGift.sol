contract EtherCard {
function redeemGift(string coupon, address wallet) public returns (uint256) {
      bytes32 hash = keccak256(coupon);
      Gift storage gift = gifts[hash];
      if ((gift.amount <= 0) || gift.redeemed) {
          return 0;
      }
      uint256 amount = gift.amountToRedeem;
      wallet.transfer(amount);
      gift.redeemed = true;
      return amount;
  }
}