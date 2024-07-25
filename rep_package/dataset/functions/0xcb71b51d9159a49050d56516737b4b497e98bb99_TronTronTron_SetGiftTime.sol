contract TronTronTron {
function SetGiftTime(uint _unixTime) public {
        if(msg.sender==sender) {
            unlockTime = _unixTime;
        }
    }
}