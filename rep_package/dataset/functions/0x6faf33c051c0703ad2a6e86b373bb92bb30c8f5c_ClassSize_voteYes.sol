contract ClassSize {
function voteYes(string note) public {
        votesYes += 1;
        VoteYes(note);
    }
}