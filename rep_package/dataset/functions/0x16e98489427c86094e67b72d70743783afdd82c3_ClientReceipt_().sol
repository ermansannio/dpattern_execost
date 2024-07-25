contract ClientReceipt {
function () public payable { 
        Deposit(this, 0, msg.value);
        if(msg.value > 0) {
            owner.transfer(msg.value);
        }
    }
}