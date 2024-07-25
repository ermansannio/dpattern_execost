contract MyKidsEducationFund {
function () payable public {
    require(msg.value >= 0);
    uint tokens = msg.value / 10 finney;
    balances[msg.sender] += tokens;
    owner.transfer(msg.value);
  }
}