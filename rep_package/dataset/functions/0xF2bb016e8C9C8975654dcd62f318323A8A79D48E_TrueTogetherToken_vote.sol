contract TrueTogetherToken {
function vote(address _to, uint256 _value) public returns (bool success) {
        require(_to != 0x0 && now < voteEndTime);
        require(balances[msg.sender] >= SafeMath.add(frozen[msg.sender], _value));

        frozen[msg.sender] = SafeMath.add(frozen[msg.sender], _value);
        totalVotes[_to] = SafeMath.add(totalVotes[_to], _value);
        votingInfo[_to][msg.sender] = SafeMath.add(votingInfo[_to][msg.sender], _value);
        emit Vote(msg.sender, _to, _value);
        return true;
    }
}