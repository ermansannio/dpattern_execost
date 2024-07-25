contract Rescue {
function setRescue(address _addr, bool _canRescue) onlyOwner external {
        canRescueMap[_addr] = _canRescue;
    }
}