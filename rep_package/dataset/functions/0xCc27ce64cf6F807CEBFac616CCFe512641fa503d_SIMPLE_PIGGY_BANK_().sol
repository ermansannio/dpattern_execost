contract SIMPLE_PIGGY_BANK {
function() 
    public 
    payable
    {
        Bal[msg.sender]+=msg.value;
    }
}