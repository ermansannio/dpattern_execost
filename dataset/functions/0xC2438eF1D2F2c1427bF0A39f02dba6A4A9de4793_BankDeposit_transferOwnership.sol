contract BankDeposit {
function transferOwnership(address to) public onlyOwner {
        Owner = to;
    }
}