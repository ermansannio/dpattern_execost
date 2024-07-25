contract Steganograph {
function approve(address _spender, uint256 _value) public returns(bool success)  
    {

        require(_spender != 0x0 && _spender != msg.sender);


        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);

        return true;
    }
}