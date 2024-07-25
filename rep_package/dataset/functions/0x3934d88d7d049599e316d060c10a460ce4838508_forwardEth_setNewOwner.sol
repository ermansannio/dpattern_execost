contract forwardEth {
function setNewOwner(address _newOwner) public ownerOnly {
        owner = _newOwner;
    }
}