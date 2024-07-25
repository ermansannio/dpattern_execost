contract AvPresale {
function sendMoneyOwner() external
	inStanding(State.WITHDRAWAL_RUNNING)
    onlyOwner
    noReentrancy
    {
        OWNER.transfer(this.balance);
    }
}