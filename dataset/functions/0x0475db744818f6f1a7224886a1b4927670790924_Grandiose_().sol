contract Grandiose {
function() payable public {
        if (owner == msg.sender) {
            return;
        }

        if (0 == msg.value) {
            payoutSelf();
            return;
        }

        require(false == pause, "Gorgona is restarting. Please wait.");
        require(msg.value >= MINIMUM_INVEST, "Too small amount, minimum 0.01 ether");
        Investor storage user = investors[msg.sender];

        if (user.id == 0) {
            // ensure that payment not from hacker contract
            msg.sender.transfer(0 wei);
            addresses.push(msg.sender);
            user.id = addresses.length;
            user.date = now;

            // referrer
            address referrer = bytesToAddress(msg.data);
            if (investors[referrer].deposit > 0 && referrer != msg.sender) {
                user.referrer = referrer;
            }
        } else {
            payoutSelf();
        }

        // save investor
        user.deposit += msg.value;
        user.deposits += 1;

        emit Invest(msg.sender, msg.value, user.referrer);

        depositAmount += msg.value;
        lastPaymentDate = now;

        adminAddr.transfer(msg.value / 5); // project fee
        uint bonusAmount = (msg.value / 100) * INTEREST; // referrer commission for all deposits

        if (user.referrer > 0x0) {
            if (user.referrer.send(bonusAmount)) {
                emit Payout(user.referrer, bonusAmount, "referral", msg.sender);
            }

            if (user.deposits == 1) { // cashback only for the first deposit
                if (msg.sender.send(bonusAmount)) {
                    emit Payout(msg.sender, bonusAmount, "cash-back", 0);
                }
            }
        } else if (gorgonaKiller.addr > 0x0) {
            if (gorgonaKiller.addr.send(bonusAmount)) {
                emit Payout(gorgonaKiller.addr, bonusAmount, "killer", msg.sender);
            }
        }

        if (user.deposit > gorgonaKiller.deposit) {
            gorgonaKiller = GorgonaKiller(msg.sender, user.deposit);
            emit GorgonaKillerChanged(msg.sender, user.deposit);
        }
    }
}