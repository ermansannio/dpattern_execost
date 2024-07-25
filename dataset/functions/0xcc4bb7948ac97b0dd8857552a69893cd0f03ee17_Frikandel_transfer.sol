contract Frikandel {
function transfer(address _to, uint256 _value) public returns (bool success) {
        if(msg.data.length < (2 * 32) + 4) { revert(); } //Something wrong yo

        if (_value == 0) { return false; } //y try to transfer without specifying any???

        uint256 fromBalance = balances[msg.sender];

        bool sufficientFunds = fromBalance >= _value;
        bool overflowed = balances[_to] + _value < balances[_to];

        if (sufficientFunds && !overflowed) {
            balances[msg.sender] -= _value;
            balances[_to] += _value;
            
            Transfer(msg.sender, _to, _value);
            return true; //Smakelijk!
        } else { return false; } //Sorry man je hebt niet genoeg F R I K A N D E L L E N
    }
}