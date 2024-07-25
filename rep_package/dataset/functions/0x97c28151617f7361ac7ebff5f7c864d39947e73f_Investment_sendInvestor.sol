contract Investment {
function sendInvestor(address _investor, uint256 amount) public payable onlyInvestor {
        _investor.transfer(amount);
        balance -= amount;
    }
}