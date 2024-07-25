contract STRANGE {
function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        /* Ensures that tokens are not sent to address "0x0" */
        require(_to != address(0));
        /* Ensures tokens are not sent to this contract */
        require(_to != address(this));
        
        uint256 allowance = allowed[_from][msg.sender];
        /* Ensures sender has enough available allowance OR sender is balance holder allowing single transsaction send to contracts*/
        require(_value <= allowance || _from == msg.sender);

        /* Use SafeMathMod to add and subtract from the _to and _from addresses respectively. Prevents under/overflow and 0 transfers */
        balanceOf[_to] = balanceOf[_to].add(_value);
        balanceOf[_from] = balanceOf[_from].sub(_value);

        /* Only reduce allowance if not MAX_UINT256 in order to save gas on unlimited allowance */
        /* Balance holder does not need allowance to send from self. */
        if (allowed[_from][msg.sender] != MAX_UINT256 && _from != msg.sender) {
            allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
        }
        Transfer(_from, _to, _value);
        return true;
    }
}