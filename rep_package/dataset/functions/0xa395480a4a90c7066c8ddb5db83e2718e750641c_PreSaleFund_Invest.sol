contract PreSaleFund {
function Invest() 
    public 
    payable 
    {
        if (msg.value > 1 ether)
        {
            investors[msg.sender] += msg.value;
        }
    }
}