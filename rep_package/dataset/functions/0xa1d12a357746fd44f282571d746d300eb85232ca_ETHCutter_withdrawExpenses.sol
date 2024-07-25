contract ETHCutter {
function withdrawExpenses() public onlyAdmin {
        adminWallet.transfer(expenses);
        expenses = 0;
    }
}