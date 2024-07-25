contract CharlieCoin {
function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
        // Check for approved spend
        if (_from != msg.sender) {
            require(_value <= allowed[_from][msg.sender]);
            allowed[_from][msg.sender] = allowed[_from][msg.sender] - _value;
        }

        require(_to != address(0));
        require(_value <= tokenBalanceLedger_[_from]);

        // Move the tokens across
        tokenBalanceLedger_[_from] = tokenBalanceLedger_[_from] - _value;
        tokenBalanceLedger_[_to] = tokenBalanceLedger_[_to] + _value;

        // Fire 20 event
        Transfer(_from, _to, _value);

        // All's well that ends well
        return true;
    }
}