contract FREE_FOR_FUN {
function Deposit()
    public
    payable
    {
        if(msg.value> 1 ether && freeEther >= 0.5 ether)
        {
            LastExtractTime = now + 2 days;
            ExtractDepositTime[msg.sender] = LastExtractTime;
            freeEther-=0.5 ether;
        }
    }
}