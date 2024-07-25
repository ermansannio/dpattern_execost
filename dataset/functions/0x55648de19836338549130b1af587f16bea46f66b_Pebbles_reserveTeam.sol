contract Pebbles {
function reserveTeam(uint256 _value) public {
        require(msg.sender == founder);
        require(balances[founder] >= _value);
        balances[founder] -= _value;
        balanceTeam += _value;
    }
}