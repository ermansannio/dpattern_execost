contract contractCreator {
function transfer(address _to, uint256 _value)  public returns (bool) {
        _transfer(msg.sender, _to, _value);
    }
}