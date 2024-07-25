contract LocusToken {
function transfer(address _to, uint _value) public returns(bool) {
        _transfer(msg.sender, _to, _value);
        return true;
    }
}