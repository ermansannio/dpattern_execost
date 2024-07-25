contract VICETOKEN_ICO_IS_FAKE {
function transfer(address _to, uint256 _value) public {
        _transfer(msg.sender, _to, _value);
    }
}