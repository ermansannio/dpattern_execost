contract EXPERIMENTAL_ETH_AUCTION {
function ContributionToPrizeFund()
    public
    payable
    {
        PrizeFund+=msg.value;
    }
}