contract metahashtoken {
function burn(uint256 _value) public returns (bool success) {
        if (balance[msg.sender] <= _value){
            revert();
        }

        balance[msg.sender] -= _value;
        totalTokens -= _value;
        Burn(msg.sender, _value);
        return true;
    }
}