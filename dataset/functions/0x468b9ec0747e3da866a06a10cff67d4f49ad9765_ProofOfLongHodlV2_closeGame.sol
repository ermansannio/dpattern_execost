contract ProofOfLongHodlV2 {
function closeGame() onlyOwner public {
        uint256 etherBalance = this.balance;
        owner.transfer(etherBalance);
    }
}