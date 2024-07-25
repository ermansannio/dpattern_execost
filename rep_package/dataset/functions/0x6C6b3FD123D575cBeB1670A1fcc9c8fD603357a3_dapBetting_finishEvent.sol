contract dapBetting {
function finishEvent(address creator, uint eventId) external{
        require(betEvents[creator][eventId].status == eventStatus.open);
        require(msg.sender == betEvents[creator][eventId].arbitrator);
        betEvents[creator][eventId].status = eventStatus.finished;
        emit eventStatusChanged(1);
    }
}