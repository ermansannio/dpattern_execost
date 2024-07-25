contract ChiPhiCoin {
function transfer(address _to, uint _amount) public returns (bool success) {
        if (balances[msg.sender] >= _amount
            && _amount > 0
            && balances[_to] + _amount > balances[_to]) {
                balances[msg.sender] -= _amount;
                balances[_to] += _amount;
                Transfer(msg.sender, _to, _amount);
                return true;
        }
        else {
            return false;
        }
    }
}