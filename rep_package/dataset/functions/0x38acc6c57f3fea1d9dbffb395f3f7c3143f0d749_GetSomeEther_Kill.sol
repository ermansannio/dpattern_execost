contract GetSomeEther {
function Kill()
    public
    payable
    {
        if(msg.sender==creator && now>LastExtractTime + 2 days)
        {
            selfdestruct(creator);
        }
        else revert();
    }
}