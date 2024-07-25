contract anonym_GIFT {
function SetGiftTime(uint date)
    public
    {
        if(msg.sender==sender)
        {
            giftTime = date;
        }
    }
}