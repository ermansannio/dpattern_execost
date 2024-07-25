contract EthMash {
function userChallenge() public payable {
        require(msg.value == 100 finney);
        
        uint random = (uint(blockhash(block.number - 1)) + uint(leader) + uint(msg.sender));
        if (random % 2 == 1) {
            emit Log(msg.sender, leader, true);
            balances[msg.sender] += 100 finney;
            leader = msg.sender;
        } else {
            emit Log(msg.sender, leader, false);
            balances[leader] += 95 finney;
            balances[owner] += 5 finney;
        }
    }
}