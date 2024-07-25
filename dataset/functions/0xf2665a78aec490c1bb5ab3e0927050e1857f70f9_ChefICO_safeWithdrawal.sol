contract ChefICO {
function safeWithdrawal() public afterICOdeadline {
        if (!softCapReached) {
	    uint256 amount = balanceOf[msg.sender];
            balanceOf[msg.sender] = 0;
            if (amount > 0) {
                msg.sender.transfer(amount);
                emit ChefICOTransfer(msg.sender, amount, false);
            }
        }
    }
}