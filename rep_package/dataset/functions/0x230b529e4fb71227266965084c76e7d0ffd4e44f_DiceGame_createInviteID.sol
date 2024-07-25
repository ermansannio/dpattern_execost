contract DiceGame {
function createInviteID(address _addr) public returns (bool) {
        if (playerIdxAddr[_addr] == 0) {
            pID++;
            playerIdxAddr[_addr] = pID;
            playerAddrIdx[pID] = _addr;
            return true;
        }
        return false;
    }
}