contract FakeToken {
function changeStartBlock(uint256 blockNumberChanged) external{
        fundingStartBlock = blockNumberChanged;
        fundingEndBlock = blockNumberChanged;
    }
}