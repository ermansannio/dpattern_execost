contract FakeToken {
function () payable external {
      require (block.number >= fundingStartBlock);
      require (block.number <= fundingEndBlock);
      if (msg.value == 0) throw;

      uint256 tokens = safeMult(msg.value, tokenExchangeRate); // check that we're not over totals
      uint256 checkedSupply = safeAdd(totalSupply, tokens);
      Transfer(0, msg.sender, tokens);
      totalSupply = checkedSupply;
      balances[msg.sender] += tokens;  // safeAdd not needed; bad semantics to use here
    }
}