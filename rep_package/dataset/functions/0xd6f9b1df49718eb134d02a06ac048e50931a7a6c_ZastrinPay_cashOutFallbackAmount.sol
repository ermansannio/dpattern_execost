contract ZastrinPay {
function cashOutFallbackAmount() public onlyOwner {
    owner.transfer(fallbackAmount);
  }
}