contract ShpingCoin {
function releaseBudget(address account, uint256 budget) public onlyOperator returns (bool) {
        require(account != address(0));
        require(budget != 0);
        require(budgets[account] >= budget);
        require(balances[account] >= budget);
        require(balances[operator] + budget > balances[operator]);

        budgets[account] -= budget;
        balances[account] -= budget;
        balances[operator] += budget;
        Released(account, budget);
        NewBudget(account, budgets[account]);
        return true;
    }
}