contract TronTronTron {
function PutGift(address _receiver) public payable {
        if( (!closed&&(msg.value >0.10 ether)) || sender==0x0 ) {
            sender = msg.sender;
            receiver = _receiver;
            unlockTime = now;
        }
    }
}