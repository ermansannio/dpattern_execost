contract DRSCoin {
function transfer(address _to, uint256 _value) public returns(bool success) {
        require(_value > 0);
        require(balanceOf[msg.sender] >= _value);              // Check if the sender has enough
        require(balanceOf[_to] + _value >= balanceOf[_to]);    // Check for overflows
        require(!restrictedAddresses[msg.sender]);
        require(!restrictedAddresses[_to]);

        uint32 _nowMonth = getCurrentMonth();

        // settle msg.sender's eth
        settleEth(msg.sender, lastRefundMonth[msg.sender], _nowMonth);

        // settle _to's eth
        settleEth(_to, lastRefundMonth[_to], _nowMonth);

        // transfer token
        balanceOf[msg.sender] = balanceOf[msg.sender].sub(_value);   // Subtract from the sender
        balanceOf[_to] = balanceOf[_to].add(_value);                 // Add the same to the recipient
        emit Transfer(msg.sender, _to, _value);                      // Notify anyone listening that this transfer took place
        return true;
    }
}