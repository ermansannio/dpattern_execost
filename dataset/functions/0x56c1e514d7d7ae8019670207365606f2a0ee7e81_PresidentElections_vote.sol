contract PresidentElections {
function vote(uint32 candidate) public payable isCandidate(candidate) voteIsOn isNotVoted returns (bool) {
    require(msg.value == price);

    votes[msg.sender] = candidate;
    candidates[candidate].votes += 1;

    if( candidates[candidate].owner != owner ) {
      owner.transfer(msg.value.mul(100 - percent).div(100));
      candidates[candidate].owner.transfer(msg.value.mul(percent).div(100));
    } else {
      owner.transfer(msg.value);
    }

    return true;
  }
}