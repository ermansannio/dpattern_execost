contract FakeVote {
function voteFor(address participant, uint256 numVotes) public {

        // overflow protection
        require (voteCount[participant] < voteCount[participant] + numVotes);
        
        // do not allow self-votes
        require(participant != msg.sender);
        
        // do not allow voter to cast more votes than they should be able to
        require(alreadyUsedVotes[msg.sender] + numVotes <= maxNumVotesPerAccount);
        
        // increase vote count
        alreadyUsedVotes[msg.sender] += numVotes;
        
        // register votes;
        voteCount[participant] += numVotes;
    }
}