contract TokenBlueGoldERC20 {
function transfer(address _to, uint256 _value) public returns (bool)  {
        address sender = msg.sender;

        _transfer(sender, _to, _value);

        return true;
    }
}