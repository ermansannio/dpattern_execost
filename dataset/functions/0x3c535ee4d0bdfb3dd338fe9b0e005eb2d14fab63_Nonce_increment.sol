contract Nonce {
function increment() public returns (uint256) {
        value = ++value;
        emit IncrementEvent(msg.sender, value);
        return value;
    }
}