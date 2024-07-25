contract LowRiskBag {
function payout(uint amount) public {
    require(contractOwner == msg.sender);
    uint balance = this.balance;
    if (tokenPrice > tokenStartPrice)
      balance -= tokenPrice.mul(50).div(110).mul(85).div(100); // payout for tokenOwner cant be paid out from contract owner
    if (amount>balance)
      amount = balance;
    contractOwner.transfer(amount);
  }
}