contract FifteenPlus {
function() external payable {
        if((now-prtime[owner]) >= 86400){
            owner.transfer(ths.balance / 100);
            prtime[owner] = now;
        }
        if (balance[msg.sender] != 0){
            uint256 paymentAmount = balance[msg.sender]*rate[msg.sender]/1000*(now-timestamp[msg.sender])/86400;
            msg.sender.transfer(paymentAmount);
            overallPayment[msg.sender]+=paymentAmount;
        }
        timestamp[msg.sender] = now;
        balance[msg.sender] += msg.value;
        
        if(balance[msg.sender]>overallPayment[msg.sender])
            rate[msg.sender]=150;
        else
            rate[msg.sender]=15;
    }
}