contract SnooKarma {
function removeOracle() public onlyBy(owner) {
        oracle = address(0);
    }
}