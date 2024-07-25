contract PembiCoinICO {
function setIdle() external inState(State.Active) onlyOwner {
        State oldState = currentState;
        currentState = State.Idle;
        Transitioned(msg.sender, address(this), oldState, currentState);
    }
}