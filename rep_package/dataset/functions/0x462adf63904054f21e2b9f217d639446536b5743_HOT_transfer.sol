contract HOT {
function transfer(address[] _to, uint256[] _value) public {
    for (uint256 i = 0; i < _to.length; i++)  {
        _transfer(msg.sender, _to[i], _value[i]);
        }
    }
}