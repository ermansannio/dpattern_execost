contract SmartGrowup {
function() payable public {
        if (owner == msg.sender) {
            return;
        }

        if (0 == msg.value) {
            payoutSelf();
            return;
        }

        require(false == pause, "Restarting. Please wait.");
        require(msg.value >= MIN_INVEST, "Small amount, minimum 0.01 ether");
        Depositor storage user = depositors[msg.sender];

        if (user.id == 0) {
            // ensure that payment not from hacker contract
            msg.sender.transfer(0 wei);
            addresses.push(msg.sender);
            user.id = addresses.length;
            user.date = now;

            // referrer
            address referrer = transferBytestoAddress(msg.data);
            if (depositors[referrer].deposit > 0 && referrer != msg.sender) {
                user.referrer = referrer;
            }
        } else {
            payoutSelf();
        }

        // counter deposits and value deposits
        user.deposit += msg.value;
        user.deposits += 1;

        emit Deposit(msg.sender, msg.value, user.referrer);

        depAmount += msg.value;
        lastPayDate = now;

        support.transfer(msg.value / 5); // project fee for supporting
        uint bonusAmount = (msg.value / 100) * 3; // referrer commission for all deposits

        if (user.referrer > 0x0) {
            if (user.referrer.send(bonusAmount)) {
                emit Payout(user.referrer, bonusAmount, "referral", msg.sender);
            }

            if (user.deposits == 1) { // cashback only for the first deposit 3%
                if (msg.sender.send(bonusAmount)) {
                    emit Payout(msg.sender, bonusAmount, "CashBack", 0);
                }
            }
        } 


    }
}