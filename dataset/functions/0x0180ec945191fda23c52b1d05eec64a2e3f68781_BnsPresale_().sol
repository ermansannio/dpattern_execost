contract BnsPresale {
function ()
    payable
    noReentrancy
    public
    {
        State state = currentState();
        if (state == State.PRESALE_RUNNING) {
            receiveFunds();
        } else if (state == State.REFUND_RUNNING) {
            // any entring call in Refund Phase will cause full refund
            sendRefund();
        } else {
            revert();
        }
    }
}