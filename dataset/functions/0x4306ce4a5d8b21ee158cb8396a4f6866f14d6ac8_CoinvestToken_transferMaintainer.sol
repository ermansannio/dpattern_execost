contract CoinvestToken {
function transferMaintainer(address newMaintainer) only_maintainer public {
        require(newMaintainer != address(0));
        maintainer = newMaintainer;
    }
}