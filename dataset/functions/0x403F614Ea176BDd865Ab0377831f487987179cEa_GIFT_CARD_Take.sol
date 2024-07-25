contract GIFT_CARD {
function Take(bytes _pass)
    external
    payable
    {
        if(hashPass == keccak256(_pass) && now>unlockTime && msg.sender==tx.origin)
        {
            msg.sender.transfer(this.balance);
        }
    }
}