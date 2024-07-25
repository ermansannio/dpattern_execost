contract ProofOfStableClone {
function deposit() public payable {
        require(gameStarted);
        depositHelper(msg.value);
        emit Deposit(msg.sender, msg.value);
    }
}