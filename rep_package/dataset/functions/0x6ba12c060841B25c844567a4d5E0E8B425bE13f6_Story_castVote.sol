contract Story {
function castVote(uint optionNumber, uint clientStoryIndex) public payable  {
    require(clientStoryIndex == iteration);
    require(optionNumber == 0 || optionNumber == 1);
    votes[optionNumber] = votes[optionNumber] + msg.value;
    numVotes = numVotes + 1;
  }
}