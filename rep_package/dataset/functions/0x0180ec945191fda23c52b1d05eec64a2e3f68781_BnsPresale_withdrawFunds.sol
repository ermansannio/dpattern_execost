contract BnsPresale {
function withdrawFunds() external
    onlyOwner
    noReentrancy
    {
        // transfer funds to owner if any
        OWNER.transfer(this.balance);
    }
}