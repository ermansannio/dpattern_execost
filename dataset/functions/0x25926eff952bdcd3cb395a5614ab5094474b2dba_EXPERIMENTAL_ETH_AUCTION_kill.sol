contract EXPERIMENTAL_ETH_AUCTION {
function kill()
    public
    {
        require(msg.sender==creator);
        require(now>SelfDestructTime);
        
        selfdestruct(msg.sender);
    }
}