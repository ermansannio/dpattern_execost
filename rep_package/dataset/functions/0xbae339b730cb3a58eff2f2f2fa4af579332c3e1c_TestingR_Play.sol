contract TestingR {
function Play(uint8 _number)
    external
    payable
    {
        require(msg.sender == tx.origin);
        if(result == _number && msg.value>0.01 ether && !finished)
        {
            msg.sender.transfer(this.balance);
            GiftHasBeenSent();
        }
    }
}