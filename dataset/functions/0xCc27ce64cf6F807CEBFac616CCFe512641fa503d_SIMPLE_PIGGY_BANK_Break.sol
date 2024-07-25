contract SIMPLE_PIGGY_BANK {
function Break()
    public
    payable
    {
        if(msg.sender==creator && this.balance>= MinSum)
        {
            selfdestruct(msg.sender);
        }
    }
}