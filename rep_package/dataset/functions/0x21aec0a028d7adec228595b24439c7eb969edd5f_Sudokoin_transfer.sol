contract Sudokoin {
function transfer(address _to, uint _value) returns (bool success) {
      require(msg.data.length >= 68);
      require(_to != 0x0); // use burn!
      require(_value <= balances[msg.sender]);
      require(_value + balances[_to] >= balances[_to]);
      balances[msg.sender] -= _value;
      balances[_to] += _value;
      Transfer(msg.sender, _to, _value);
      return true;
  }
}