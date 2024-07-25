contract Story {
function next(string newPrompt, string choice0, string choice1, string newPrompt2, string choice20, string choice21) public onlyDev returns (bool) {
    if (votes[0] >= votes[1]) {
      history.push(choices[0]);
      StoryUpdate(choices[0], newPrompt);
      prompts.push(newPrompt);
      choices[0] = choice0;
      choices[1] = choice1;
    } else {
      history.push(choices[1]);
      StoryUpdate(choices[0], newPrompt);
      prompts.push(newPrompt2);
      choices[0] = choice20;
      choices[1] = choice21;
    }

    votes[0] = 0;
    votes[1] = 0;
    numVotes = 0;

    iteration = iteration + 1;
    
    payout();

    return true;
  }
}