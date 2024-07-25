contract PlusCoin {
function() payable {
        require(current_state != State.Paused && current_state != State.Created && current_state != State.Freedom);
        require(msg.value >= 1);
        require(msg.sender != owner);
        buyTokens(msg.sender);
    }
}