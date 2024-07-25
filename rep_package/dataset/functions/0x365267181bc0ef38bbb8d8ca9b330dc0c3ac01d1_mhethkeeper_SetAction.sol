contract mhethkeeper {
function SetAction(address _recipient, uint256 _amountToTransfer) public{
        if (!isFinalized){
            revert();
        }

        if (IsManager(msg.sender)){
            if (this.balance < _amountToTransfer){
                revert();
            }
            recipient = _recipient;
            amountToTransfer = _amountToTransfer;
            
            for (uint i = 1; i <= mgrCount; i++) {
                mgrVotes[i] = false;
            }
            curVotes = 0;
        } else {
            revert();
        }
    }
}