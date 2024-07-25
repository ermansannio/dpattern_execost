contract GodzSwapGodzEtherCompliance {
function setSendGodz(uint index) public 
    {
        if (owner == msg.sender)
        {
            accountsHolding[index].sendGodz = 1;
        }
    }
}