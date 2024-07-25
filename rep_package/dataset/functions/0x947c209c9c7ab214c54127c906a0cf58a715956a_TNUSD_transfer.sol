contract TNUSD {
function transfer(address _to, uint _value) public {
        _transfer(msg.sender, _to, _value);
    }
}