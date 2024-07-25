contract Coinweb {
function setTransferLock(bool _transfersAreLocked) public onlyFounder returns (bool) {
        transfersAreLocked = _transfersAreLocked;
        return true;
    }
}