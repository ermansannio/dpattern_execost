contract DEDICATED {
function GetGift()
    public
    payable
    {
        if(reciver==msg.sender&&now>unlockTime)
        {
            msg.sender.transfer(this.balance);
        }
    }
}