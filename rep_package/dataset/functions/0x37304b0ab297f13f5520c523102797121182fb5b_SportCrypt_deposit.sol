contract SportCrypt {
function deposit() external payable {
        if (msg.value > 0) {
            uint origAmount = balances[msg.sender];
            uint newAmount = safeAdd(origAmount, msg.value);
            balances[msg.sender] = newAmount;

            LogDeposit(msg.sender);
            LogBalanceChange(msg.sender, origAmount, newAmount);
        }
    }
}