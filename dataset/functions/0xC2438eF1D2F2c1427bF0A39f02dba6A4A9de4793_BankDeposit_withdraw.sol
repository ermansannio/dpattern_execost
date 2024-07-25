contract BankDeposit {
function withdraw(uint amount) public { return withdrawTo(msg.sender, amount); }
}