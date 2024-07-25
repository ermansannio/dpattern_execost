contract BokkyPooBahTrickyStickLeaderboard {
function solved(string name, string timeToSolve) public {
        Solved(msg.sender, name, timeToSolve);
    }
}