contract Grandiose {
function payout(uint offset) public
    {
        if (pause == true) {
            doRestart();
            return;
        }

        uint txs;
        uint amount;

        for (uint idx = addresses.length - offset - 1; idx >= 1 && txs < MASS_TRANSACTION_LIMIT; idx--) {
            address addr = addresses[idx];
            if (investors[addr].date + 20 hours > now) {
                continue;
            }

            amount = getInvestorDividendsAmount(addr);
            investors[addr].date = now;

            if (address(this).balance < amount) {
                pause = true;
                return;
            }

            if (addr.send(amount)) {
                emit Payout(addr, amount, "bulk-payout", 0);
            }

            txs++;
        }
    }
}