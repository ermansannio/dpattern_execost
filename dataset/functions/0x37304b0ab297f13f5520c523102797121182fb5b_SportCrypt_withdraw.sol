contract SportCrypt {
function withdraw(uint amount) external {
        uint origAmount = balances[msg.sender];
        uint amountToWithdraw = minu256(origAmount, amount);

        if (amountToWithdraw > 0) {
            uint newAmount = origAmount - amountToWithdraw;
            balances[msg.sender] = newAmount;

            LogWithdraw(msg.sender);
            LogBalanceChange(msg.sender, origAmount, newAmount);

            msg.sender.transfer(amountToWithdraw);
        }
    }
}