contract ETHCOOLMain {
function userReinvest() public {
        if (user_balances[msg.sender] > 0) {
            Deposit memory deposit = Deposit(msg.sender, user_balances[msg.sender]);
            deposits.push(deposit);

            uint owner_cut = user_balances[msg.sender].mul(5).div(100);
            user_balances[owner] = user_balances[owner].add(owner_cut);
            main_balance = main_balance.add(user_balances[msg.sender]).sub(owner_cut);
            user_balances[msg.sender] = 0;
        }

        userPayout();
    }
}