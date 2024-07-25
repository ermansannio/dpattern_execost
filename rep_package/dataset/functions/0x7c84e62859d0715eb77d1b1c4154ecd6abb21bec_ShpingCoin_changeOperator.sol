contract ShpingCoin {
function changeOperator(address newOperator) public onlyOwner {
        require(newOperator != address(0));
        require(newOperator != operator);
        require(balances[newOperator]+balances[operator] >= balances[newOperator]);
        require(budgets[newOperator]+budgets[operator] >= budgets[newOperator]);

        if (operator != owner) {
            balances[newOperator] += balances[operator];
            budgets[newOperator] += budgets[operator];
            NewBudget(newOperator, budgets[newOperator]);
            Transfer(operator, newOperator, balances[operator]);
            balances[operator] = 0;
            budgets[operator] = 0;
            NewBudget(operator, 0);
        }
        operator = newOperator;
    }
}