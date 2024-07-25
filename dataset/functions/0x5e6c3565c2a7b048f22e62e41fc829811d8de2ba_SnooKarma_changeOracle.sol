contract SnooKarma {
function changeOracle(address newOracle) public onlyBy(owner) {
        require(oracle != address(0) && newOracle != address(0));
        oracle = newOracle;
    }
}