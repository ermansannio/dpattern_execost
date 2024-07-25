contract PembiCoinICO {
function setActive() external inState(State.Idle) onlyOwner {
        State oldState = currentState;
        currentState = State.Active;
        Transitioned(msg.sender, address(this), oldState, currentState);
    }
}