contract mhethkeeper {
function mhethkeeper() public{
        owner = msg.sender;
        isFinalized = false;
        curVotes = 0;
        mgrCount = 0;
        minVotes = 2;
    }
}