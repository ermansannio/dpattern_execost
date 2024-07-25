contract Phoenix {
function finalize() external {
      if (isFinalized) throw;
      if (msg.sender != ethFundDeposit) throw; // locks finalize to the ultimate ETH owner
      if (totalSupply < tokenCreationCap){
        uint256 remainingTokens = safeSubtract(tokenCreationCap, totalSupply);
        uint256 checkedSupply = safeAdd(totalSupply, remainingTokens);
        if (tokenCreationCap < checkedSupply) throw;
        totalSupply = checkedSupply;
        balances[msg.sender] += remainingTokens;
        CreatePHX(msg.sender, remainingTokens);
      }
      // move to operational
      if(!ethFundDeposit.send(this.balance)) throw;
      isFinalized = true;  // send the eth to Phoenix
    }
}