contract Investment {
function approveInvestor(address _investor) public onlyInvestor {
        investor = _investor;
    }
}