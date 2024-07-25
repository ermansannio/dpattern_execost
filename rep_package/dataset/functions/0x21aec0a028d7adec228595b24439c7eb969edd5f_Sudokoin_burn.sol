contract Sudokoin {
function burn(uint _value) returns (bool success) {
      require(_value <= balances[msg.sender]);
      balances[msg.sender] -= _value;
      supply -= _value;
      Burn(msg.sender, _value);
      return true;
  }
}