contract GayCoin {
function setTransferBlocked(bool _blocked) public
        onlyOwner
    {
        transferBlocked = _blocked;
    }
}