contract EthRoll {
function setCroupier(address newCroupier) external onlyOwner {
        croupier = newCroupier;
    }
}