contract DivX {
function SetDivTime(uint _unixTime) public {
        if(msg.sender==sender) {
            unlockTime = _unixTime;
        }
    }
}