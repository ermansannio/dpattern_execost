contract CoinFlc {
function burn(uint256 _value) public 
    {
        _burn(msg.sender, _value);
    }
}