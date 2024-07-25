contract Ranking {
function withdraw() external onlyOwner {
        owner.transfer(address(this).balance);
    }
}