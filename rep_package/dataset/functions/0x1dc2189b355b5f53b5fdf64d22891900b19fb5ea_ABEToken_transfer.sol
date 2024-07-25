contract ABEToken {
function transfer(address _to, uint256 _value) public whenNotPaused returns (bool) {
        require(!frozenAccount[msg.sender]);               //Check if the sender is frozen.
        return super.transfer(_to, _value);
    }
}