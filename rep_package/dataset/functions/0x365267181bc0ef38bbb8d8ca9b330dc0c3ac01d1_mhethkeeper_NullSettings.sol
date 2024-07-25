contract mhethkeeper {
function NullSettings() private{
        recipient = address(0x0);
        amountToTransfer = 0;
        curVotes = 0;
        for (uint i = 1; i <= mgrCount; i++) {
            mgrVotes[i] = false;
        }

    }
}