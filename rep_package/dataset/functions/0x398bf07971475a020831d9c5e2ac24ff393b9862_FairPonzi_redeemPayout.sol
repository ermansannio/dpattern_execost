contract FairPonzi {
function redeemPayout() public {
        Investment storage acc = investmentTable[roundcount][msg.sender];
        uint addreward = getAccountBalance(msg.sender);
        uint win = addreward - acc.initamount;
        uint payamount = addreward + acc.refbonus;
        if(payamount <= 0) return;
        if(address(this).balance < payamount){
            reset();
        }else{
            payoutList[payoutcount++] = Payment(msg.sender, acc.initamount, payamount);
            acc.initamount = 0;
            acc.refbonus = 0;
            msg.sender.transfer(payamount);
            investmentTable[roundcount][acc.refaddress].refbonus += win / 10; // Referral get 10%
        }
    }
}