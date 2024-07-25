contract ETHCOOLMain {
function userWithdraw() public {
        userPayout();
        
        if (user_balances[msg.sender] > 0) {
            uint amount = user_balances[msg.sender];
            user_balances[msg.sender] = 0;
            msg.sender.transfer(amount);
        }
    }
}