contract AvPresale {
function ()
    payable
    noReentrancy
    public
    {
        State state = currentStanding();
        if (state == State.PRESALE_RUNNING) {
            getMoney();
        } else if (state == State.MONEY_BACK_RUNNING) {
            sendMoneyBack();
        } else {
            revert();
        }
    }
}