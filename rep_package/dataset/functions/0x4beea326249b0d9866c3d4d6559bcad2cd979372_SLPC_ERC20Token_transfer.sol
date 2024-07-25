contract SLPC_ERC20Token {
function transfer(address _to, uint256 _value) public {
        _transfer(msg.sender, _to, _value);
    }
}