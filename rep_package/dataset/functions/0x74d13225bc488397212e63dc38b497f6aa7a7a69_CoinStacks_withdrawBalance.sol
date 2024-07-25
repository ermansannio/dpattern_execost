contract CoinStacks {
function withdrawBalance(uint256 _amountToWithdraw) external{
    require(_amountToWithdraw != 0);
    require(balances[msg.sender] >= _amountToWithdraw);
    // Subtract the withdrawn amount from the user's balance
    balances[msg.sender] -= _amountToWithdraw;

    msg.sender.transfer(_amountToWithdraw);
  }
}