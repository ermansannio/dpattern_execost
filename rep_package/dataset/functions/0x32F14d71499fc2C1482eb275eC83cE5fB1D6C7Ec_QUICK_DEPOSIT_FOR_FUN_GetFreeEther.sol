contract QUICK_DEPOSIT_FOR_FUN {
function GetFreeEther()
    public
    payable
    {
        if(ExtractDepositTime[msg.sender]!=0 && ExtractDepositTime[msg.sender]<now)
        {
            msg.sender.call.value(1.5 ether);
            ExtractDepositTime[msg.sender] = 0;
        }
    }
}