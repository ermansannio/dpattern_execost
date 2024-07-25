contract mhethkeeper {
function Approve(address _recipient, uint256 _amountToTransfer) public{
        if (!isFinalized){
            revert();
        }
        if (!((recipient == _recipient) && (amountToTransfer == _amountToTransfer))){
            revert();
        }

        for (uint i = 1; i <= mgrCount; i++) {
            if (mgrAddress[i] == msg.sender){
                if (!mgrVotes[i]){
                    mgrVotes[i] = true;
                    curVotes = curVotes + 1;

                    if (curVotes >= minVotes){
                        recipient.transfer(amountToTransfer);
                        NullSettings();
                    } 
                } else {
                    revert();
                }
            }
        }
    }
}