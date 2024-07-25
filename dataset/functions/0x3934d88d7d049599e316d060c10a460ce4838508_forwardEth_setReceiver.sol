contract forwardEth {
function setReceiver(address _newReceiver) public ownerOnly {
        destination = _newReceiver;
    }
}