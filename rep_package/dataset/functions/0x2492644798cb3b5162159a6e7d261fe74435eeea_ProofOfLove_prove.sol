contract ProofOfLove {
function prove(string name1, string name2) external {
        count += 1;
        emit Love(name1, name2);
    }
}