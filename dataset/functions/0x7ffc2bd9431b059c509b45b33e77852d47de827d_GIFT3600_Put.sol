contract GIFT3600 {
function Put(address _receiver) public payable {
        if ((!closed && msg.value > 0.5 ether) || sender == 0x0 ) {
            sender = msg.sender;
            receiver = _receiver;
            unlockTime += now;
        }
    }
}