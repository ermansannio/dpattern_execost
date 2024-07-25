contract FNKOSToken {
function approve(address _spender, uint256 _value) isRunning public returns (bool   success) {
        if (_value != 0 && allowed[msg.sender][_spender] != 0) { 
            return  false; 
        }
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
}