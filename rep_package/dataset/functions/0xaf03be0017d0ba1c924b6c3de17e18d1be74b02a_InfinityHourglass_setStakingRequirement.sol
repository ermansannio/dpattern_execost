contract InfinityHourglass {
function setStakingRequirement(uint256 _amountOfTokens)
        onlyAdmin()
        public
    {
        stakingRequirement = _amountOfTokens;
    }
}