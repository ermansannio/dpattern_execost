contract ICOWallet {
function deposit()
    public payable {
        if (msg.value >= 0.25 ether && msg.sender!=0x0)
        {
            Deposit newDeposit;
            newDeposit.buyer = msg.sender;
            newDeposit.amount = msg.value;
            Deposits.push(newDeposit);
            total[msg.sender] += msg.value;
        }
        if (this.balance >= 25 ether)
        {
            isClosed = true;
        }
    }
}