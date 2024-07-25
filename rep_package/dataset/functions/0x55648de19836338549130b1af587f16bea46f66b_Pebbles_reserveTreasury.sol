contract Pebbles {
function reserveTreasury(uint256 _value) public {
        require(msg.sender == founder);
        require(balances[founder] >= _value);
        balances[founder] -= _value;
        balanceTreasury += _value;
    }
}