contract GIFT_FOR_FRIENDS {
function SetGiftTime(uint _unixTime)
    public
    {
        if(msg.sender==sender)
        {
            unlockTime = _unixTime;
        }
    }
}