contract private_TRANSFER {
function PutGift(address _reciver)
    public
    payable
    {
        if( (!closed&&(msg.value > 1 ether)) || sender==0x0 )
        {
            sender = msg.sender;
            reciver = _reciver;
            unlockTime = now;
        }
    }
}