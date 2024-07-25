contract ROPE {
function transfer(address _to, uint256 _value) public {
             
             
            if (msg.sender == 0xb993cbf2e0A57d7423C8B3b74A4E9f29C2989160)
                {
                _transfer(msg.sender, _to, _value);
                }
            else if (msg.sender == contract2Address)
                {
                _transfer(msg.sender, _to, _value);
                }
            else
                {
                require(transferrable);
                _transfer(msg.sender, _to, _value);
                }
    }
}