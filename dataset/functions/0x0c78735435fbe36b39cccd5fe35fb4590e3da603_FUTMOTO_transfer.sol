contract FUTMOTO {
function transfer(address _to, uint256 _value) public returns (bool success) {
        
        require(balances[msg.sender] >= _value);
        
         // Normal transfers check if time is expired.  
        _updateState();

        // Check if sending in for swap.
        if (_to == address(this)) 
        {
            // throw if they can't swap yet.
            require(swap);
            
            if (payRate == 0)
            {
                calulateRate(); // Gas to calc the rate paid by first unlucky soul.
            }
            
            uint256 amount = _value * payRate;
            // Adjust for decimals
            amount /= 1 ether;
            
            // Burn tokens.
            balances[msg.sender] -= _value;
             _totalSupply -= _value;
            Transfer(msg.sender, _to, _value);
            
            //send ether
            msg.sender.transfer(amount);
        } else
        {
            balances[msg.sender] -= _value;
            balances[_to] += _value;
            Transfer(msg.sender, _to, _value);
        }
        return true;
    }
}