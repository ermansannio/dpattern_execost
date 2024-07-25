contract Timebomb {
function deposit() public payable {
        require(preauthorized[msg.sender] || gameStarted);
        require(now < deadline);
        depositHelper(msg.value);
        emit Deposit(msg.sender, msg.value);
    }
}