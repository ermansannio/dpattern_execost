contract W4T {
function transfer(address _to, uint256 _value) external {
        _transfer(msg.sender, _to, _value);
    }
}