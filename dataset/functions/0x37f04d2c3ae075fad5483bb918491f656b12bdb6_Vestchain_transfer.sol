contract Vestchain {
function transfer(address _to, uint256 _val)
public returns (bool) {
require(holders[msg.sender] >= _val);
require(msg.sender != _to);
assert(_val <= holders[msg.sender]);
holders[msg.sender] = holders[msg.sender] - _val;
holders[_to] = holders[_to] + _val;
assert(holders[_to] >= _val);
emit Transfer(msg.sender, _to, _val);
return true;
}
}