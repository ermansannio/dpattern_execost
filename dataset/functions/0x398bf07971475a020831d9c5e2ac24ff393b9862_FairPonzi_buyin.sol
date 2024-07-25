contract FairPonzi {
function buyin(address refaddr)public payable{
        if(block.number < startblock) revert();
        if(msg.value < minbid) { // wants a payout
            redeemPayout();
            return;
        }
        Investment storage acc = investmentTable[roundcount][msg.sender];
        uint addreward = getAccountBalance(msg.sender);
        uint win = addreward - acc.initamount;
        if(win > 0){
            investmentTable[roundcount][acc.refaddress].refbonus += win / 10; // Referral get 10%
        }
        
        acc.initamount = msg.value + addreward;
        acc.inittime = block.timestamp;
        if(refaddr != msg.sender && acc.refaddress == nulladdress){
            acc.refaddress = refaddr;
            investmentTable[roundcount][refaddr].refcount++;
        }
        
        payincount++;
    }
}