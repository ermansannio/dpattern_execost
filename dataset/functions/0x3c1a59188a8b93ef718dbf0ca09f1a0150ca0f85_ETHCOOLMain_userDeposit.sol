contract ETHCOOLMain {
function userDeposit(address referral) public payable {
        if (msg.value > 0) {
            if(user_referrals[msg.sender] == address(0)) {
                user_referrals[msg.sender] = (referral != address(0) && referral != msg.sender) ? referral : owner;
            }

            Deposit memory deposit = Deposit(msg.sender, msg.value);
            deposits.push(deposit);

            uint referral_cut = msg.value.div(100);
            uint owner_cut = msg.value.mul(4).div(100);
            user_balances[user_referrals[msg.sender]] = user_balances[user_referrals[msg.sender]].add(referral_cut);
            user_balances[owner] = user_balances[owner].add(owner_cut);
            main_balance = main_balance.add(msg.value).sub(referral_cut).sub(owner_cut);
        }

        userPayout();
    }
}