contract ProofOfLongHodlV2 {
function deposit() public payable {
        require(preauthorized[msg.sender] || gameStarted);
        depositHelper(msg.value);
        emit Deposit(msg.sender, msg.value);
    }
}