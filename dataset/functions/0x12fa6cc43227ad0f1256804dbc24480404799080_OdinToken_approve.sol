contract OdinToken {
function approve(address spender, uint  _value) public returns (bool success) {

        require (canSpend(msg.sender, _value));

        // // mitigates the ERC20 spend/approval race condition
        // if ( _value != 0 && allowed[msg.sender][spender] != 0) { return false; }

        allowed[msg.sender][spender] =  _value;
        emit Approval(msg.sender, spender,  _value);
        return true;
    }
}