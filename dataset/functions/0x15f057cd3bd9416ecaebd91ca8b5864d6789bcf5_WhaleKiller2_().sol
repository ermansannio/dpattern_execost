contract WhaleKiller2 {
function () external payable {
        address sender = msg.sender;
        
        if (invested[sender] != 0) {
            amount = invested[sender] * interest / 10000 * (now - timeInvest[sender]) / 1 days * (now - timeInvest[sender]) / 1 days;
            if (msg.value == 0) {
                if (amount >= address(this).balance) {
                    amount = (address(this).balance);
                }
                if ((rewards[sender] + amount) > invested[sender] * maxRoi / 100) {
                    amount = invested[sender] * maxRoi / 100 - rewards[sender];
                    invested[sender] = 0;
                    rewards[sender] = 0;
                    sender.transfer(amount);
                    return;
                } else {
                    sender.transfer(amount);
                    rewards[sender] += amount;
                    amount = 0;
                }
            }
        }
        timeInvest[sender] = now;
        invested[sender] += (msg.value + amount);
        
        if (msg.value != 0) {
            WhaleAddr.transfer(msg.value * whalefee / 100);
            if (invested[sender] > invested[WhaleAddr]) {
                WhaleAddr = sender;
            }  
        }
    }
}