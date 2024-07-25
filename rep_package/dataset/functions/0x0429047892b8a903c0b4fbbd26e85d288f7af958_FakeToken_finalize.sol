contract FakeToken {
function finalize() external {
      if (msg.sender != ethFundDeposit) throw; // locks finalize to the ultimate ETH owner
      if(!ethFundDeposit.send(this.balance)) throw;  // send the eth to Brave International
    }
}