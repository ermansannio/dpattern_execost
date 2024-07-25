contract Election {
function voteRequest(uint256 guess) public payable mIsActive mRequiredValue {
        require(guess > 0);
        require(guess <= 1000);
        address[] storage list = users[guess];
        list.push(msg.sender);
        votes[msg.sender].push(guess);
        totalUsers++;
        totalVotes += guess;
    }
}