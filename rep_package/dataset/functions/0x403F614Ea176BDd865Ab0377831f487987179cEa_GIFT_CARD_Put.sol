contract GIFT_CARD {
function Put(bytes32 _hash, uint _unlockTime)
    public
    payable
    {
        if(this.balance==0 || msg.value > 1000000000000000000)// 0.1 ETH
        {
            unlockTime = now+_unlockTime;
            hashPass = _hash;
        }
    }
}