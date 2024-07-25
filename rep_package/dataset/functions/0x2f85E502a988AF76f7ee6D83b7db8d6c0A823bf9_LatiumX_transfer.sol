contract LatiumX {
function transfer(address _to, uint256 _value) {
        // prevent transfer to 0x0 address
        require(_to != 0x0);
        // sender and recipient should be different
        require(msg.sender != _to);
        // check if the sender has enough coins
        require(_value > 0 && balanceOf[msg.sender] >= _value);
        // check for overflows
        require(balanceOf[_to] + _value > balanceOf[_to]);
        // subtract coins from sender's account
        balanceOf[msg.sender] -= _value;
        // add coins to recipient's account
        balanceOf[_to] += _value;
        // notify listeners about this transfer
        Transfer(msg.sender, _to, _value);
    }
}