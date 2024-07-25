contract NeodiumNetwork {
function StartDistrib() public returns(bool success) {
        if (msg.sender == owner && !DistribStarted && setupDone) {
            DistribStarted = true;
            IsDistribRunning = true;
        } else {
            revert();
        }
        return true;
    }
}