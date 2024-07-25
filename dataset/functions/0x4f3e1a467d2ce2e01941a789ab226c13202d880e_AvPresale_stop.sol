contract AvPresale {
function stop() external
    inStanding(State.PRESALE_RUNNING)
    onlyOwner
    {
        isStopped = true;
    }
}