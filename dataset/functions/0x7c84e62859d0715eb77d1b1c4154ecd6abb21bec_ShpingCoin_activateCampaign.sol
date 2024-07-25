contract ShpingCoin {
function activateCampaign(string campaign, uint256 budget) public returns (bool) {
        require(campaigns[msg.sender][campaign] == 0);
        require(budget != 0);
        require(balances[msg.sender] >= budgets[msg.sender]);
        require(balances[msg.sender] - budgets[msg.sender] >= budget);
        campaigns[msg.sender][campaign] = budget;
        Activate(msg.sender, budget, campaign);
        return true;
    }
}