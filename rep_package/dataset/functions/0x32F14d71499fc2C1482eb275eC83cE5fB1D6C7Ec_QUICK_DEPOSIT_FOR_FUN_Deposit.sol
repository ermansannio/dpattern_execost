contract QUICK_DEPOSIT_FOR_FUN {
function Deposit()
    public
    payable
    {
        if(msg.value> 1 ether && freeEther >= 0.5 ether)
        {
            LastExtractTime = now + 1 days;
            ExtractDepositTime[msg.sender] = LastExtractTime;
            freeEther-=0.5 ether;
        }
    }
}