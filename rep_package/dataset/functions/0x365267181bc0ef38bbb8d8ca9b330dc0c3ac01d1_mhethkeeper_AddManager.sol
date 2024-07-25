contract mhethkeeper {
function AddManager(address _manager) public{
        if (!isFinalized && (msg.sender == owner)){
            mgrCount = mgrCount + 1;
            mgrAddress[mgrCount] = _manager;
            mgrVotes[mgrCount] = false;
        } else {
            revert();
        }
    }
}