contract DPOS {
function setLimit(uint256 _limit) public onlyOwner returns (bool) {
        limit = _limit;
        return true;
    }
}